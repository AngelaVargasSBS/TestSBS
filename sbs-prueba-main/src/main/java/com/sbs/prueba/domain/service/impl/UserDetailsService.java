package com.sbs.prueba.domain.service.impl;

import com.sbs.prueba.config.security.JWTUtil;
import com.sbs.prueba.domain.service.UserDetailService;
import com.sbs.prueba.controller.dto.General.GetResultDTO;
import com.sbs.prueba.controller.dto.UserApp.GetUserAppDto;
import com.sbs.prueba.controller.dto.UserApp.UserAppDTO;
import com.sbs.prueba.domain.builder.ObjectBuilder;
import com.sbs.prueba.domain.entity.UserApp;
import com.sbs.prueba.domain.repository.UserAppRepository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@Service
@CrossOrigin
public class UserDetailsService implements UserDetailService {



    private UserAppRepository userAppRepository;

    @Autowired
    private ObjectBuilder objectBuilder;

    @Autowired
    private JWTUtil jwtUtil;

    @Override
    public UserAppDTO loadUserByUsername(String userName, Integer app) throws UsernameNotFoundException {
        UserAppDTO userDto = null;
        try {
            List<UserApp> userApps = userAppRepository.loginUserApp(userName, app);
            if (userApps.size() > 0) {
                userDto = objectBuilder.map(userApps.get(0), UserAppDTO.class);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener usuario: " + e.getMessage());
        }
        return userDto;
    }

    @Override
    public GetUserAppDto getUserApp(Integer applicationCode, Integer userCode) {
        GetResultDTO getResultDTO;
        GetUserAppDto getUserAppDto = new GetUserAppDto();

        try {

            UserApp userApp = userAppRepository.findUserAppByApplicationCodeAndUserCode(applicationCode, userCode);

            if (userApp == null) {
              new GetUserAppDto().getGetResult();
              new GetResultDTO(2);
            } else {
                getUserAppDto = objectBuilder.map(userApp, GetUserAppDto.class);
            }

        } catch (Exception e) {
            new GetUserAppDto().getGetResult();
            getResultDTO = new GetResultDTO(2);
            getResultDTO.setMessage(e.getMessage());
        }
        return getUserAppDto;
    }

    @Override
    public UserAppDTO getUserAppByUserCode(Integer userCode) {
        GetUserAppDto getUserAppDto = new GetUserAppDto();
        try {
            UserApp userApp = userAppRepository.findUserAppByUserCode(userCode);
            if (userApp == null) {
                getUserAppDto.setGetResult(new GetResultDTO(2));
            } else {
                getUserAppDto = objectBuilder.map(userApp, GetUserAppDto.class);
                getUserAppDto.setGetResult(new GetResultDTO(1));
            }
        } catch (Exception e) {
            getUserAppDto.setGetResult(new GetResultDTO(2, e.getMessage()));
        }
        return getUserAppDto;
    }

    @Override
    public UserAppDTO getUserByTokenAndApp(String token, Integer app) {
        GetUserAppDto getUserAppDto = new GetUserAppDto();
        try {
            if (token != null) {
                String userName = jwtUtil.extractUsername(token.split(" ")[1]);
                List<UserApp> userApps = userAppRepository.loginUserApp(userName, app);
                if (userApps.size() > 0) {
                    getUserAppDto = objectBuilder.map(userApps.get(0), GetUserAppDto.class);
                    getUserAppDto.setGetResult(new GetResultDTO(1));
                }else{
                    getUserAppDto.setGetResult(new GetResultDTO(2));
                }
            }
        } catch (Exception e) {
            getUserAppDto.setGetResult(new GetResultDTO(2, e.getMessage()));
        }
        return getUserAppDto;
    }

}
