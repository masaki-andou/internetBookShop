package com.projects.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projects.exception.CustomException;
import com.projects.model.User;
import com.projects.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="userServiceImpl")
	UserService service;
	
	@RequestMapping
	public String returnMain(Model model) {
		model.addAttribute("msg", "错误");
		return "index";
	}
	
	@RequestMapping(value="/loginHandle",method= {RequestMethod.POST})
	public @ResponseBody User login(Model model,String username,String password) {
		User user = null;
		try {
			user = service.login(username, password);
		} catch (Exception e) {
			throw new CustomException(500,"服务器错误");
		}
		return user;
	}
}
