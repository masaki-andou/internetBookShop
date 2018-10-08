package com.projects.model;

import java.io.Serializable;

public class Stock implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String book_isbn;
	private String warehouse_id;
	private Integer number;
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public String getWarehouse_id() {
		return warehouse_id;
	}
	public void setWarehouse_id(String warehouse_id) {
		this.warehouse_id = warehouse_id;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
}
