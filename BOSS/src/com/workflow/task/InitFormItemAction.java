package com.workflow.task;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.workflow.util.XmlInfo;

/**
 * 发起流程的action
 */
public class InitFormItemAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("in! -> InitFormItemAction");
		//从js传来的模块英文名
		String name = request.getParameter("name");

		//根据模块名获取到工作流配置文件,取到开始节点
		XmlInfo xmlInfo = new XmlInfo(name);
		Element taskNode = xmlInfo.getElementByTagName("start");
		
		//取到开始节点的可读可写字段
		String formItem_r = taskNode.getAttributeValue("formitem_r")!=null?
				taskNode.getAttributeValue("formitem_r"):"";
		String formItem_w = taskNode.getAttributeValue("formitem_w")!=null?
				taskNode.getAttributeValue("formitem_w"):"";
				
		//保存进xml返回给页面	
		Element returnRoot = new Element("form");
		Element itemElement = new Element("formitem");
		itemElement.setAttribute("formitem_r",formItem_r);
		itemElement.setAttribute("formitem_w",formItem_w);
		returnRoot.addContent(itemElement);
		Document returnDoc = new Document(returnRoot);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(returnDoc, response.getWriter());
		
		return null;
	}
}
