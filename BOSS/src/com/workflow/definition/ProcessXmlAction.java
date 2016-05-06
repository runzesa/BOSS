package com.workflow.definition;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.workflow.util.XmlInfo;

public class ProcessXmlAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("ProcessXmlAction");
		
		String realPath = request.getSession().getServletContext().getRealPath("/process/");
		File xmlFiles = new File(realPath);
		File[] xmlFile = xmlFiles.listFiles();
		
		Element root = new Element("xmlinfo");
		for(File file:xmlFile){
			String[] fileSplit = file.getName().split("\\.");
			if(fileSplit[1].equals("jpdl")){
				XmlInfo xmlinfo = new XmlInfo(fileSplit[0]);
				
				Element jpdl = new Element("jpdl");
				jpdl.setAttribute("name",fileSplit[0]);
				jpdl.setAttribute("filename",file.getName());
				jpdl.setAttribute("description",xmlinfo.getDeafaultDescribe());
				root.addContent(jpdl);
			}
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
