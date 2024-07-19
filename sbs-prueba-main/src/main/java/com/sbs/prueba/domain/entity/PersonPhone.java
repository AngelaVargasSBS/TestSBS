package com.sbs.prueba.domain.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
@IdClass(PersonPhoneKey.class)
@Table(name = "persona_telefono", schema = "syli")
public class PersonPhone {
    @Id
    @Column(name = "tipo_documento", updatable = false)
    private Integer typeDocument;

    @Id
    @Column(name = "numero_documento", updatable = false)
    private String documentNumber;

    @Id
    @Column(name = "codigo_tipo_telefono", updatable = false)
    private Integer phoneTypeCode;

    @Column(name = "telefono")
    private String phone;

    @Column(name = "codigo_pais")
    private String countryCode;

    @Column(name = "origen")
    private Integer origin;
}
