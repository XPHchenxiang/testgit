package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.project.dao.UserDao;
import com.project.entity.StudentInfo;
import com.project.impl.UserDaoImpl;

import net.sf.json.JSONArray;

public class simpleselect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public simpleselect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name = request.getParameter("name");
			UserDao dao = new UserDaoImpl();
			List<StudentInfo> list =new ArrayList<StudentInfo>();
			list = dao.findSimpleUser(name);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			JSONObject  jsonObject = new JSONObject(); 
			for(StudentInfo stu : list){
					jsonObject.put("userName", stu.getUserName());
					jsonObject.put("age", stu.getAge());
					jsonObject.put("address", stu.getAddress());
					jsonObject.put("sex", stu.getSex());
					jsonObject.put("cellPhone", stu.getCellPhone());
					jsonObject.put("job", stu.getJob());
					jsonObject.put("department", stu.getDepartment());
					json.add(jsonObject);
			}		
			out.println(json.toString());
		}
}
