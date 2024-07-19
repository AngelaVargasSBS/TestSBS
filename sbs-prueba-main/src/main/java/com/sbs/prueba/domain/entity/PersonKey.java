package com.sbs.prueba.domain.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class PersonKey implements Serializable {
    private Integer typeDocument;
    private String documentNumber;
}
