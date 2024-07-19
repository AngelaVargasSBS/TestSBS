package com.sbs.prueba.config.security;


import com.sbs.prueba.controller.dto.UserApp.UserAppDTO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JWTUtil {

    private static final String KEY = "SBSWEB2021";

    public String generateToken(UserDetails userDetails) {

        return Jwts.builder().setSubject(userDetails.getUsername()).setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 90000000))
                .signWith(SignatureAlgorithm.HS256, KEY).compact();

    }
    public String generateTokenApp(UserAppDTO userDetail) {

      return Jwts.builder()
              .setSubject(userDetail.getUser())
              .setIssuedAt(new Date())
              .claim("user-detail", userDetail)
              .setExpiration(new Date(System.currentTimeMillis() + 90000000))
              .signWith(SignatureAlgorithm.HS256, KEY).compact();

    }

    public Boolean validateToken(String token, UserDetails userDetails) {
        return userDetails.getUsername().equals(extractUsername(token)) && !isTokenExpired(token);
    }

    public String extractUsername(String token) {
        return getClaims(token).getSubject();
    }

    public Boolean isTokenExpired(String token) {
        return getClaims(token).getExpiration().before(new Date());
    }

    public Claims getClaims(String token) {
        return Jwts.parser().setSigningKey(KEY).parseClaimsJws(token).getBody();
    }

}
