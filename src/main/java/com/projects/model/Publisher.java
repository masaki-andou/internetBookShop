package com.projects.model;

import java.io.Serializable;

public class Publisher implements Serializable {  
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String address;
	private Long phone;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
}
