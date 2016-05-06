package com.genius.personalsettings.actionbean;

public class UserinfoBean {
	private String id;
	private String name;
	private String username;
	private String address;
	private String phone;
	private String mobile;
	private String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
//id	bigint	Unchecked
//name	varchar(200)	Checked
//username	varchar(200)	Checked
//password	varchar(200)	Checked
//role_id	int	Checked
//department_id	int	Checked
//address	varchar(200)	Checked
//phone	varchar(200)	Checked
//mobile	varchar(200)	Checked
//email	varchar(200)	Checked