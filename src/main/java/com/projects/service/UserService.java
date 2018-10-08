package com.projects.service;

import org.springframework.stereotype.Service;

import com.projects.model.User;

public interface UserService {
	/**
	 * 
	* @Title: login  
	* @Description: 用于测试用户名和密码是否正确，是不是可以登录
	* @param @param username
	* @param @param password 
	* @throws
	 */
	User login(String username, String password) throws Exception;

}