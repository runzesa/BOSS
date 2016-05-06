package com.workflow.definition;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.workflow.util.XmlInfo;
//import com.workflow.util.XmlParse;

@Deprecated
public class SaveNodeAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("SaveNodeAction");
		
		String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
		String assignee = URLDecoder.decode(request.getParameter("assignee"),"UTF-8");
		String xmlName = URLDecoder.decode(request.getParameter("xml"),"UTF-8");
		String cname = URLDecoder.decode(request.getParameter("cname"),"UTF-8");

		XmlInfo xmlInfo = new XmlInfo(xmlName);
		Element root = xmlInfo.getRoot();
		
		List<Element> children = root.getChildren();
		for(Element node:children){
			if(node.getAttributeValue("name").equals(cname)){
				node.setAttribute("name",name);
				if(!assignee.equals("N/A"))
					node.setAttribute("assignee",assignee);
			}
		}
		
		Document doc = new Document((Element)root.clone());
		XmlInfo xmlParse = new XmlInfo();
		String realPath = request.getSession().getServletContext().getRealPath("/process/");
		System.out.println(realPath + "/" + xmlName + ".jpdl.xml");
		xmlParse.createXml(doc,realPath + "/" + xmlName + ".jpdl.xml");
		
		Element returnRoot = new Element("returnResult");
		Element result = new Element("result");
		result.setAttribute("return","success");
		returnRoot.addContent(result);
		Document returnDoc = new Document(returnRoot);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(returnDoc, response.getWriter());
		
		return null;
	}

}
