package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UserDao;
import com.project.entity.User;
import com.project.impl.UserDaoImpl;

/**
 * Servlet implementation class select
 */
public class select extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public select() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("name");
		User user = new User(userName);
		UserDao dao = new UserDaoImpl();
		boolean flag  =  dao.findLogin(user);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(flag){
			out.write("true");
			out.close();
		}else{
			out.write("false");
			out.close();
		}
	}

}
