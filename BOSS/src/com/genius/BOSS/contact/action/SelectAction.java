/*
*Generated by GeniusPlatform. 2016-04-11 15:57:15
*/
package com.genius.BOSS.contact.action;

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

import com.genius.BOSS.contact.IContact;
import com.genius.BOSS.contact.actionbean.*;

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

		IContact contact = (IContact) context
				.getBean("contactProxy");
				
		contact.setSId(session.getAttribute("userId").toString());

		try {
		
			myList = contact.select(pageNo, request.getParameter("order"), orderType, searchField, searchValue, pager,null);
		
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
			String[] fields={"id","name","id_card_no","phone_no","account","password","old_password","role","sex","point","credit","register_time","modify_time","email","birthday","is_identify","status","area"};
			ResponseXml responseXml=new ResponseXml();
			Document doc = responseXml.noPowerResponse(fields);
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());

			return null;
		}
		
		PageDataConfig myData = new PageDataConfig(contact.getTotalSize(),50,
				pageNo);
		String toolBar = myData
				.getImagePageBar(url + requestUrl + "&order="
						+ request.getParameter("order") + "&ordertype="
						+ orderType + "&searchfield=" + searchField
						+ "&searchvalue=" + searchValuePage);
		boolean isOverMax = false;
		if(contact.getTotalPageCount()>1)
			isOverMax = true;
			
		Element root = new Element("entity");
		Iterator it = myList.iterator();

		while (it.hasNext()) {
			SelectActionBean bean = (SelectActionBean) it.next();
			Element row = new Element("row");
			
			Element field0 = new Element("field");
			field0.setAttribute("name", "id");
			field0.setAttribute("value", bean.getId()==null?"":bean.getId());
			row.addContent(field0);
			
			Element field1 = new Element("field");
			field1.setAttribute("name", "name");
			field1.setAttribute("value", bean.getName()==null?"":bean.getName());
			row.addContent(field1);
			
			Element field2 = new Element("field");
			field2.setAttribute("name", "id_card_no");
			field2.setAttribute("value", bean.getId_card_no()==null?"":bean.getId_card_no());
			row.addContent(field2);
			
			Element field3 = new Element("field");
			field3.setAttribute("name", "phone_no");
			field3.setAttribute("value", bean.getPhone_no()==null?"":bean.getPhone_no());
			row.addContent(field3);
			
			Element field4 = new Element("field");
			field4.setAttribute("name", "account");
			field4.setAttribute("value", bean.getAccount()==null?"":bean.getAccount());
			row.addContent(field4);
			
			Element field5 = new Element("field");
			field5.setAttribute("name", "password");
			field5.setAttribute("value", bean.getPassword()==null?"":bean.getPassword());
			row.addContent(field5);
			
			Element field6 = new Element("field");
			field6.setAttribute("name", "old_password");
			field6.setAttribute("value", bean.getOld_password()==null?"":bean.getOld_password());
			row.addContent(field6);
			
			Element field7 = new Element("field");
			field7.setAttribute("name", "role");
			field7.setAttribute("value", bean.getRole()==null?"":bean.getRole());
			row.addContent(field7);
			
			Element field8 = new Element("field");
			field8.setAttribute("name", "sex");
			field8.setAttribute("value", bean.getSex()==null?"":bean.getSex());
			row.addContent(field8);
			
			Element field9 = new Element("field");
			field9.setAttribute("name", "point");
			field9.setAttribute("value", bean.getPoint()==null?"":bean.getPoint());
			row.addContent(field9);
			
			Element field10 = new Element("field");
			field10.setAttribute("name", "credit");
			field10.setAttribute("value", bean.getCredit()==null?"":bean.getCredit());
			row.addContent(field10);
			
			Element field11 = new Element("field");
			field11.setAttribute("name", "register_time");
			field11.setAttribute("value", bean.getRegister_time()==null?"":bean.getRegister_time());
			row.addContent(field11);
			
			Element field12 = new Element("field");
			field12.setAttribute("name", "modify_time");
			field12.setAttribute("value", bean.getModify_time()==null?"":bean.getModify_time());
			row.addContent(field12);
			
			Element field13 = new Element("field");
			field13.setAttribute("name", "email");
			field13.setAttribute("value", bean.getEmail()==null?"":bean.getEmail());
			row.addContent(field13);
			
			Element field14 = new Element("field");
			field14.setAttribute("name", "birthday");
			field14.setAttribute("value", bean.getBirthday()==null?"":bean.getBirthday());
			row.addContent(field14);
			
			Element field15 = new Element("field");
			field15.setAttribute("name", "is_identify");
			field15.setAttribute("value", bean.getIs_identify()==null?"":bean.getIs_identify());
			row.addContent(field15);
			
			Element field16 = new Element("field");
			field16.setAttribute("name", "status");
			field16.setAttribute("value", bean.getStatus()==null?"":bean.getStatus());
			row.addContent(field16);
			
			Element field17 = new Element("field");
			field17.setAttribute("name", "area");
			field17.setAttribute("value", bean.getArea()==null?"":bean.getArea());
			row.addContent(field17);
			
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
	
