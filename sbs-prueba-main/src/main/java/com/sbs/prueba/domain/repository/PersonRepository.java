package com.sbs.prueba.domain.repository;

import com.sbs.prueba.domain.entity.Person;
import com.sbs.prueba.domain.entity.PersonKey;
import com.sbs.prueba.domain.entity.TypeDocument;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonRepository extends CrudRepository<Person, PersonKey>, JpaSpecificationExecutor<Person> {
    @Query(value = "select * from syli.persona where tipo_documento = :typeDocument and numero_documento= :documentNumber", nativeQuery = true)
    Person personByTypeDocumentAndDocumentNumber(
            @Param("typeDocument") Integer typeDocument,
            @Param("documentNumber") String documentNumber
    );

    @Query(value = "SELECT \n" +
            "syli.tp_tipo_documento.abreviatura_tipo_documento as InitialsStringDocument, \n" +
            "syli.tp_tipo_documento.descripcion_tipo_documento as TypeDocumentBeneficiaryDescription \n" +
            "FROM syli.tp_tipo_documento  \n" +
            "WHERE  syli.tp_tipo_documento.tipo_documento = :typeDocument", nativeQuery = true)
    List<TypeDocument> getTipoDocumentoString(
            @Param("typeDocument") Integer typeDocument
    );

    List<Person> findPersonByTypeDocumentAndDocumentNumber( Integer typeDocument, String documentNumber) throws Exception;

    @Query(value = "SELECT syli.fn_delete_person(:typeDocument, :documentNumber)", nativeQuery = true)
    Person deletePersonByTypeDocumentAndDocumentNumber(
            @Param("typeDocument") Integer typeDocument,
            @Param("documentNumber") String documentNumber
    );

}
