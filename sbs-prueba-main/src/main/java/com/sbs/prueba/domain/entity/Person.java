package com.sbs.prueba.domain.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@IdClass(PersonKey.class)
@Table(name = "persona", schema = "syli")
public class Person extends GeneralEntityAudit{
    @Id
    @Column(name = "tipo_documento", updatable = false)
    private Integer typeDocument;

    @Id
    @Column(name = "numero_documento", updatable = false)
    private String documentNumber;

    @Column(name = "digito_verificacion_nit")
    private Integer nitVerificationDigit;

    @Column(name = "fecha_expedicion_documento")
    private Date issueDateDocument;

    @Column(name = "persona_natural")
    private Boolean naturalPerson;

    @Column(name = "nombres")
    private String names;

    @Column(name = "apellido1")
    private String surname;

    @Column(name = "apellido2")
    private String secondSurname;

    @Column(name = "nombre_completo_razon_social")
    private String fullNameBusinessName;

    @Column(name = "genero")
    private Integer gender;

    @Column(name = "fecha_nacimiento")
    private Date birthDate;

    @Column(name = "estrato")
    private Integer stratum;

    @Column(name = "ocupacion")
    private String occupation;

    @Column(name = "numero_hijos",  updatable = false)//NO PERMITIR ACTUALIZAR LOS HIJOS EN CHDT
    private Integer childrenNumber;

    @Column(name = "origen")
    private Integer origin;

    @Column(name = "fecha_formulario_sarlaft")
    private Date sarlaftFormDate;

    @Column(name = "codigo_estado_civil")
    private Integer maritalStatusCode;

    @Column(name = "profesion_oficio")
    private String professionProfession;

    @Column(name = "pais_nacimiento")
    private String countryOfBirth;

    @Column(name = "departamento_nacimiento")
    private String birthDepartment;

    @Column(name = "municipio_nacimiento")
    private String birthMunicipality;

    @Column(name = "empleado")
    private Boolean employee;

    @Column(name = "peso")
    private Integer weight;

    @Column(name = "estatura")
    private Integer height;

    @Column(name = "habeas_data")
    private Boolean habeasData;

    @Column(name = "grupo_sanguineo")
    private String bloodType;

    @Column(name = "rh_sanguineo")
    private Boolean rhSanguineo;

    @Column(name = "codigo_eps")
    private String epsCode;

    @Column(name = "fecha_vigencia_desde_eps")
    private Date dateEffectiveFromEps;

    @Column(name = "fecha_vigencia_hasta_eps")
    private Date dateEffectiveToEps;

    @Column(name = "fecha_creacion" , updatable = false)
    private Date creationDate;

    @Column(name = "fecha_actualizacion")
    private Date dateUpdate;

    @Column(name = "fecha_defuncion")
    private Date dateOfDeath;

    @Column(name = "autoriza_historia_clinica")
    private Boolean authorizeMedicalHistory;

    @Column(name = "sarlaft_vigente")
    private Boolean currentSarlaft;

    @Column(name = "codigo_ciiu")
    private String ciuCode;

    @Column(name = "token_recaudo")
    private String collectiontoken;

    @Column(name = "subtoken_recaudo")
    private String subCollectiontoken;

    @Column(name = "codigo_regimen_eps")
    private Integer regimenEpsCode;

    @Column(name = "codigo_estado_afiliacion")
    private Integer statusEpsCode;

    @Column(name = "codigo_tipo_afiliado_eps")
    private Integer affiliationTypeEpsCode;

    @Column(name = "id_log_transaccional")
    private Integer transationalLogId;
}
