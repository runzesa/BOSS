package com.genius.personalsettings.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.personalsettings.IPersonalSettings;
import com.genius.personalsettings.PersonalSettings;
import com.genius.personalsettings.actionbean.UserinfoBean;

public class UpdateUserinfoSelectAction implements Controller {
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
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

			return new ModelAndView();
		}
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		//IPersonalSettings personalSettings = (IPersonalSettings) context.getBean("personalsettingsProxy");
		PersonalSettings personalSettings = new PersonalSettings();
		personalSettings.setSId(session.getAttribute("userId").toString());
		
		UserinfoBean bean = new UserinfoBean();
		bean = personalSettings.getUserinfoBean();
		
		Element root = new Element("entity");
		Element row = new Element("row");
		
		
//		Element field0 = new Element("field");
//		field0.setAttribute("name", "id");
//		field0.setAttribute("value", bean.getId()==null?"":bean.getId());
//		row.addContent(field0);
		
		Element field1 = new Element("field");
		field1.setAttribute("name", "name");
		field1.setAttribute("value", bean.getName()==null?"":bean.getName());
		row.addContent(field1);
		
//		Element field2 = new Element("field");
//		field2.setAttribute("name", "username");
//		field2.setAttribute("value", bean.getUsername()==null?"":bean.getUsername());
//		row.addContent(field2);
		
		Element field3 = new Element("field");
		field3.setAttribute("name", "address");
		field3.setAttribute("value", bean.getAddress()==null?"":bean.getAddress());
		row.addContent(field3);
		
		Element field4 = new Element("field");
		field4.setAttribute("name", "phone");
		field4.setAttribute("value", bean.getPhone()==null?"":bean.getPhone());
		row.addContent(field4);
		
		Element field5 = new Element("field");
		field5.setAttribute("name", "mobile");
		field5.setAttribute("value", bean.getMobile()==null?"":bean.getMobile());
		row.addContent(field5);
		
		Element field6 = new Element("field");
		field6.setAttribute("name", "email");
		field6.setAttribute("value", bean.getEmail()==null?"":bean.getEmail());
		row.addContent(field6);
		
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
