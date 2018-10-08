package com.projects.model;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable { 
	private static final long serialVersionUID = 1L;
	
	private String ISBN;
	private String title;
	private Date year;
	private Float price;
	private String publisher;
	private Type type;
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getYear() {
		return year;
	}
	public void setYear(Date year) {
		this.year = year;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "Book [ISBN=" + ISBN + ", title=" + title + ", year=" + year + ", price=" + price + ", publisher="
				+ publisher + ", type=" + type + "]";
	}
}
