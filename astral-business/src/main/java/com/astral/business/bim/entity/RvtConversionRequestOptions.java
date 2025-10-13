package com.astral.business.bim.entity;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class RvtConversionRequestOptions {

    private Boolean useDraco;

    @JsonAlias("Optimize")
    private Boolean optimize;

    @JsonAlias("ExportProperty")
    private Boolean exportProperty;

    @JsonAlias("View")
    private String view;

    @JsonAlias("ViewName")
    private String viewName;

    @JsonAlias("DisplayStyle")
    private String displayStyle;

    @JsonAlias("CoordinateReference")
    private String coordinateReference;

}
