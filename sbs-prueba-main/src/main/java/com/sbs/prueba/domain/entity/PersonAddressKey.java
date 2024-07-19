package com.sbs.prueba.domain.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class PersonAddressKey implements Serializable {

    private Integer typeDocument;
    private String documentNumber;
    private Integer addressTypeCode;
}
