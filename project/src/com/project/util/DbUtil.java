package com.project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {
	private String URL = "jdbc:mysql://localhost:3306/test";
	private String USER = "root";
    private String PASSWORD = "dj930925";
    private String DRIVER = "com.mysql.jdbc.Driver";
    private Connection conn = null;
  
    PreparedStatement pstmt=null;
    ResultSet rs=null;
   
    public Connection getConnection() {	
    	
		try {
			Class.forName(DRIVER);
			try {
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("获取数据库连接失败！");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("创建驱动失败！");
		}
		
		return conn;		 
    }
   
	public void closed(){
        try {
            if(rs!=null){
               rs.close();
               rs=null;
            }
            if(pstmt!=null){
                pstmt.close();
                pstmt=null;
            }
            if(conn!=null){
                conn.close();
                conn=null;
            }
       } catch (SQLException e) {
           e.printStackTrace();
           System.out.println("关闭con对象失败！");
       }
	}

}
