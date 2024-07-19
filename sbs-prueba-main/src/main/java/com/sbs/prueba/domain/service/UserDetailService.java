package com.sbs.prueba.domain.service;

import com.sbs.prueba.controller.dto.UserApp.GetUserAppDto;
import com.sbs.prueba.controller.dto.UserApp.UserAppDTO;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface UserDetailService {

  UserAppDTO loadUserByUsername(String userName, Integer app) throws UsernameNotFoundException;

  GetUserAppDto getUserApp(Integer applicationCode, Integer userCode) throws Exception;

  UserAppDTO getUserAppByUserCode(Integer userCode);

  UserAppDTO getUserByTokenAndApp(String token, Integer app);
}
