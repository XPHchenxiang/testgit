package com.project.entity;

public class User {
	private int id;
	private String userName;
	private String passWord;
	private String cellPhone;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
		
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	
	public User() {
		super();
	}
	
	public User(String userName, String passWord, String cellPhone, String email) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.cellPhone = cellPhone;
		this.email = email;
	}
	
	public User(String userName){
		this.userName = userName;
	}

}
