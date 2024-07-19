package com.sbs.prueba.controller.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GeneralFilterReportDTO {

    @ApiModelProperty(notes = "número_páginas", required = true)
    private Integer page;

    @ApiModelProperty(notes = "tamaño_página", required = true)
    private Integer size;

    @ApiModelProperty(notes = "fecha_creación_desde")
    private String creationFromDate;

    @ApiModelProperty(notes = "fecha_creación_hasta")
    private String creationToDate;

    @ApiModelProperty(notes = "tipo_documento")
    private Integer documentType;

    @ApiModelProperty(notes = "numero_documento")
    private String documentNumber;

    @ApiModelProperty(notes = "Código_plan")
    private Integer planCode;

    @ApiModelProperty(notes = "despaginado")
    private Boolean unpaged = false;

    public GeneralFilterReportDTO(Integer page, Integer size, String creationFromDate, String creationToDate, Integer documentType, String documentNumber) {
        this.page = page;
        this.size = size;
        this.creationFromDate = creationFromDate;
        this.creationToDate = creationToDate;
        this.documentType = documentType;
        this.documentNumber = documentNumber;
    }

    public GeneralFilterReportDTO(Integer page, Integer size, String creationFromDate, String creationToDate, Integer planCode) {
        this.page = page;
        this.size = size;
        this.creationFromDate = creationFromDate;
        this.creationToDate = creationToDate;
        this.planCode = planCode;
    }
}

