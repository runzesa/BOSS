package com.genius.CodeSample.xtree.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genius.xml.ResponseXml;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.CodeSample.xtree.xtree;
import com.genius.CodeSample.xtree.actionbean.XtreeSelectBean;


public final class XtreeDepartmentAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String pid = request.getParameter("pid");
		String formName = request.getParameter("formname");
		String nameInput = request.getParameter("nameinput");
		String idInput = request.getParameter("idinput");
		
		ArrayList myList = new ArrayList();
		xtree xt = new xtree();
		
		try {
			
			myList = xt.selectByParent(pid);
		
		} catch (NullPointerException e) {
			
			ResponseXml responseXml = new ResponseXml();
			Document doc = responseXml.actionStateResponse("NullPointerException");
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());

			return null;
		}
		
		
		Element root = new Element("tree");
		Iterator it = myList.iterator();
		
		while(it.hasNext()){
			XtreeSelectBean xtreeBean = (XtreeSelectBean)it.next();
			
			Element tree = new Element("tree");
			tree.setAttribute("text",xtreeBean.getName());
			//tree.setAttribute("checkbox","true");
			
			if(xt.hasChild(xtreeBean.getId())){
				tree.setAttribute("src","xtreedepartment.do?pid="+xtreeBean.getId()+"&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"");
				tree.setAttribute("action","departmentxtreeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"&name="+xtreeBean.getName()+"&id="+xtreeBean.getId()+"");
			}else{
				tree.setAttribute("action","departmentxtreeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"&name="+xtreeBean.getName()+"&id="+xtreeBean.getId()+"");
				
			}
			
			root.addContent(tree);
			xtreeBean = null;
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