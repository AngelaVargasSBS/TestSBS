package com.sbs.prueba.domain.entity;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@IdClass(PersonAddressKey.class)
@Table(name = "persona_direccion", schema = "syli")
public class PersonAddress extends GeneralEntityAudit {
    @Id
    @Column(name = "tipo_documento", updatable = false)
    private Integer typeDocument;

    @Id
    @Column(name = "numero_documento", updatable = false)
    private String documentNumber;

    @Id
    @Column(name = "codigo_tipo_direccion", updatable = false)
    private Integer addressTypeCode;

    @Column(name = "direccion")
    private String address;

    @Column(name = "direccion_estandarizada")
    private String standardizedAddress;

    @Column(name = "codigo_postal")
    private String postalCode;

    @Column(name = "codigo_pais")
    private String countryCode;

    @Column(name = "codigo_departamento")
    private String departamentCode;

    @Column(name = "codigo_municipio")
    private String municipalityCode;

    @Column(name = "numero_latitud")
    private BigDecimal latitudeNumber;

    @Column(name = "numero_longitud")
    private BigDecimal lengthNumber;

    @Column(name = "codigo_zona")
    private Integer zoneCode;

    @Column(name = "codigo_localidad")
    private String locationCode;

    @Column(name = "origen")
    private Integer origin;

    @Column(name = "urbana")
    private Boolean isUrban;
}
