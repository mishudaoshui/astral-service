package com.astral.business.bim.controller;

import com.alibaba.fastjson2.JSONObject;
import com.astral.business.bim.entity.RvtConversionRequest;
import com.astral.business.bim.entity.RvtConversionResult;
import com.astral.common.result.Result;
import com.astral.common.utils.CommonUtils;
import com.astral.core.config.webSocketConfig.RevitWsClient;
import com.astral.core.config.webSocketConfig.WebSocket;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.astral.business.bim.entity.Astral3DBimToGltf;
import com.astral.business.bim.service.Astral3DBimToGltfService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * BIM模型轻量化(Astral3DBimToGltf)表控制层
 */
@RestController
@RequestMapping("/editor3d/bim2gltf")
public class Astral3DBimToGltfController {
    /**
     * 服务对象
     */
    @Autowired
    private Astral3DBimToGltfService astral3DEditorBimToGltfService;

    @Autowired
    private WebSocket wsocket;

    private RevitWsClient revitWs;

    @Value("${dev.currentAbPath}")
    private String _appPath;

    @Value("${revit.address}")
    private String address;

    @Value("${revit.port}")
    private String port;

    @Value("${revit.path}")
    private String path;

    @Value("${revit.timeout}")
    private int timeout;

    @PostConstruct
    public void init() {
        revitWs = new RevitWsClient(address, port, path, timeout);
        revitWs.start();

        long reconnectInterval = 8 * 60 * 60 * 1000;
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        Runnable reconnectTask = () -> {
            try {
                if (revitWs.isConnected()) {
                    System.out.println("会话已打开，无需重连。");
                    return;
                }
                revitWs.reconnect();
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("重连时发生错误: " + e.getMessage());
            }
        };
        scheduler.scheduleAtFixedRate(reconnectTask, 0, reconnectInterval, TimeUnit.MILLISECONDS);
    }

    @PostMapping("/add")
    public Result<?> post(@RequestBody Astral3DBimToGltf lb3dEditorBimToGltf) {
        return Result.toAjax(astral3DEditorBimToGltfService.save(lb3dEditorBimToGltf));
    }

