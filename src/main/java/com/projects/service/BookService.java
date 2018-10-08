package com.projects.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.projects.model.BookCustom;

public interface BookService {
	List<BookCustom> queryDataForIndex()throws Exception;
}
