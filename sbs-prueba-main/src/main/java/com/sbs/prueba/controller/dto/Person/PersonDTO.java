package com.sbs.prueba.controller.dto.Person;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.validation.constraints.*;


@Data
@Builder(toBuilder = true)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PersonDTO {

    @NotNull
    @Max(value = 99, message = "The type of document cannot be greater than 99")
    @Min(1)
    @ApiModelProperty(notes = "tipo_documento", required = true)
    private Integer typeDocument;

    @NotNull
    @Size(max = 20, min = 1)
    @ApiModelProperty(notes = "numero_documento", required = true)
    private String documentNumber;

    @Max(9)
    @ApiModelProperty(notes = "digito_verificacion_nit")
    private Integer nitVerificationDigit;


    @ApiModelProperty(notes = "fecha_expedicion_documento")
    private String issueDateDocument;

    @ApiModelProperty(notes = "persona_natural")
    private Boolean naturalPerson;

    @Size(max = 50)
    @ApiModelProperty(notes = "nombres")
    private String names;

    @Size(max = 60)
    @ApiModelProperty(notes = "apellido1")
    private String surname;

    @Size(max = 60)
    @ApiModelProperty(notes = "apellido2")
    private String secondSurname;

    @Size(max = 250)
    @ApiModelProperty(notes = "nombre_completo_razon_social")
    private String fullNameBusinessName;

    @Max(9)
    @Min(1)
    @ApiModelProperty(notes = "genero")
    private Integer gender;


    @ApiModelProperty(notes = "fecha_nacimiento")
    private String birthDate;

    @Max(9)
    @Min(1)
    @ApiModelProperty(notes = "estrato")
    private Integer stratum;

    @Size(max = 60)
    @ApiModelProperty(notes = "ocupacion")
    private String occupation;

    @Max(99)
    @ApiModelProperty(notes = "numero_hijos")
    private Integer childrenNumber;

    @Max(999)
    @ApiModelProperty(notes = "origen")
    private Integer origin;


    @ApiModelProperty(notes = "fecha_formulario_sarlaft")
    private String sarlaftFormDate;

    @Max(99)
    @ApiModelProperty(notes = "codigo_estado_civil")
    private Integer maritalStatusCode;

    @Size(max = 60)
    @ApiModelProperty(notes = "profesion_oficio")
    private String professionProfession;

    @Size(max = 2)
    @ApiModelProperty(notes = "pais_nacimiento")
    private String countryOfBirth;

    @Size(max = 2)
    @ApiModelProperty(notes = "departamento_nacimiento")
    private String birthDepartment;

    @Size(max = 6)
    @ApiModelProperty(notes = "municipio_nacimiento")
    private String birthMunicipality;

    @ApiModelProperty(notes = "empleado")
    private Boolean employee;

    @Max(999)
    @ApiModelProperty(notes = "peso")
    private Integer weight;

    @Max(999)
    @ApiModelProperty(notes = "estatura")
    private Integer height;

    @ApiModelProperty(notes = "habeas_data")
    private Boolean habeasData;

    @Size(max = 2)
    @ApiModelProperty(notes = "grupo_sanguineo")
    private String bloodType;

    @ApiModelProperty(notes = "rh_sanguineo")
    private Boolean rhSanguineo;

    @ApiModelProperty(notes = "codigo_eps")
    private String epsCode;

    @Size(max = 60)
    @ApiModelProperty(notes = "descripcion_eps")
    private String epsDescription;


    @ApiModelProperty(notes = "fecha_vigencia_desde_eps")
    private String dateEffectiveFromEps;


    @ApiModelProperty(notes = "fecha_vigencia_hasta_eps")
    private String dateEffectiveToEps;


    @ApiModelProperty(notes = "fecha_creacion")
    private String creationDate;


    @ApiModelProperty(notes = "fecha_actualizacion")
    private String dateUpdate;


    @ApiModelProperty(notes = "fecha_defuncion")
    private String dateOfDeath;

    @ApiModelProperty(notes = "autoriza_historia_clinica")
    private Boolean authorizeMedicalHistory;

    @ApiModelProperty(notes = "sarlaft_vigente")
    private Boolean currentSarlaft;

    @Size(max = 6)
    @ApiModelProperty(notes = "codigo_ciiu")
    private String ciuCode;

    @Size(max = 70)
    @ApiModelProperty(notes = "token_recaudo")
    private String collectiontoken;

    @Size(max = 20)
    @ApiModelProperty(notes = "subtoken_recaudo")
    private String subCollectiontoken;

    @ApiModelProperty(notes = "codigo_regimen_eps")
    private Integer regimenEpsCode;

    @ApiModelProperty(notes = "codigo_estado_afiliacion")
    private Integer statusEpsCode;

    @ApiModelProperty(notes = "codigo_tipo_afiliado_eps")
    private Integer affiliationTypeEpsCode;

    @ApiModelProperty(notes = "id_log_transaccional")
    private Integer transationalLogId;
}