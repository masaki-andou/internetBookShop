package com.projects.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projects.exception.CustomException;
import com.projects.model.BookCustom;
import com.projects.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	@Resource(name="bookServiceImpl")
	BookService service;
	
	@RequestMapping("/queyDataForIndex")
	public @ResponseBody List<BookCustom> queryDataForIndex(){
		List<BookCustom> result = null;
		try {
			result = service.queryDataForIndex();
		} catch (Exception e) {
			throw new CustomException(500,"未知错误");
		}
		return result;
	}
	
	@RequestMapping("/getBookMsg")
	public void getBookMsg(String isbn) {
		
	}
}

