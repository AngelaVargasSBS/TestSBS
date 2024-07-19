package com.sbs.prueba.controller.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.sbs.prueba.util.Constants;
import lombok.Builder;
import lombok.Data;

@Data
@Builder(toBuilder = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class StatusDTO {

    private String code;
    private String message;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String detailMessage;

    public StatusDTO(String message) {
        this.code = Constants.SUCCESS_CODE;
        this.message = message;
        this.detailMessage = null;
    }

    public StatusDTO() {
        this.code = Constants.SUCCESS_CODE;
        this.message = Constants.SUCCESS_MESSAGE;
        this.detailMessage = null;
    }

    public StatusDTO(String code, String message) {
        this.code = code;
        this.message = message;
        this.detailMessage = null;
    }
    public StatusDTO(String code, String message, String detailMessage) {
        this.code = code;
        this.message = message;
        this.detailMessage = detailMessage;
    }
}
