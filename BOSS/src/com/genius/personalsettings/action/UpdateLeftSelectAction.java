package com.genius.personalsettings.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.personalsettings.PersonalSettings;
import com.genius.personalsettings.actionbean.LeftCustomBean;

/**
 * 读取用户选择的模块列表
 * @author Administrator
 */
public class UpdateLeftSelectAction implements Controller {

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
		
	//	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	//	IPersonalSettings personalSettings = (IPersonalSettings) context.getBean("personalsettingsProxy");
		PersonalSettings personalSettings = new PersonalSettings();
		personalSettings.setSId(session.getAttribute("userId").toString());

		ArrayList<LeftCustomBean> list = personalSettings.getLeftCustoms();
		
		Element root = new Element("row");
		
		for (int i = 0; i < list.size(); i++) {
			LeftCustomBean bean = (LeftCustomBean)list.get(i);
			Element field = new Element("userleft");
			field.setAttribute("id",  bean.getId()==null?"":bean.getId());
			field.setAttribute("name", bean.getName()==null?"":bean.getName());
			field.setAttribute("sleftid", bean.getUrl()==null?"":bean.getUrl());
			root.addContent(field);
		}
		Document doc = new Document(root);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(doc, response.getWriter());
//		outer.output(doc, System.out);
		return null;
		
	}
}
