package com.projects.mapper;

import java.util.List;

import com.projects.model.User;
import com.projects.model.UserCustom;
import com.projects.queryVO.UserQueryVO;

public interface UserMapper {
	User findUserById(Long id)throws Exception;
	
	List<UserCustom> findUser(UserQueryVO userVO)throws Exception;
}
