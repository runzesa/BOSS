/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.cdsy.action;

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

import org.genius.util.*;
import com.genius.BOSS.cdsy.ICdsy;

public final class InsertNewAction implements Controller {
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
		
		String success = "true";

		String user_id = java.net.URLDecoder.decode(request.getParameter("user_id"),"UTF-8");
		String operate_state = java.net.URLDecoder.decode(request.getParameter("operate_state"),"UTF-8");
		String open_state = java.net.URLDecoder.decode(request.getParameter("open_state"),"UTF-8");
		String score = java.net.URLDecoder.decode(request.getParameter("score"),"UTF-8");
		String type = java.net.URLDecoder.decode(request.getParameter("type"),"UTF-8");
		String academic = java.net.URLDecoder.decode(request.getParameter("academic"),"UTF-8");
		String create_user = java.net.URLDecoder.decode(request.getParameter("create_user"),"UTF-8");
		String modify_time = java.net.URLDecoder.decode(request.getParameter("modify_time"),"UTF-8");
		String modify_user = java.net.URLDecoder.decode(request.getParameter("modify_user"),"UTF-8");
		String department = java.net.URLDecoder.decode(request.getParameter("department"),"UTF-8");
		String title = java.net.URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String audior_name = java.net.URLDecoder.decode(request.getParameter("audior_name"),"UTF-8");
		String create_time = java.net.URLDecoder.decode(request.getParameter("create_time"),"UTF-8");
		String source = java.net.URLDecoder.decode(request.getParameter("source"),"UTF-8");
		String info = java.net.URLDecoder.decode(request.getParameter("info"),"UTF-8");
		String key_word = java.net.URLDecoder.decode(request.getParameter("key_word"),"UTF-8");
		String content = java.net.URLDecoder.decode(request.getParameter("content"),"UTF-8");
content=TextFormat.getSqlText(content);
		String img_url = java.net.URLDecoder.decode(request.getParameter("img_url"),"UTF-8");
		String ucg = java.net.URLDecoder.decode(request.getParameter("ucg"),"UTF-8");
		String apply_state = java.net.URLDecoder.decode(request.getParameter("apply_state"),"UTF-8");
		String rank_type = java.net.URLDecoder.decode(request.getParameter("rank_type"),"UTF-8");
		String cover_img = java.net.URLDecoder.decode(request.getParameter("cover_img"),"UTF-8");
		String attachment_id = java.net.URLDecoder.decode(request.getParameter("attachment_id"),"UTF-8");


		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		ICdsy cdsy = (ICdsy) context
				.getBean("cdsyProxy");
		cdsy.setSId(session.getAttribute("userId").toString());
		try {
			if (cdsy.insertNew(source,apply_state,department,create_time,img_url,operate_state,user_id,ucg,open_state,modify_user,title,audior_name,modify_time,attachment_id,rank_type,info,academic,content,key_word,cover_img,score,create_user,type)) {
				success = "true";
			} else {
				success = "false";
			}
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
