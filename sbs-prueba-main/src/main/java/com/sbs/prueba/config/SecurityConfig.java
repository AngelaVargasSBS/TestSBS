package com.sbs.prueba.config;


import com.sbs.prueba.config.security.filter.JwtFilterRequest;
import com.sbs.prueba.domain.service.AuthUserDetailsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.CollectionUtils;

import java.util.List;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private AuthUserDetailsService authUserDetailsService;

    @Autowired
    private JwtFilterRequest jwtFilterRequest;

    @Autowired
    private UrlsConfiguration urlsConfiguration;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(authUserDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        authorizationUrlsConfiguration(http, urlsConfiguration.getTokenUrls());
        http.cors();
        http.csrf().disable().authorizeRequests()
                .antMatchers("/api/v1/sbs/authentication/auth", "/css/**").permitAll()
                .anyRequest().authenticated().and().sessionManagement().sessionCreationPolicy(
                SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtFilterRequest, UsernamePasswordAuthenticationFilter.class);

    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/v2/api-docs", "/configuration/ui",
                "/swagger-resources/**", "/configuration/security", "/images/**",
                "/swagger-ui.html", "/webjars/**");
    }

    private void authorizationUrlsConfiguration(HttpSecurity http, List<UrlsConfiguration.Url> tokenUrls) throws Exception {

        if (!CollectionUtils.isEmpty(tokenUrls)) {

            ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry interceptor =
                    http.authorizeRequests();

            for (UrlsConfiguration.Url url : tokenUrls) {

                if (StringUtils.isNotBlank(url.getUrl())) {



                    if (StringUtils.isNotBlank(url.getMethods())) {
                        String[] methods = url.getMethods().split(",");
                        for (int i = 0; i < methods.length; i++) {


                            interceptor
                                    .antMatchers(HttpMethod.resolve(methods[i].toUpperCase()), url.getUrl())
                                    .authenticated();
                        }

                    } else {
                        interceptor.antMatchers(url.getUrl()).authenticated();
                    }
                }
            }
        }
    }



}