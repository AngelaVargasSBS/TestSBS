package com.sbs.prueba.config.swagger;

import io.swagger.annotations.Api;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.Pageable;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Collections;


@EnableSwagger2
@Configuration
@Api(value = "SBS - PDF", description = "Generator Pdf", tags = "PDF")
public class SwaggerConfig  {

    private ApiInfo apiInfo() {
        return new ApiInfo("MyApp Rest APIs",
                "APIs for MyApp.",
                "1.0",
                "Api Mercadeo Empresarial",
                new Contact("Angela Vargas", "", "luz.vargas@sbseguros.co"),
                "License of API",
                "API license URL",
                Collections.emptyList());
    }

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
//                .apis(RequestHandlerSelectors.basePackage("com.mercadeo.empresarial.controller"))
                .paths(PathSelectors.any())
//                .apiInfo(apiInfo())
                .build()
                .directModelSubstitute(Pageable.class, SwaggerPageable.class);
    }
}
