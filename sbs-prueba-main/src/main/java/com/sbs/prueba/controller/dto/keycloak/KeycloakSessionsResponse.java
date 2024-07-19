package com.sbs.prueba.controller.dto.keycloak;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class KeycloakSessionsResponse {

  private List<KeycloakSessionDTO> keycloakSessionList;

}
