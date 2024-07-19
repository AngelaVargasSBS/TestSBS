package com.sbs.prueba.domain.repository;

import com.sbs.prueba.domain.entity.DocumentTypeTp;
import com.sbs.prueba.domain.entity.DocumentTypeTpKey;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DocumentTypeTpRepository extends CrudRepository<DocumentTypeTp, DocumentTypeTpKey>, JpaSpecificationExecutor<DocumentTypeTp>, PagingAndSortingRepository<DocumentTypeTp, DocumentTypeTpKey> {
    DocumentTypeTp getDocumentTypeTPByDocumentType(Integer documentType) throws Exception;
    DocumentTypeTp findDocumentTypeTpByDocumentTypeAbbreviation(String abbreviation) throws Exception;
}