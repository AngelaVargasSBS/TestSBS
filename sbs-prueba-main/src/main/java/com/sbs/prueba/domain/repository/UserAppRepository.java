package com.sbs.prueba.domain.repository;



import com.sbs.prueba.domain.entity.UserApp;
import com.sbs.prueba.domain.entity.UserAppKey;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserAppRepository extends CrudRepository<UserApp, UserAppKey> {

    @Query(value = "select * from syli.usuario_app where tipo_documento = :typeDocument and numero_documento= :documentNumber", nativeQuery = true)
    List<UserApp> getUserAppbyDocumentTypeAndDocumentNumber(
            @Param("typeDocument") Integer typeDocument,
            @Param("documentNumber") String documentNumber
    );

    @Query(value = "select * from syli.usuario_app where codigo_aplicativo = :applicationCode and codigo_usuario= :UserCode", nativeQuery = true)
    UserApp getUserAppbyApplicationCodeAndUserCode(
            @Param("applicationCode") Integer applicationCode,
            @Param("UserCode") Integer UserCode
    );


    @Query(value = "select * from syli.usuario_app where codigo_aplicativo = :applicationCode and tipo_documento = :typeDocument and numero_documento= :documentNumber", nativeQuery = true)
    List<UserApp> getUserAppbyApplicationCodeAndTypeDocumentAndDocumentNumber(
            @Param("applicationCode") Integer applicationCode,
            @Param("typeDocument") Integer typeDocument,
            @Param("documentNumber") String documentNumber
    );

    //Query para busqueda de usuario SipaNew se adiciona condición codigo_aplicativo<>1 OAL
    @Query(value = "select * from syli.usuario_app where usuario = :user and codigo_aplicativo = :applicationCode", nativeQuery = true)
    List<UserApp> loginUserApp(
            @Param("user") String user,
            @Param("applicationCode") Integer applicationCode
    );


    @Query(value = "select * from syli.usuario_app where usuario = :user", nativeQuery = true)
    List<UserApp> getUserAppByUser(
            @Param("user") String user
    );


    //List<UserApp> findUserAppByApplicationCodeAndUserCode(Integer applicationCode, Integer userCode) throws Exception;
    UserApp findUserAppByApplicationCodeAndUserCode(Integer applicationCode,Integer userCode) throws Exception;


    @Query(value = "SELECT codigo_usuario\n" +
            "FROM syli.usuario_app\n" +
            "WHERE codigo_aplicativo = :applicationCode\n" +
            "ORDER BY codigo_usuario DESC\n" +
            "LIMIT 1;", nativeQuery = true)
    Integer getLastUserCode(
            @Param("applicationCode") Integer applicationCode
    );

    List<UserApp> getUserAppByApplicationCodeOrderByUserCode(Integer applicationCode) throws Exception;


    @Query(value = "select * from syli.usuario_app where codigo_aplicativo = :applicationCode and numero_documento= :documentNumber", nativeQuery = true)
    UserApp getUserAppbyApplicationCodeAndDocumentNumber(
            @Param("applicationCode") Integer applicationCode,
            @Param("documentNumber") String documentNumber
    );


    @Query(value = "select * from syli.usuario_app where numero_documento= :documentNumber ", nativeQuery = true)
    UserApp getUserAppByDocumentNumber(
            @Param("documentNumber") String documentNumber
    );

    //Query para busqueda de usuario SipaNew Front se adiciona condición codigo_aplicativo<>1 OAL
    @Query(value = "select * from syli.usuario_app where  tipo_documento = :typeDocument and numero_documento= :documentNumber", nativeQuery = true)
    List<UserApp> getUserAppSipaNewFrontByTypeDocumentAndDocumentNumber(
            @Param("typeDocument") Integer typeDocument,
            @Param("documentNumber") String documentNumber
    );

    UserApp findUserAppByUserCode(Integer userCode) throws Exception;
}
