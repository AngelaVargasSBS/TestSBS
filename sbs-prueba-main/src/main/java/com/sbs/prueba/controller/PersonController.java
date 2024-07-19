package com.sbs.prueba.controller;

import com.sbs.prueba.controller.dto.Person.ResponseGetPersonListDto;
import com.sbs.prueba.controller.dto.StatusDTO;
import com.sbs.prueba.domain.service.PersonService;
import com.sbs.prueba.util.Constants;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/api")
@CrossOrigin(origins= {"*"} )
@RestController
@Validated
@Api(value = "SBS - Person", description = "Operations pertaining to Person", tags = "Person")
public class PersonController {

    @Autowired
    private PersonService personService;



    @ApiOperation(value = "Consult person by type of document and document number.", response = ResponseGetPersonListDto.class)
    @RequestMapping(value = "/v1/sbs/person/typeDocument/{typeDocument}/documentNumber/{documentNumber}", method = RequestMethod.GET)
    public ResponseGetPersonListDto getPersonByTypeDocumentAndDocumentNumber( @PathVariable Integer typeDocument, @PathVariable String documentNumber) {

        try {
            return ResponseGetPersonListDto.builder()
                    .statusDTO(new StatusDTO(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE))
                    .getPersonDto(personService.getPerson(typeDocument, documentNumber ))
                    .build();
        }catch (Exception e){
            return ResponseGetPersonListDto.builder()
                    .statusDTO(new StatusDTO("400",e.getMessage()))
                    .getPersonDto(null)
                    .build();
        }
    }


}
