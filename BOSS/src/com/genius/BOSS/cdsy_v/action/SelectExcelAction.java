package com.genius.BOSS.cdsy_v.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genius.data.AdvancedSearchAnalysis;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.adminmanager.AOPInstrumenter;
import com.genius.BOSS.cdsy_v.Cdsy_vExt;

public class SelectExcelAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/msexcel;charset=GB2312");
		response.setHeader("Content-Disposition",
				"attachment;filename=filename.xls");

		HttpSession session = request.getSession();
		String requestUrl = "";
		
		

		int pageNo;
		String orderType = request.getParameter("ordertype");
		String searchField = request.getParameter("searchfield");
		String searchValue = request.getParameter("searchvalue");
		String pager = request.getParameter("pager");
		searchValue=org.genius.data.AdvancedSearchAnalysis.adAnalysis(searchField,searchValue);

		String url = request.getRequestURI() + "?";
		String query = request.getQueryString();
		if (query != null && !query.equals("null")) {
			url = request.getRequestURI() + "?" + query;
		} 

		if (url.indexOf("&order") > 0) {
			url = url.substring(0, url.indexOf("&order"));
		}

		if (orderType == null || orderType.equals("null")) {
			orderType = "true";
		}

		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.valueOf(request.getParameter("pageNo")).intValue();
		} else {
			pageNo = 1;
		}

		ArrayList myList = new ArrayList();
		Cdsy_vExt  cdsy_v = new Cdsy_vExt ();
		Logger logger = Logger.getLogger(SelectExcelAction.class);
		logger.fatal(session.getAttribute("name") + " Execute:select() method");
		myList = cdsy_v.select(pageNo, request.getParameter("order"), orderType, searchField, searchValue, pager,null);
		if (myList == null) {
			return new ModelAndView("/error.jsp");
		}

		HSSFWorkbook workbook = cdsy_v.selectExcelSelect();

		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.close();

		return null;
	}
}
