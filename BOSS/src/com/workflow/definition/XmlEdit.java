package com.workflow.definition;

import java.io.File;
import java.util.ArrayList;
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

@Deprecated
public class XmlEdit implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("XmlEdit");
		
		String xmlName = request.getParameter("name");
		String realPath = request.getSession().getServletContext().getRealPath("/process/");
		File xmlFiles = new File(realPath + "/" + xmlName + ".jpdl.xml");
		Element root = new Element("process");
		if(xmlFiles.isFile()){
			//set root element info
			XmlInfo xmlInfo = new XmlInfo(xmlName);
			Element xmlRoot = xmlInfo.getRoot();
			root.setAttribute("name",xmlRoot.getAttributeValue("name"));
			if(xmlRoot.getAttributeValue("form")!=null)
				root.setAttribute("form",xmlRoot.getAttributeValue("form"));
			if(xmlRoot.getAttributeValue("describe")!=null)
				root.setAttribute("describe",xmlRoot.getAttributeValue("describe"));
			
			List<Element> processNode = (ArrayList<Element>)xmlInfo.getAllNode();
			//circle for every node in process
			for(Element oneNode:processNode){
				String eName = oneNode.getName();
				Element element =null;
				element = new Element(oneNode.getName());
				element.setAttribute("name",oneNode.getAttributeValue("name"));
				if(oneNode.getAttribute("assignee")!=null)
					element.setAttribute("assignee",oneNode.getAttributeValue("assignee"));
				//circle for transitions in task_node
				if(oneNode.getChildren().size()!=0){
					List<Element> transList = oneNode.getChildren();
					for(Element transNode:transList){
						Element trans = new Element("transition");
						if(transNode.getAttribute("name")!=null)
							trans.setAttribute("name",transNode.getAttributeValue("name"));
						trans.setAttribute("to",transNode.getAttributeValue("to"));
						element.addContent(trans);
					}
				}
				root.addContent(element);	
			}
		}else{
			root.setAttribute("name","NotAnyFile");
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
