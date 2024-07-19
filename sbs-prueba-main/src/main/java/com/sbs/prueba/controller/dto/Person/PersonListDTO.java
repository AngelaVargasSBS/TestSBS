package com.sbs.prueba.controller.dto.Person;

import com.fasterxml.jackson.annotation.JsonInclude;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;


@Data
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PersonListDTO extends PersonDTO {

    @ApiModelProperty(notes = "abreviatura_tipo_documento")
    private String documentTypeAbbreviation;

}
