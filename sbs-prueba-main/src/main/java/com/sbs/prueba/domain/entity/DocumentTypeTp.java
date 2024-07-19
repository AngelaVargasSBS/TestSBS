package com.sbs.prueba.domain.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@IdClass(DocumentTypeTpKey.class)
@Table(name = "tp_tipo_documento", schema = "syli")
public class DocumentTypeTp {

    @Id
    @Column(name = "tipo_documento", updatable = false)
    private Integer documentType;

    @Column(name = "descripcion_tipo_documento")
    private String documentTypeDescription;

    @Column(name = "abreviatura_tipo_documento")
    private String documentTypeAbbreviation;

    @Column(name = "tipo_persona")
    private String personType;

    @Column(name = "activo")
    private Boolean active;
    // Inicia EV-1167
    @Column(name = "exp_regular")
    private String expRegular;

    // Finaliza EV-1167
}