    @PostMapping("/addAndConversion")
    public Result<?> addAndConversion(HttpServletRequest request, @RequestBody Map<String, Object> reqMap) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String jsonStr = JSONObject.toJSONString(reqMap);
            RvtConversionRequest op = JSONObject.parseObject(jsonStr, RvtConversionRequest.class);
            Astral3DBimToGltf v = JSONObject.parseObject(jsonStr, Astral3DBimToGltf.class);
            v.setOptions(null);
            v.setGltfFilePath("");
            // 添加记录到数据库
            if (!astral3DEditorBimToGltfService.save(v)) {
                return Result.error("保存失败");
            }
            final Astral3DBimToGltf savedV = v;
            // 启动异步转换任务
            CompletableFuture.runAsync(() -> {
                String uName = request.getParameter("uname");
                String bimFilePath = _appPath + "/" + savedV.getBimFilePath();

                if (!revitWs.isConnected()) {
                    wsocket.sendMessage(uName, JSONObject.toJSONString(Result.error("rvt 轻量化服务未连接")));
                    return;
                }
                // 构造转换请求消息
                RvtConversionRequest m = new RvtConversionRequest();
                m.setFileId(savedV.getId());
                m.setFilePath(bimFilePath);
                m.setOptions(op.getOptions());
                m.getOptions().setUseDraco(true);


                try {
                    String sm = JSONObject.toJSONString(m);
//                    String sm = objectMapper.writeValueAsString(m);
                    revitWs.sendMsg(sm);

                    // 读取Revit消息
                    String tmpGltfPath = "";
                    while (true) {
                        String msg = revitWs.readMsg();
                        Map<String, Object> msgMap = objectMapper.readValue(msg, Map.class);
                        if (!bimFilePath.equals(msgMap.get("filePath"))) {
                            System.out.println("文件名对比: " + bimFilePath + " ---- " + msgMap.get("filePath"));
                            continue;
                        }
                        String type = (String) msgMap.get("type");
                        if ("progress".equals(type)) {
                            // 处理进度消息
                            BigDecimal progress = (BigDecimal)msgMap.get("progress");
                            JSONObject webSocketMsg = new JSONObject();
                            webSocketMsg.put("type", "bim2gltf");
                            webSocketMsg.put("subscriber", uName);
                            webSocketMsg.put("data", new RvtConversionResult("progress", savedV,  progress));
                            wsocket.sendMessage(webSocketMsg.toJSONString());
                            continue;
                        } else if ("completed".equals(type)) {
                            // 处理转换完成消息
                            String gltfPath = (String) msgMap.get("gltfPath");
                            savedV.setConversionDuration(new BigDecimal(msgMap.get("runSeconds").toString()));
                            savedV.setConversionStatus(1);

//                            String gltfFilePath = _appPath + savedV.getGltfFilePath();
                            String gltfFileFolderPath = bimFilePath.substring(0, bimFilePath.lastIndexOf("/") + 1);
                            String gltfFilePath = gltfFileFolderPath + gltfPath;
                            tmpGltfPath = gltfFilePath;
                            File gltfFile = new File(gltfFilePath);
                            if (gltfFile.exists()) {
                                savedV.setGltfFileSize(BigDecimal.valueOf(gltfFile.length()));
                            }
                            String uploadGltfDir = "upload/bim/bim2gltf";
                            String uploadGltfPath = uploadGltfDir + "/" + gltfPath;
//                            UpYunUtil.upload(upYunGltfPath, gltfFile);
                            CommonUtils.upload(uploadGltfDir, gltfFile);
                            savedV.setGltfFilePath(uploadGltfPath);
                            // 更新数据库
                            astral3DEditorBimToGltfService.updateById(savedV);
                            // 发送完成消息
                            JSONObject webSocketMsg = new JSONObject();
                            webSocketMsg.put("type", "bim2gltf");
                            webSocketMsg.put("subscriber", uName);
                            webSocketMsg.put("data", new RvtConversionResult("completed", savedV,  BigDecimal.valueOf(100)));
                            wsocket.sendMessage(webSocketMsg.toJSONString());
                            break;
                        } else if ("failed".equals(type)) {
                            // 处理转换失败消息
                            savedV.setGltfFilePath("");
                            savedV.setConversionDuration(BigDecimal.valueOf(0));
                            savedV.setConversionStatus(2);
                            savedV.setGltfFileSize(BigDecimal.valueOf(0));
                            // 更新数据库
                            astral3DEditorBimToGltfService.updateById(savedV);
                            // 发送失败消息
                            JSONObject webSocketMsg = new JSONObject();
                            webSocketMsg.put("type", "bim2gltf");
                            webSocketMsg.put("subscriber", uName);
                            webSocketMsg.put("data", new RvtConversionResult("failed", savedV,  BigDecimal.ZERO));
                            wsocket.sendMessage(webSocketMsg.toJSONString());
                            break;
                        }
                    }
                    if (StringUtils.hasLength(tmpGltfPath)) {
                        // 删除临时文件
                        Files.deleteIfExists(Paths.get(tmpGltfPath));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            return Result.success(savedV);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("fail->" + e.getMessage());
        }
    }

    @GetMapping("/get/{id}")
    public Result<?> getOne(@PathVariable("id") String id) {
        try {
            return Result.success(astral3DEditorBimToGltfService.getById(id));
        } catch (Exception e) {
            return Result.error(e.getMessage());
        }
    }

    @GetMapping("/getAll")
    public Result<?> getAll(HttpServletRequest request) {
        String fieldsStr = request.getParameter("fields");
        List<String> fields = StringUtils.hasLength(fieldsStr) ? Arrays.asList(fieldsStr.split(",")) : new ArrayList<>();
        String limitStr = request.getParameter("limit");
        Integer limit = StringUtils.hasLength(limitStr) ? Integer.parseInt(limitStr) : 10;
        String offsetStr = request.getParameter("offset");
        Integer offset = StringUtils.hasLength(offsetStr) ? Integer.parseInt(offsetStr) : 0;
        String sortbyStr = request.getParameter("sortby");
        List<String> sortby = StringUtils.hasLength(sortbyStr) ? Arrays.asList(sortbyStr.split(",")) : new ArrayList<>();
        String orderStr = request.getParameter("order");
        List<String> order = StringUtils.hasLength(orderStr) ? Arrays.asList(orderStr.split(",")) : new ArrayList<>();
        String queryStr = request.getParameter("query");
        Map<String, String> query = new HashMap<>();
        if (StringUtils.hasLength(queryStr)) {
            try {
                query = Arrays.stream(queryStr.split(",")).map(s -> {
                    String[] split = s.split(":");
                    if (split.length != 2) {
                        throw new IllegalArgumentException("error:无效的查询键/值对");
                    }
                    return split;
                }).collect(Collectors.toMap(s -> s[0], s -> s[1], (v1, v2) -> v1));
            } catch (Exception e) {
                return Result.error(e.getMessage());
            }
        }
        QueryWrapper<Astral3DBimToGltf> queryWrapper = new QueryWrapper<Astral3DBimToGltf>();
        query.forEach((k, v) -> {
            String filedName = StringUtils.replace(k, ".", "__");
            if ("isnull".equals(filedName)) {
                queryWrapper.eq(filedName, "true".equals(v) || "1".equals(v));
            } else {
                queryWrapper.eq(filedName, v);
            }
        });
        if (!CollectionUtils.isEmpty(sortby)) {
            if (sortby.size() == order.size()) {
                for (int i = 0; i < sortby.size(); i++) {
                    if ("desc".equals(order.get(i))) {
                        queryWrapper.orderByDesc(sortby.get(i));
                    } else if ("asc".equals(order.get(i))) {
                        queryWrapper.orderByAsc(sortby.get(i));
                    } else {
                        return Result.error("Error: Invalid order. Must be either [asc|desc]");
                    }
                }

            } else if (order.size() == 1) {
                if ("desc".equals(order.get(0))) {
                    queryWrapper.orderByDesc(sortby);
                } else if ("asc".equals(order.get(0))) {
                    queryWrapper.orderByAsc(sortby);
                }else {
                    return Result.error("Error: Invalid order. Must be either [asc|desc]");
                }
            } else {
                return Result.error("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1");
            }
        } else {
            if (!CollectionUtils.isEmpty(order)) {
                return Result.error("Error: unused 'order' fields");
            }
        }
        Page<Astral3DBimToGltf> page = new Page<>();
        page.setSize(limit);
        page.setCurrent(offset / limit + 1);
        if (!CollectionUtils.isEmpty(fields)) {
            queryWrapper.select(fields);
        }
        try {
            Page<Astral3DBimToGltf> resultPage = astral3DEditorBimToGltfService.page(page, queryWrapper);
            long count = astral3DEditorBimToGltfService.count(queryWrapper);
            JSONObject result = new JSONObject();
            result.put("items", resultPage.getRecords());
            result.put("current", offset + 1);
            result.put("pageSize", limit);
            result.put("pages", (count + limit - 1) / limit);
            result.put("total", count);
            return Result.success(result);
//            return Result.success(astral3DEditorBimToGltfService.page(page, queryWrapper));
        } catch (Exception e) {
            return Result.error(e.getMessage());
        }
    }

    @PutMapping("/update/{id}")
    public Result<?> put(@PathVariable("id") Long id, @RequestBody Astral3DBimToGltf lb3dEditorBimToGltf) {
        lb3dEditorBimToGltf.setId(id);
        return Result.toAjax(astral3DEditorBimToGltfService.updateById(lb3dEditorBimToGltf));
    }

    @DeleteMapping("/del/{id}")
    public Result<?> delete(@PathVariable("id") Long id) {
        return Result.toAjax(astral3DEditorBimToGltfService.removeById(id));
    }

    @PostMapping("/uploadRvt")
    public Result<?> doRvtUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return Result.error("未获取到上传文件！");
        }

        String originalFilename = file.getOriginalFilename();
        String fileExt = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = originalFilename.substring(0, originalFilename.lastIndexOf("."));

        if (!".rvt".equalsIgnoreCase(fileExt)) {
            return Result.error("只能上传rvt文件！");
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String currentDate = sdf.format(new Date());

        // 存储的文件夹
        String saveFolder = "static/tmp/bim/" + currentDate;
        // 存储的路径
        String newFileName = fileName + "-" + System.currentTimeMillis() + fileExt;
        String savePath = saveFolder + "/" + newFileName;
        // 保存位置在 static/upload, 没有文件夹要先创建
        Path path = Paths.get(_appPath + "/" + saveFolder);
        if (!Files.exists(path)) {
            try {
                path = Files.createDirectories(path);
            } catch (IOException e) {
                return Result.error("服务端创建文件夹" + currentDate + "失败！error=" + e.getMessage());
            }
        }

        try {
            file.transferTo(new File(path.toAbsolutePath().toString() + "/" + newFileName));
//            file.transferTo(new File("static/upload/" + savePath));
            return Result.success("上传成功", savePath);
        } catch (IOException e) {
            e.printStackTrace();
            return Result.error("服务器端文件保存失败！error=" + e.getMessage());
        }
    }

}

