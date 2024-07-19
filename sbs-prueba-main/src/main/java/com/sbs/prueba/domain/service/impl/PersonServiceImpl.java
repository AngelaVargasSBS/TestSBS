package com.sbs.prueba.domain.service.impl;


import com.sbs.prueba.controller.dto.Person.*;
import com.sbs.prueba.domain.builder.ObjectBuilder;
import com.sbs.prueba.domain.entity.Person;
import com.sbs.prueba.domain.repository.PersonRepository;
import com.sbs.prueba.domain.service.*;
import com.sbs.prueba.controller.dto.Person.PersonDTO;
import com.sbs.prueba.domain.service.PersonService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.exception.DataException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonRepository personRepository;


    @Autowired
    private ObjectBuilder objectBuilder;


    @Override
    @Transactional(rollbackFor = {DataException.class, Exception.class}, propagation = Propagation.REQUIRED)
    public PersonDTO getPerson(Integer typeDocument, String documentNumber) {
        Person person = personRepository.personByTypeDocumentAndDocumentNumber(typeDocument, documentNumber);
        PersonDTO personDTO = objectBuilder.map(person, PersonDTO.class);
        return personDTO;
    }


}
