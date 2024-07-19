package com.sbs.prueba.domain.repository;

import com.sbs.prueba.domain.entity.PersonPhone;
import com.sbs.prueba.domain.entity.PersonPhoneKey;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonPhoneRepository extends CrudRepository<PersonPhone, PersonPhoneKey>, JpaSpecificationExecutor<PersonPhone> {

    List<PersonPhone> getPersonPhoneByTypeDocumentAndDocumentNumber(Integer typeDocument, String documentNumber );

    @Query(value = "select * from syli.persona_telefono where numero_documento= :documentNumber", nativeQuery = true)
    List<PersonPhone> personPhonesByDocumentNumber(
            @Param("documentNumber") String documentNumber
    );

    List<PersonPhone> getPersonPhoneByTypeDocumentAndDocumentNumberAndPhoneTypeCode(Integer typeDocument, String documentNumber, Integer phoneTypeCode);

    PersonPhone findByTypeDocumentAndDocumentNumberAndPhoneTypeCode(Integer typeDocument, String documentNumber, Integer phoneTypeCode) throws Exception;



    @Query(value = "select persona_telefono.*\n" +
            "from syli.persona_telefono\n" +
            "         inner join syli.persona on persona.numero_documento = persona_telefono.numero_documento\n" +
            "         inner  join syli.poliza_riesgo_vincula_persona\n" +
            "                   on persona.numero_documento = poliza_riesgo_vincula_persona.numero_documento\n" +
            "\n" +
            "where codigo_tipo_telefono = :phoneTypeCode\n" +
            "  and poliza_riesgo_vincula_persona.codigo_vinculacion_persona = :linkPerson\n" +
            "  and poliza_riesgo_vincula_persona.identificador_unico = :uniqueIdentifier\n" +
            " order by persona_telefono.fecha_alta desc limit 1", nativeQuery = true)
    PersonPhone findPersonPhoneByPhoneTypeCodeAndPolicyAndLinkPerson(
            Integer phoneTypeCode,
            Integer linkPerson,
            Integer uniqueIdentifier) throws  Exception;
}
