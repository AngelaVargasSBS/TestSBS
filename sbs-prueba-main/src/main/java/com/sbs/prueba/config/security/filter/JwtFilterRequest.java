package com.sbs.prueba.config.security.filter;

import com.sbs.prueba.config.security.JWTUtil;
import com.sbs.prueba.domain.service.AuthUserDetailsService;
import com.sbs.prueba.domain.service.impl.UserDetailsService;
import com.sbs.prueba.util.Utils;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtFilterRequest extends OncePerRequestFilter {

    @Autowired
    private JWTUtil jwtUtil;

    @Autowired
    private AuthUserDetailsService authUserDetailsService;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest,
                                    HttpServletResponse httpServletResponse, FilterChain filterChain)
            throws ServletException, IOException {
        String url = httpServletRequest.getRequestURI();
        String authorizationHeader = httpServletRequest.getHeader("Authorization");
        try {
            if (authorizationHeader != null && authorizationHeader.startsWith("Bearer")) {
                String jwt = authorizationHeader.substring(7);
                String username = jwtUtil.extractUsername(jwt);

                if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                    UserDetails userDetails = authUserDetailsService.loadUserByUsername(username);
                    if (jwtUtil.validateToken(jwt, userDetails)) {
                        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
                                userDetails, null, userDetails.getAuthorities());
                        usernamePasswordAuthenticationToken
                                .setDetails(new WebAuthenticationDetailsSource().buildDetails(httpServletRequest));

                        SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                    }
                }
            }

            filterChain.doFilter(httpServletRequest, httpServletResponse);

        } catch (SignatureException | MalformedJwtException e) {
            Utils.sendErrorResponse(httpServletResponse, HttpStatus.BAD_REQUEST, "Token mal formado");
        } catch (ExpiredJwtException e) {
            Utils.sendErrorResponse(httpServletResponse, HttpStatus.UNAUTHORIZED, "Token ha expirado");
        } catch (Exception e) {
            Utils.sendErrorResponse(httpServletResponse, HttpStatus.INTERNAL_SERVER_ERROR, "Error al procesar la solicitud");
        }
    }
}
