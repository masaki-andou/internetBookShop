package com.projects.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.projects.mapper.BookMapper;
import com.projects.model.BookCustom;
import com.projects.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	@Resource(name="bookMapper")
	BookMapper bookMapper;
	
	@Override
	public List<BookCustom> queryDataForIndex() throws Exception {
		return bookMapper.queryDataForIndex();
	}
	
}
