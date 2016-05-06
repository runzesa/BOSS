package com.genius.personalsettings.action;

import java.util.ArrayList;

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

import com.genius.personalsettings.IPersonalSettings;
import com.genius.personalsettings.PersonalSettings;
import com.genius.personalsettings.actionbean.LeftCustomBean;

public class DeleteLeftAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("!!DeleteLeftAction!!");
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

			return new ModelAndView();
		}
		
		String success = "true";
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		//IPersonalSettings newpage = (IPersonalSettings) context.getBean("personalsettingsProxy");
		PersonalSettings newpage = new PersonalSettings();
		newpage.setSId(session.getAttribute("userId").toString());

		String urlId = request.getParameter("id");
		try {/*
			if (newpage.deleteLeftCustom(urlId)) {
				success = "true";
			} else {
				success = "false";
			}*/
		} catch (NullPointerException e) {
			success = "noPower";
		}

		Element root = new Element("entity");
		Element row = new Element("row");
		Element field1 = new Element("field");
		field1.setAttribute("name", "success");
		field1.setAttribute("value", success);
		row.addContent(field1);

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
