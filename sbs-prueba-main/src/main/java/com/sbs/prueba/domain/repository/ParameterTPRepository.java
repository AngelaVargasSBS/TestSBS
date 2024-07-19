package com.sbs.prueba.domain.repository;


import com.sbs.prueba.domain.entity.ParameterTP;
import com.sbs.prueba.domain.entity.ParameterTPKey;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ParameterTPRepository extends CrudRepository<ParameterTP, ParameterTPKey>, JpaSpecificationExecutor<ParameterTP>, PagingAndSortingRepository<ParameterTP, ParameterTPKey> {

    ParameterTP getParameterTPByProductCodeAndPlanCodeAndParameterCodeAndActive(Integer productCode, Integer planCode, Integer parameterCode, Boolean active) throws Exception;

    ParameterTP getParameterTPByParameterDescription(String parameterDescription) throws Exception;

}
