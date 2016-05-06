/*
*Generated by GeniusPlatform. 2016-04-11 15:57:14
*/
package com.genius.BOSS.verify.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.BOSS.verify.IVerify;
import com.genius.BOSS.verify.actionbean.*;

public final class AreaSelectAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		IVerify verify = (IVerify) context
				.getBean("verifyProxy");
		verify.setSId(session.getAttribute("userId").toString());
		ArrayList areaList=new ArrayList();
		areaList=verify.areaInsertSelect(); 
		
		Element root = new Element("entity");
		Iterator it = areaList.iterator();

		while (it.hasNext()) {
			AreaActionBean bean = (AreaActionBean) it.next();
			Element row = new Element("row");
			Element field1 = new Element("field");
			field1.setAttribute("name", "value");
			field1.setAttribute("value", bean.getArea_id());
			row.addContent(field1);
			Element field2 = new Element("field");
			field2.setAttribute("name", "field");
			field2.setAttribute("value", bean.getName());
			row.addContent(field2);
			root.addContent(row);
			bean = null;
		}
		Document doc = new Document(root);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(doc, response.getWriter());

		return null;
	}
}

