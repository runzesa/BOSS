/*
*Generated by LiuRunze. 2016-04-09 15:08:42
*/
package com.genius.BOSS.b_user.action;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genius.data.AdvancedSearchAnalysis;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.adminmanager.AOPInstrumenter;
import com.genius.BOSS.b_user.B_userExt;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.rtf.RtfWriter2;

public class SelectWordAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

       	response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment;filename=filename.doc");
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
        B_userExt  b_user=new B_userExt ();
        Logger logger = Logger.getLogger(SelectWordAction.class);
        logger.fatal(session.getAttribute("name") + " Execute:selectPdfSelect() method");
        myList = b_user.select(pageNo, request.getParameter("order"), orderType, searchField, searchValue, pager,null);
        if (myList == null) {
            return new ModelAndView("/error.jsp");
        }
        
        Document document = new Document(PageSize.A4, 5, 5, 50, 50);
        try {
            RtfWriter2.getInstance(document, response.getOutputStream());
            document.open();
            Table table=b_user.selectWordSelect();
            document.add(table);
        } catch (DocumentException e) {
            e.printStackTrace();
        } finally {
            document.close();
        }

        return null;
    }
}	
	
