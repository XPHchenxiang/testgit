package com.project.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.entity.User;
import com.project.service.UserService;

public class insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public insert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doGet(request,response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int flag = -1;
		UserService service = new UserService();
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		String qpassWord = request.getParameter("qpassword");
		String cellPhone = request.getParameter("cellphone");
		String email = request.getParameter("email");

		if(!passWord.equals(qpassWord)){
			request.setAttribute("message", "密码不一致，请重新输入密码！");
			request.getRequestDispatcher("insert.jsp").forward(request, response);
		}else {
				if(" ".equals(cellPhone)){
					cellPhone = null;	
					if(" ".equals(email)){
							email = null;
					}else{
							//不执行任何操作	
					}
				}else{
					if(" ".equals(email)){
							email = null;
					}else{
							//不执行任何操作
					}
				}

				User user = new User(userName,passWord,cellPhone,email);				
				try {
					flag = service.doInsert(user);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}	
			
		if(flag>0){
			HttpSession session = request.getSession();
			session.setAttribute("success", "注册成功！");
			response.sendRedirect(("login.jsp"));
		}else{
			request.setAttribute("message", "注册失败！");
			request.getRequestDispatcher("insert.jsp").forward(request, response);
		}			
	}
}


