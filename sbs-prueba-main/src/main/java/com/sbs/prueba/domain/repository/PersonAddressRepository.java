package com.sbs.prueba.domain.repository;

import com.sbs.prueba.domain.entity.PersonAddress;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonAddressRepository extends CrudRepository<PersonAddress, Integer> {

    @Query(value = "select * from syli.persona_direccion where numero_documento= :documentNumber and tipo_documento= :typeDocument order by fecha_alta desc", nativeQuery = true)
    List<PersonAddress> personAddressByDocumentNumberAndTypeDocument(
            @Param("documentNumber") String documentNumber,
            @Param("typeDocument") Integer typeDocument
    );

    List<PersonAddress> getPersonAddressByTypeDocumentAndDocumentNumberOrderByModificationDateDesc(Integer typeDocument, String documentNumber);

    PersonAddress getPersonAddressByTypeDocumentAndDocumentNumberAndAddressTypeCode(Integer typeDocument, String documentNumber, Integer addressTypeCode);

    @Query(value = "select * from syli.persona_direccion where origen = :origin limit 1", nativeQuery = true)
    PersonAddress getPersonAddressByOrigin(@Param("origin") Integer origin);

}
