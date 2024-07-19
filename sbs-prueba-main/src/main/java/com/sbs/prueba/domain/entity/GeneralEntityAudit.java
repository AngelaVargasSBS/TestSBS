package com.sbs.prueba.domain.entity;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.util.Date;

@MappedSuperclass
@Data
public class GeneralEntityAudit {
    @Column(name = "fecha_alta", updatable = false)
    private Date highDate;

    @Column(name = "fecha_modificacion")
    private Date modificationDate;
}
