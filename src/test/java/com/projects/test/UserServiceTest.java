package com.projects.test;

import javax.annotation.Resource;

import com.projects.service.UserService;

public class UserServiceTest extends BaseApplicationTest {
	@Resource(name="userServiceImpl")
	UserService service;
	
	public void testLogin() throws Exception{
		System.out.println(service.login("mardo","3.1415926"));
	}

}
