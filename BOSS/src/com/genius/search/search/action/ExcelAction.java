package com.genius.search.search.action;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.Excel;

public class ExcelAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/msexcel;charset=GB2312");
		response.setHeader("Content-Disposition",
				"attachment;filename=filename.xls");

		HttpSession session = request.getSession();
		String searchSQL = (String)session.getAttribute("searchsql");
		String search = (String)session.getAttribute("searchid");
		int searchId = Integer.parseInt(search);
//		System.out.println("sql->"+searchSQL);
//		System.out.println("sql2>"+search);
		
		Excel  searchExcel = new Excel();

		HSSFWorkbook workbook = searchExcel.selectExcelSelect(searchSQL,searchId);

		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.close();

		return new ModelAndView("");
	}
}
