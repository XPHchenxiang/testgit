package com.project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.entity.User;
import com.project.service.UserService;

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		User user = new User(userName);
		UserService service = new UserService();
		
		boolean flag = service.login(user);
		
		if(flag){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("main.jsp");
		}else{
			request.setAttribute("error", "用户名或密码错误,请重新输入！");
			request.setAttribute("username", userName);
			request.setAttribute("password", passWord);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	


}
