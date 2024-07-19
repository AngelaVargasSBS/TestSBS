package com.sbs.prueba.controller.dto.General;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetResultDTO {


    @ApiModelProperty(notes = "Resultado consulta")
    private Integer resultCode;

    @ApiModelProperty(notes = "Mensaje_Informativo")
    private String message;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer statusCode;

    public GetResultDTO(Integer resultCode) {
        this.resultCode = resultCode;

        switch (resultCode) {
            case 1: {
                message = "Query Result.";
                statusCode = 200;
                break;
            }
            case 2: {
                message = "No information was found with the parameters entered.";
                statusCode = 400;
                break;
            }
            case 3: {
                message = "The registered information is duplicated.";
                statusCode = 400;
                break;
            }
        }
    }
    public GetResultDTO(Integer resultCode, String message) {
        this.resultCode = resultCode;
        this.message = message;
        switch (resultCode) {
            case 1: {
                statusCode = 200;
                break;
            }
            case 2:
            case 400: {
                statusCode = 400;
                break;
            }
        }
    }

}
