package com.projects.test;

import javax.annotation.Resource;

import org.junit.Test;

import com.projects.mapper.UserMapper;
import com.projects.model.User;

public class UserMapperTest extends BaseApplicationTest {
	@Resource(name="userMapper")
	UserMapper userMapper;
	
	@Test
	public void findUserByIdtest() throws Exception{
		User user = userMapper.findUserById(1L);
		System.out.println(user);
	}

}
