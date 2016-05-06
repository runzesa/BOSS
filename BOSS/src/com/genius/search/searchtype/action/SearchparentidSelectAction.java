/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.searchtype.action;

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

import com.genius.search.searchtype.ISearchtype;
import com.genius.search.searchtype.actionbean.*;

public final class SearchparentidSelectAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		ISearchtype searchtype = (ISearchtype) context
				.getBean("searchtypeProxy");
		searchtype.setSId(session.getAttribute("userId").toString());
		ArrayList searchparentidList=new ArrayList();
		searchparentidList=searchtype.searchparentidInsertSelect(); 
		
		Element root = new Element("entity");
		Iterator it = searchparentidList.iterator();

		while (it.hasNext()) {
			SearchparentidActionBean bean = (SearchparentidActionBean) it.next();
			Element row = new Element("row");
			Element field1 = new Element("field");
			field1.setAttribute("name", "value");
			field1.setAttribute("value", bean.getSearchid());
			row.addContent(field1);
			Element field2 = new Element("field");
			field2.setAttribute("name", "field");
			field2.setAttribute("value", bean.getSearchname());
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

		return new ModelAndView();
	}
}

