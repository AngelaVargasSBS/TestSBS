package com.sbs.prueba.controller;

import com.sbs.prueba.config.security.JWTUtil;
import com.sbs.prueba.controller.dto.UserApp.UserAppDTO;
import com.sbs.prueba.controller.dto.security.AuthenticationRequest;
import com.sbs.prueba.controller.dto.security.AuthenticationResponse;
import com.sbs.prueba.domain.service.impl.UserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/sbs/authentication")
public class AuthenticationController {
  @Autowired
  private UserDetailsService userDetailsService;

  @Autowired
  private JWTUtil jwtUtil;



  @CrossOrigin
  @PostMapping("/auth")
  public ResponseEntity<AuthenticationResponse> createToken(@RequestBody AuthenticationRequest authenticationRequest) {
    try {
      UserAppDTO userDetail = userDetailsService.loadUserByUsername(authenticationRequest.getUser(), authenticationRequest.getApp());
      if(userDetail != null){
        return new ResponseEntity<>(
                new AuthenticationResponse(
                        jwtUtil.generateTokenApp(userDetail),
                        userDetail.getUserCode()
                ),
                HttpStatus.OK
        );
      } else {
        return new ResponseEntity<>(new AuthenticationResponse("", 0), HttpStatus.FORBIDDEN);
      }
    } catch (BadCredentialsException badCredentialsException) {
      return new ResponseEntity<>(new AuthenticationResponse("", 0), HttpStatus.FORBIDDEN);
    }
  }






}
