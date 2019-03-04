package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.entity.StudentInfo;
import com.project.service.UserService;

public class addstuinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addstuinfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("userName");
		String uAge =request.getParameter("userAge");
		int userAge = Integer.parseInt(uAge);
		String userAddress = request.getParameter("userAddress");
		String userSex = request.getParameter("userSex");
		String userCellPhone = request.getParameter("userCellphone");
		String userJob = request.getParameter("userJob");
		String userDepartment = request.getParameter("userDepartment");
		StudentInfo stu = new StudentInfo(userName,userAge,userAddress,userSex,userCellPhone,userJob,userDepartment);

		UserService  service = new UserService(); 
		int flag  =  service.saveStuInfo(stu);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if(flag>0){
			out.write("true");
			out.close();
		}else{
	    	out.write("false");
	    	out.close();
		}

	}

}
