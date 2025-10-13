package com.astral.business.bim.entity;

import lombok.Data;

@Data
public class RvtConversionRequest {

    private Long fileId;

    private String filePath;

    private RvtConversionRequestOptions options;

}
