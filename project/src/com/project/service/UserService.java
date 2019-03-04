package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.entity.StudentInfo;
import com.project.entity.User;
import com.project.impl.UserDaoImpl;

public class UserService {
	
		UserDaoImpl dao = new UserDaoImpl();
	
		public boolean login(User user){				
				return dao.findLogin(user);	
		}
	
		public int doInsert(User user) throws SQLException{
				return dao.doInsert(user);	
		}
	
		public List<StudentInfo> findStudents(){
				return dao.findStudents();	
		}
	
		public List<StudentInfo> findSimpleUser(String name){		
				return  dao.findSimpleUser(name) ;		
		}
	
		public List<StudentInfo> deleteSimpleUser(String userName){
				return dao.deleteSimpleUser(userName);
		}
	
		public int saveStuInfo(StudentInfo stu){
				return dao.saveStuInfo(stu);	
		}
	
		public int saveEditStuInfo(StudentInfo stu){
				return dao.saveEditStuInfo(stu);
		}
}
