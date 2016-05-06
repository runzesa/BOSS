/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.medical_r.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

public final class InsertSelectPrintAction implements Controller {
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
		
				String ID = request.getParameter("ID");

		
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		IMedical_r medical_r = (IMedical_r) context
				.getBean("medical_rProxy");
		medical_r.setSId(session.getAttribute("userId").toString());
		
		InsertActionBean bean = new InsertActionBean();
		bean = medical_r.insertSelectEdit(ID);
		
		Element root = new Element("entity");
		Element row = new Element("row");
	
		
		Element field0 = new Element("field");
		field0.setAttribute("name", "ID");
		field0.setAttribute("value", ID);
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
		field6.setAttribute("name", "case_imgs");
		field6.setAttribute("value", bean.getCase_imgs()==null?"":bean.getCase_imgs());
		row.addContent(field6);
		
		Element field7 = new Element("field");
		field7.setAttribute("name", "SECTION");
		field7.setAttribute("value", bean.getSECTION()==null?"":bean.getSECTION());
		row.addContent(field7);
		
		Element field8 = new Element("field");
		field8.setAttribute("name", "CREATE_USER_ID");
		field8.setAttribute("value", bean.getCREATE_USER_ID()==null?"":bean.getCREATE_USER_ID());
		row.addContent(field8);
		
		Element field9 = new Element("field");
		field9.setAttribute("name", "CREATE_TIME");
		field9.setAttribute("value", bean.getCREATE_TIME()==null?"":bean.getCREATE_TIME());
		row.addContent(field9);
		
		Element field10 = new Element("field");
		field10.setAttribute("name", "STATE");
		field10.setAttribute("value", bean.getSTATE()==null?"":bean.getSTATE());
		row.addContent(field10);
		
		Element field11 = new Element("field");
		field11.setAttribute("name", "RECIEVE_USER_ID");
		field11.setAttribute("value", bean.getRECIEVE_USER_ID()==null?"":bean.getRECIEVE_USER_ID());
		row.addContent(field11);
		
		Element field12 = new Element("field");
		field12.setAttribute("name", "SOLVE_TIME");
		field12.setAttribute("value", bean.getSOLVE_TIME()==null?"":bean.getSOLVE_TIME());
		row.addContent(field12);
		
		Element field13 = new Element("field");
		field13.setAttribute("name", "SOLVE_CONTENT");
		field13.setAttribute("value", bean.getSOLVE_CONTENT()==null?"":bean.getSOLVE_CONTENT());
		row.addContent(field13);
		
		Element field14 = new Element("field");
		field14.setAttribute("name", "is_jump_ask");
		field14.setAttribute("value", bean.getIs_jump_ask()==null?"":bean.getIs_jump_ask());
		row.addContent(field14);
		
		root.addContent(row);
		
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
