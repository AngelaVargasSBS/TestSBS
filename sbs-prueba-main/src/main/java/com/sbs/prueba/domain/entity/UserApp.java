package com.sbs.prueba.domain.entity;
import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@Table(name = "usuario_app", schema = "syli")
@IdClass(UserAppKey.class)
public class UserApp extends GeneralEntity {

    @Id
    @Column(name = "codigo_aplicativo", updatable = false)
    private Integer applicationCode;

    @Column(name = "codigo_usuario")
    private Integer userCode;

    @Column(name = "codigo_perfil")
    private Integer profileCode;

    @Id
    @Column(name = "tipo_documento", updatable = false)
    private Integer documentType;

    @Id
    @Column(name = "numero_documento", updatable = false)
    private String documentNumber;

    @Column(name = "usuario")
    private String user;


    @Column(name = "clave")
    private String password;


    @Column(name = "codigo_front", updatable = false)
    private Integer frontCode;

}
