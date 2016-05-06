/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.medical_r.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genius.data.AdvancedSearchAnalysis;
import org.genius.data.PageDataConfig;
import org.genius.xml.ResponseXml;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.BOSS.medical_r.IMedical_r;
import com.genius.BOSS.medical_r.actionbean.*;

public final class SelectAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") == null
				|| (!session.getAttribute("login").equals("true"))) {
			Element root = new Element("entity");
			
			Element actionState = new Element("actionState");
			Element fieldState = new Element("field");
			fieldState.setAttribute("name", "state");
			fieldState.setAttribute("value", "noSession");
			actionState.addContent(fieldState);

			root.addContent(actionState);
			Document doc = new Document(root);
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());

			return null;
		}
		
		String requestUrl = "";
		
		

		int pageNo;
		String orderType = request.getParameter("ordertype");
		String searchField = request.getParameter("searchfield");
		String searchValue = request.getParameter("searchvalue");
		String searchValuePage = request.getParameter("searchvalue");
		String pager = request.getParameter("pager");
		searchValue=AdvancedSearchAnalysis.adAnalysis(searchField,searchValue);
		
		if(!(searchValuePage==null||searchValuePage.length()<=0)){
			searchValuePage = URLDecoder.decode(searchValuePage,"UTF-8");
		}

		String url = request.getRequestURI() + "?";
		String query = request.getQueryString();
		if (query != null && !query.equals("null")) {
			url = request.getRequestURI() + "?" + query;
		} 

		if (url.indexOf("&order") > 0) {
			url = url.substring(0, url.indexOf("&order"));
		}

		if (orderType == null || orderType.equals("null")) {
			orderType = "false";
		}

		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.valueOf(request.getParameter("pageNo")).intValue();
		} else {
			pageNo = 1;
		}

		ArrayList myList = new ArrayList();
		
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		IMedical_r medical_r = (IMedical_r) context
				.getBean("medical_rProxy");
				
		medical_r.setSId(session.getAttribute("userId").toString());

		try {
		
			myList = medical_r.select(pageNo, request.getParameter("order"), orderType, searchField, searchValue, pager,null);
		
		} catch (NullPointerException e) {
			
			ResponseXml responseXml = new ResponseXml();
			Document doc = responseXml.actionStateResponse("NullPointerException");
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());

			return null;
		}
		
		if (myList == null) {
			String[] fields={"ID","NAME","SEX","AGE","DISEASE","DISCRIBE","SECTION","CREATE_USER_ID","CREATE_TIME","STATE","RECIEVE_USER_ID","SOLVE_TIME","is_jump_ask"};
			ResponseXml responseXml=new ResponseXml();
			Document doc = responseXml.noPowerResponse(fields);
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());

			return null;
		}
		
		PageDataConfig myData = new PageDataConfig(medical_r.getTotalSize(),50,
				pageNo);
		String toolBar = myData
				.getImagePageBar(url + requestUrl + "&order="
						+ request.getParameter("order") + "&ordertype="
						+ orderType + "&searchfield=" + searchField
						+ "&searchvalue=" + searchValuePage);
		boolean isOverMax = false;
		if(medical_r.getTotalPageCount()>1)
			isOverMax = true;
			
		Element root = new Element("entity");
		Iterator it = myList.iterator();

		while (it.hasNext()) {
			SelectActionBean bean = (SelectActionBean) it.next();
			Element row = new Element("row");
			
			Element field0 = new Element("field");
			field0.setAttribute("name", "ID");
			field0.setAttribute("value", bean.getID()==null?"":bean.getID());
			row.addContent(field0);
			
			Element field1 = new Element("field");
			field1.setAttribute("name", "NAME");
			field1.setAttribute("value", bean.getNAME()==null?"":bean.getNAME());
			row.addContent(field1);
			
			Element field2 = new Element("field");
			field2.setAttribute("name", "SEX");
			field2.setAttribute("value", bean.getSEX()==null?"":bean.getSEX());
			row.addContent(field2);
			
			Element field3 = new Element("field");
			field3.setAttribute("name", "AGE");
			field3.setAttribute("value", bean.getAGE()==null?"":bean.getAGE());
			row.addContent(field3);
			
			Element field4 = new Element("field");
			field4.setAttribute("name", "DISEASE");
			field4.setAttribute("value", bean.getDISEASE()==null?"":bean.getDISEASE());
			row.addContent(field4);
			
			Element field5 = new Element("field");
			field5.setAttribute("name", "DISCRIBE");
			field5.setAttribute("value", bean.getDISCRIBE()==null?"":bean.getDISCRIBE());
			row.addContent(field5);
			
			Element field6 = new Element("field");
			field6.setAttribute("name", "SECTION");
			field6.setAttribute("value", bean.getSECTION()==null?"":bean.getSECTION());
			row.addContent(field6);
			
			Element field7 = new Element("field");
			field7.setAttribute("name", "CREATE_USER_ID");
			field7.setAttribute("value", bean.getCREATE_USER_ID()==null?"":bean.getCREATE_USER_ID());
			row.addContent(field7);
			
			Element field8 = new Element("field");
			field8.setAttribute("name", "CREATE_TIME");
			field8.setAttribute("value", bean.getCREATE_TIME()==null?"":bean.getCREATE_TIME());
			row.addContent(field8);
			
			Element field9 = new Element("field");
			field9.setAttribute("name", "STATE");
			field9.setAttribute("value", bean.getSTATE()==null?"":bean.getSTATE());
			row.addContent(field9);
			
			Element field10 = new Element("field");
			field10.setAttribute("name", "RECIEVE_USER_ID");
			field10.setAttribute("value", bean.getRECIEVE_USER_ID()==null?"":bean.getRECIEVE_USER_ID());
			row.addContent(field10);
			
			Element field11 = new Element("field");
			field11.setAttribute("name", "SOLVE_TIME");
			field11.setAttribute("value", bean.getSOLVE_TIME()==null?"":bean.getSOLVE_TIME());
			row.addContent(field11);
			
			Element field12 = new Element("field");
			field12.setAttribute("name", "is_jump_ask");
			field12.setAttribute("value", bean.getIs_jump_ask()==null?"":bean.getIs_jump_ask());
			row.addContent(field12);
			
			root.addContent(row);
			bean = null;
		}
		
		Element pageBar = new Element("pageBar");
		Element fieldPage = new Element("field");
		fieldPage.setAttribute("name", "page");
		fieldPage.setAttribute("totalPageCount",String.valueOf(isOverMax));
		fieldPage.setAttribute("value", toolBar);
		pageBar.addContent(fieldPage);
		Element fieldUrl = new Element("field");
		fieldUrl.setAttribute("name", "url");
		fieldUrl.setAttribute("value", url);
		pageBar.addContent(fieldUrl);
		root.addContent(pageBar);
		
		Element actionState = new Element("actionState");
		Element fieldState = new Element("field");
		fieldState.setAttribute("name", "state");
		fieldState.setAttribute("value", "session");
		actionState.addContent(fieldState);
		root.addContent(actionState);
		
		Document doc = new Document(root);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(doc, response.getWriter());

		return null;
	}
}
	