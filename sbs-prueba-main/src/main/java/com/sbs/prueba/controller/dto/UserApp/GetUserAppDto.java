package com.sbs.prueba.controller.dto.UserApp;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.sbs.prueba.controller.dto.General.GetResultDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetUserAppDto extends UserAppDTO {

    @ApiModelProperty(notes = "Resultado_Consulta")
    public GetResultDTO getResult;

}
