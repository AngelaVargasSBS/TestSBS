package com.sbs.prueba.controller.dto.keycloak;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.validation.constraints.NotNull;

@Data
@Builder
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class KeycloakTokenDTO {


  @NotNull
  @ApiModelProperty(notes = "access_token")
  private String access_token;



}


