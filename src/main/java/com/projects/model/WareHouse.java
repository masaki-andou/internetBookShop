package com.projects.model;

import java.io.Serializable;

public class WareHouse implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long code;
	private String address;
	private Long phone;
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
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
