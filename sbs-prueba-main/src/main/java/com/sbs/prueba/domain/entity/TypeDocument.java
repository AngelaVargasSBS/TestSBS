package com.sbs.prueba.domain.entity;

public interface TypeDocument {


    String getInitialsStringDocument();
    String getTypeDocumentBeneficiaryDescription();

    default String getDisplayString() {
        return getInitialsStringDocument();
    }
}
