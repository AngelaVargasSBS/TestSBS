package com.sbs.prueba.controller.dto.keycloak;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class KeycloakSessionDTO {


  @NotNull
  @ApiModelProperty(notes = "id")
  private String id;

  @NotNull
  @ApiModelProperty(notes = "username")
  private String username;

  @NotNull
  @ApiModelProperty(notes = "userId")
  private String userId;

  @NotNull
  @ApiModelProperty(notes = "ipAddress")
  private String ipAddress;

  @NotNull
  @ApiModelProperty(notes = "start")
  private Long start;

  @NotNull
  @ApiModelProperty(notes = "lastAccess")
  private Long lastAccess;

  @NotNull
  @ApiModelProperty(notes = "clients")
  private Object clients;



}


