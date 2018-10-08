package com.projects.model;

import java.io.Serializable;

public class Order implements Serializable { 
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String book_isbn;
	private Long basket_id;
	private Integer number;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBook_isbn() {
		return book_isbn;
	}
	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}
	public Long getBasket_id() {
		return basket_id;
	}
	public void setBasket_id(Long basket_id) {
		this.basket_id = basket_id;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
