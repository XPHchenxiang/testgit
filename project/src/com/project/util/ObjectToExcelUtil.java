package com.project.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.swing.JOptionPane;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.project.entity.StudentInfo;

public class ObjectToExcelUtil {

	@SuppressWarnings("deprecation")
	public static void studentInfoToExcel(List<StudentInfo> list) throws Exception {
		    // 声明一个工作薄
	        HSSFWorkbook wb = new HSSFWorkbook();
	        //声明一个单子并命名
	        HSSFSheet sheet = wb.createSheet("员工信息表");
	        //给单子名称一个长度
	        sheet.setDefaultColumnWidth((short)15);
	        // 生成一个样式  
	        HSSFCellStyle style = wb.createCellStyle();
	        //创建第一行（也可以称为表头）
	        HSSFRow row = sheet.createRow(0);
	        //样式字体居中
	        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	        //给表头第一行一次创建单元格
	        HSSFCell cell = row.createCell((short) 0);
	        cell.setCellValue("姓名"); 
	        cell.setCellStyle(style);
	        cell = row.createCell( (short) 1);  
	        cell.setCellValue("年龄");  
	        cell.setCellStyle(style);  
	        cell = row.createCell((short) 2);  
	        cell.setCellValue("住址");  
	        cell.setCellStyle(style); 
	        cell = row.createCell((short) 3);  
	        cell.setCellValue("性别");  
	        cell.setCellStyle(style); 
	        cell = row.createCell((short) 4);  
	        cell.setCellValue("手机号码");  
	        cell.setCellStyle(style); 
	        cell = row.createCell((short) 5);  
	        cell.setCellValue("职位");  
	        cell.setCellStyle(style); 
	        cell = row.createCell((short) 6);  
	        cell.setCellValue("部门");  
	        cell.setCellStyle(style); 
	          
	        //向单元格里填充数据
	        for (short i = 0; i < list.size(); i++) {
	                row = sheet.createRow(i + 1);
	                row.createCell(0).setCellValue(list.get(i).getUserName());
	                row.createCell(1).setCellValue(list.get(i).getAge());
	                row.createCell(2).setCellValue(list.get(i).getAddress());
	                row.createCell(3).setCellValue(list.get(i).getSex());
	                row.createCell(4).setCellValue(list.get(i).getCellPhone());
	                row.createCell(5).setCellValue(list.get(i).getJob());
	                row.createCell(6).setCellValue(list.get(i).getDepartment());
	         }
	         
	        try {
	            //默认导出到C盘指定目录下
	            FileOutputStream out = new FileOutputStream("C://work-file/员工信息表.xls");
	            wb.write(out);
	            out.close();
	            JOptionPane.showMessageDialog(null, "导出成功!");
	        } catch (FileNotFoundException e) {
	            JOptionPane.showMessageDialog(null, "导出失败!");
	            e.printStackTrace();
	        } catch (IOException e) {
	            JOptionPane.showMessageDialog(null, "导出失败!");
	            e.printStackTrace();
	        }
	  }
}
