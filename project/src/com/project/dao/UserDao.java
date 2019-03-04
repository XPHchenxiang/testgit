package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.project.entity.StudentInfo;
import com.project.entity.User;

public interface UserDao {
	
	public boolean findLogin(User user);
	
	public int doInsert(User user) throws SQLException;
	
	public List<StudentInfo> findStudents();
	
	public List<StudentInfo> findSimpleUser(String name);
	
	public  List<StudentInfo> deleteSimpleUser(String userName);

	public int saveStuInfo(StudentInfo stu);
	
	public int saveEditStuInfo(StudentInfo stu);
	
}
