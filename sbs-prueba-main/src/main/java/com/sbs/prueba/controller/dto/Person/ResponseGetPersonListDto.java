package com.sbs.prueba.controller.dto.Person;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.sbs.prueba.controller.dto.StatusDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseGetPersonListDto {

    @ApiModelProperty(notes = "Estado")
    public StatusDTO statusDTO;

    @ApiModelProperty(notes = "Persona")
    public PersonDTO getPersonDto;

}
