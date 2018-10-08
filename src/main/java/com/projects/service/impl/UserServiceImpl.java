package com.projects.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.projects.mapper.UserMapper;
import com.projects.model.User;
import com.projects.model.UserCustom;
import com.projects.queryVO.UserQueryVO;
import com.projects.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource(name="userMapper")
	UserMapper userMapper;

	@Override
	public User login(String username,String password) throws Exception{
		UserQueryVO userVO = new UserQueryVO();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		userVO.setUser(user);
		
		List<UserCustom> resultList = userMapper.findUser(userVO);
		if(resultList.isEmpty()) {
			return null;
		}
		return resultList.get(0);
	}
	
}
