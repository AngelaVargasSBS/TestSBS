package com.sbs.prueba.domain.service;

import com.sbs.prueba.controller.dto.Person.PersonDTO;

public interface PersonService {


    PersonDTO getPerson(Integer typeDocument, String documentNumber);

}
