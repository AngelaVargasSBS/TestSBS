package com.sbs.prueba.controller.dto.UserApp;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;


@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserAppDTO {
    
    @ApiModelProperty(notes = "codigo_aplicativo")
    private Integer applicationCode;

  
    @ApiModelProperty(notes = "codigo_usuario")
    private Integer userCode;

  
    @ApiModelProperty(notes = "codigo_perfil")
    private Integer profileCode;

  
    @ApiModelProperty(notes = "tipo_documento")
    private Integer documentType;

   
    @ApiModelProperty(notes = "numero_documento")
    private String documentNumber;

    @ApiModelProperty(notes = "activo")
    private Boolean active;

 
    @ApiModelProperty(notes = "usuario")
    private String user;

    @ApiModelProperty(notes = "clave")
    private String password;

    @ApiModelProperty(notes = "descripcion_tipo_documento")
    private String documentTypeDescription;

    @ApiModelProperty(notes = "descripcion_codigo_aplicativo")
    private String applicationCodeDescription;

    @ApiModelProperty(notes = "descripcion_codigo_perfil")
    private String profileCodeDescription;

}
