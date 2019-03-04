package com.project.entity;

public class StudentInfo {	
	private  String userName;
	private  int age;
	private  String address;
	private  String sex;
	private  String cellPhone;
	private  String job;
	private  String department;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public StudentInfo() {
		super();
	}
	
	public StudentInfo(String userName, int age, String address, String sex, String cellPhone, String job,
			String department) {
		super();
		this.userName = userName;
		this.age = age;
		this.address = address;
		this.sex = sex;
		this.cellPhone = cellPhone;
		this.job = job;
		this.department = department;
	}
	
}
