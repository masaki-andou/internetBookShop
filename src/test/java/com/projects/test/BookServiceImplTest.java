package com.projects.test;

import javax.annotation.Resource;

import org.junit.Test;

import com.projects.service.BookService;

public class BookServiceImplTest extends BaseApplicationTest{
	@Resource(name="bookServiceImpl")
	BookService bookService;
	
	@Test
	public void test() throws Exception{
		System.out.println(bookService.queryDataForIndex());
	}

}
