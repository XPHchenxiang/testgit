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
import com.project.entity.StudentInfo;
import com.project.service.UserService;

import net.sf.json.JSONArray;

public class deletestuinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deletestuinfo() {
        	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String userName = (String) request.getParameter("name");
			List<StudentInfo> list = new ArrayList<StudentInfo>();
			UserService service = new UserService();
			list = service.deleteSimpleUser(userName);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			JSONArray json = new JSONArray();
			JSONObject  jsonObject = new JSONObject(); 

			if("null".equals(list) || " ".equals(list)){
				System.out.println("对不起，删除失败！");		
			}else{
			for(StudentInfo sinfo : list){
				jsonObject.put("userName", sinfo.getUserName());
				jsonObject.put("age", sinfo.getAge());
				jsonObject.put("address", sinfo.getAddress());
				jsonObject.put("sex", sinfo.getSex());
				jsonObject.put("cellPhone", sinfo.getCellPhone());
				jsonObject.put("job", sinfo.getJob());
				jsonObject.put("department", sinfo.getDepartment());
				json.add(jsonObject);  	
			}
			out.println(json.toString());		
		}
	}
}
