package com.project.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.project.entity.StudentInfo;
import com.project.util.ObjectToExcelUtil;

public class exportexcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public exportexcel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<StudentInfo> list = new ArrayList<StudentInfo>();
		 String stus = request.getParameter("ListObject");
		 list = JSON.parseArray(stus,StudentInfo.class);
		 try {
			ObjectToExcelUtil oe = new ObjectToExcelUtil();
			oe.studentInfoToExcel(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
