package com.genius.personalsettings.action;

import java.net.URLDecoder;
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

public class UpdateLeftAction implements Controller {

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
		ArrayList<LeftCustomBean> arrayList = new ArrayList<LeftCustomBean>();
		String vals = request.getParameter("list");
		
		vals = URLDecoder.decode(vals,"utf-8");
		String listArr[] = vals.split(";");
		if(vals!=null && !vals.equals(""))
		for (int i = 0; i < listArr.length; i++) {
			LeftCustomBean bean = new LeftCustomBean();
			String beans[];
			if(listArr[i].indexOf(":")!=-1){
				bean.setId(listArr[i].split(":")[0]);
				beans = listArr[i].split(":")[1].split(",");
			}else{
				beans = listArr[i].split(",");
			}
			bean.setUrl(beans[0]);
			bean.setName(beans[1]);
			arrayList.add(bean);
		}
		
		PersonalSettings newpage = new PersonalSettings();
		newpage.setSId(session.getAttribute("userId").toString());
		boolean bool = newpage.updateLeftCustoms(arrayList);

		Element root = new Element("entity");
		Element field1 = new Element("field");
		field1.setAttribute("name", "success");
		field1.setAttribute("value", bool+"");
		root.addContent(field1);

		Document doc = new Document(root);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(doc, response.getWriter());
		return null;
	}
}
