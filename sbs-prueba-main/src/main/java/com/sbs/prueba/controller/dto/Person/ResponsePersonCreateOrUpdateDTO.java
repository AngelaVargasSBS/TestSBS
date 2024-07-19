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
public class ResponsePersonCreateOrUpdateDTO {

    @ApiModelProperty(notes = "Estado")
    public StatusDTO status;

    @ApiModelProperty(notes = "Obtener persona")
    public GetPersonDto getPersonDto;

}
