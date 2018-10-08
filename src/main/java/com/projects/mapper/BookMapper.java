package com.projects.mapper;

import java.util.List;

import com.projects.model.BookCustom;

public interface BookMapper {
	List<BookCustom> queryDataForIndex()throws Exception;
}
