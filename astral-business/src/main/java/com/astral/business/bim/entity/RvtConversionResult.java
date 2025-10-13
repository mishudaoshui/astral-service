package com.astral.business.bim.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RvtConversionResult {

    private String conversionStatus;

    private Lb3dEditorBimToGltf item;

    private BigDecimal process;


}
