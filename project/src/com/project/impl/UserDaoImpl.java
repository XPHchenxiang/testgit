package com.project.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.dao.UserDao;
import com.project.entity.StudentInfo;
import com.project.entity.User;
import com.project.util.DbUtil;

public class UserDaoImpl implements UserDao{
	
	boolean flag = false;
    DbUtil db  = new DbUtil();
    
	private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Connection conn = db.getConnection();
    
    
	@Override
	public boolean findLogin(User user){
		
		try{
			String sql = "select * from user where username=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());

			rs = pstmt.executeQuery();
			if(rs.next()){
				flag = true;
			}else{
				pstmt.close();
				rs.close();
         		db.closed();
			}
         	
		}catch(Exception e){
			e.printStackTrace();
		}
			return flag;    
	}

	public int doInsert(User user) throws SQLException{
		String sql = "INSERT INTO user(username,pwd,cellphone,email) VALUE(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		pstmt.setString(3, user.getCellPhone());
		pstmt.setString(4, user.getEmail());
	
		int flag =pstmt.executeUpdate();
		if(flag < 0){
			pstmt.close();
			db.closed();
		}else{
			flag = 1;
		}
		return flag;
	}
	
	public  List<StudentInfo>  findStudents()  {	
			List<StudentInfo> list =new ArrayList<StudentInfo>();
			String sql = "select * from studentinfo order by age asc";
			try {
				pstmt  = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				while(rs.next()){
					String userName = rs.getString("username");
					int age = rs.getInt("age");
					String address = rs.getString("address");
					String sex = rs.getString("sex");
					String cellPhone = rs.getString("cellphone");
					String job = rs.getString("job");
					String department = rs.getString("department");

					StudentInfo si = new StudentInfo(userName,age,address,sex,cellPhone,job,department);
					list.add(si);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				try {
					pstmt.close();
					rs.close();
					db.closed();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
						
			return list;	
	}

	@Override
	public List<StudentInfo> findSimpleUser(String name) {
		List<StudentInfo> list =new ArrayList<StudentInfo>();
		String sql = "select * from studentinfo where address like '%" +name+ "%' ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
	
			while(rs.next()){
				String userName = rs.getString("username");
				int age = rs.getInt("age");
				String address = rs.getString("address");
				String sex = rs.getString("sex");
				String cellPhone = rs.getString("cellphone");
				String job = rs.getString("job");
				String department = rs.getString("department");
				StudentInfo si = new StudentInfo(userName,age,address,sex,cellPhone,job,department);
				list.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				db.closed();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public  List<StudentInfo> deleteSimpleUser(String uname) {
		List<StudentInfo> list =new ArrayList<StudentInfo>();
		int flag = -1;
		String sql = "select sid from studentinfo where username=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			int did=-1;
			while(rs.next()){
				did = rs.getInt("sid");
			}

			String sql1 = "delete from studentinfo where sid=? ";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, did);
			flag = pstmt.executeUpdate();
		
			if(flag>0){			
				String sql2= "select * from studentinfo";
				pstmt = conn.prepareStatement(sql2);
				rs = pstmt.executeQuery(sql2);
				
				while(rs.next()){
					String userName = rs.getString("username");
					int age = rs.getInt("age");
					String address = rs.getString("address");
					String sex = rs.getString("sex");
					String cellPhone = rs.getString("cellphone");
					String job = rs.getString("job");
					String department = rs.getString("department");
					StudentInfo si = new StudentInfo(userName,age,address,sex,cellPhone,job,department);
					list.add(si);
				}
			}else{

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public int saveStuInfo(StudentInfo stu){
			int flag = -1;
			String sql = "insert into studentinfo(username,age,address,sex,cellphone,job,department) values(?,?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stu.getUserName());
				pstmt.setInt(2, stu.getAge());
				pstmt.setString(3, stu.getAddress());
				pstmt.setString(4, stu.getSex());
				pstmt.setString(5, stu.getCellPhone());
				pstmt.setString(6, stu.getJob());
				pstmt.setString(7, stu.getDepartment());
				flag = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return flag;	
	}

	@Override
	public int saveEditStuInfo(StudentInfo stu) {
		int flag = -1;
		String sql = "select sid from studentinfo where username=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stu.getUserName());
			rs = pstmt.executeQuery();

			int did=-1;
			while(rs.next()){
				did = rs.getInt("sid");
			}
			
			String sql1 = "delete from studentinfo where sid=? ";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, did);
			pstmt.executeUpdate();
			
			String sql2="insert into studentinfo(username,age,address,sex,cellphone,job,department) values(?,?,?,?,?,?,?)";
			pstmt =conn.prepareStatement(sql2);
			pstmt.setString(1, stu.getUserName());
			pstmt.setInt(2, stu.getAge());
			pstmt.setString(3, stu.getAddress());
			pstmt.setString(4, stu.getSex());
			pstmt.setString(5, stu.getCellPhone());
			pstmt.setString(6, stu.getJob());
			pstmt.setString(7, stu.getDepartment());
			flag = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
