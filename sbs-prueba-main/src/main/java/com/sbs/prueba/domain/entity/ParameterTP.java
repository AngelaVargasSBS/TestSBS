package com.sbs.prueba.domain.entity;


import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@IdClass(ParameterTPKey.class)
@Table(name = "tp_parametros", schema = "syli")
public class ParameterTP {

    @Id
    @Column(name = "codigo_producto", updatable = false)
    private Integer productCode;

    @Id
    @Column(name = "codigo_plan", updatable = false)
    private Integer planCode;

    @Id
    @Column(name = "codigo_parametro", updatable = false)
    private Integer parameterCode;

    @Column(name = "descripcion_parametro")
    private String parameterDescription;

    @Column(name = "activo")
    private Boolean active;

    @Column(name = "descripcion_parametro1")
    private String parameterDescription1;

    @Column(name = "valor_parametro1")
    private String valueDescription1;

    @Column(name = "descripcion_parametro2")
    private String parameterDescription2;

    @Column(name = "valor_parametro2")
    private String valueDescription2;


    @Column(name = "descripcion_parametro3")
    private String parameterDescription3;

    @Column(name = "valor_parametro3")
    private String valueDescription3;


    @Column(name = "descripcion_parametro4")
    private String parameterDescription4;

    @Column(name = "valor_parametro4")
    private String valueDescription4;


    @Column(name = "descripcion_parametro5")
    private String parameterDescription5;

    @Column(name = "valor_parametro5")
    private String valueDescription5;

    @Column(name = "descripcion_parametro6")
    private String parameterDescription6;

    @Column(name = "valor_parametro6")
    private String valueDescription6;

    @Column(name = "descripcion_parametro7")
    private String parameterDescription7;

    @Column(name = "valor_parametro7")
    private String valueDescription7;


    @Column(name = "fecha_alta")
    private Date highDate;

    @Column(name = "fecha_modificacion")
    private Date modificationDate;
}
