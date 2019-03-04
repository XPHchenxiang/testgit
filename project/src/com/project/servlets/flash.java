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
import com.project.service.UserService;

import net.sf.json.JSONArray;

public class flash extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public flash() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		String uaddress = request.getParameter("userAddress");
		String name = new String(uaddress.getBytes("ISO-8859-1"),"UTF-8");
		UserDao dao = new UserDaoImpl();
		List<StudentInfo> list =new ArrayList<StudentInfo>();
		list = dao.findSimpleUser(name);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserService service = new UserService();
		List<StudentInfo> list = new ArrayList<StudentInfo>();
		list = service.findStudents();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		if("null".equals(list)){
				out.println("对不起，查询失败！");			
		}else{
			JSONArray json = new JSONArray();
			for(StudentInfo sinfo : list){
				JSONObject  jsonObject = new JSONObject(); 
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
