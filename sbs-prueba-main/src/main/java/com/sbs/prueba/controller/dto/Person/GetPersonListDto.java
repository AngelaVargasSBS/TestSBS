package com.sbs.prueba.controller.dto.Person;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.sbs.prueba.controller.dto.General.GetResultDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class GetPersonListDto {

    @ApiModelProperty(notes = "ResultadoConsulta")
    public GetResultDTO getResult;

    @ApiModelProperty(notes = "Persona, persona_telefono y persona_dirección ")
    public List<PersonListDTO> personListDTO;

}
