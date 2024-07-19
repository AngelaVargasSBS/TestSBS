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
public class KeycloakAuthDTO  {


  @NotNull
  @ApiModelProperty(notes = "grant_type")
  private String grant_type;

  @NotNull
  @ApiModelProperty(notes = "username")
  private String username;

  @NotNull
  @ApiModelProperty(notes = "password")
  private String password;

  @NotNull
  @ApiModelProperty(notes = "client_id")
  private String client_id;


}


