/*
 * Copyright GuanHui . All rights reserved.
 */
package com.workflow.task;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.adminmanager.department.DepartmentExt;
import com.genius.adminmanager.department.actionbean.DepartmentSelectActionBean;
import com.genius.adminmanager.userinfo.Userinfo;
import com.genius.adminmanager.userinfo.UserinfoBean;

/**
 * ÓÃ»§Ê÷µÄaction
 */
public final class UserTreeAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserTreeAction");
		
		String act = request.getParameter("act");
		DepartmentExt department = new DepartmentExt();
		String str = request.getParameter("did");
		if(str==null || str.equals("")){
			str="0";
		}
		List<?> myList = department.select(str,null);
		Element root = new Element("nodes");
		String formName = request.getParameter("formname");
		String nameInput = request.getParameter("nameinput");
		String idInput = request.getParameter("idinput");
		for (int i = 0; i < myList.size(); i++) {
			DepartmentSelectActionBean actionBean = (DepartmentSelectActionBean)myList.get(i);
			List<?> list = department.select(actionBean.getId(), null);
			Element no = new Element("node");
			no.setAttribute("id", "1p"+actionBean.getId());

			Userinfo u = new Userinfo();
			List<?> list0 = u.tree(actionBean.getId());
			
			if(act==null || act.equals("")){
				no.setAttribute("url","#");
				if(list.size()>0 || list0.size()>0){
					no.setAttribute("XMLData","usertree.do?did="+actionBean.getId());
				}
			}else{
				if(act.equals("0")){
					no.setAttribute("url","#");
					if(list.size()>0 || list0.size()>0){
						no.setAttribute("XMLData","usertree.do?act=0&did="+actionBean.getId()+"&formname=" + formName
								+"&nameinput="+ nameInput+"&idinput="+idInput);
					}
				}else if(act.equals("1")){
//					
				}
			}
			no.setAttribute("text",actionBean.getName());
			root.addContent(no);
		}

		Userinfo userinfoExt = new Userinfo();
		List<?> list0 = userinfoExt.tree(str);

		for (int i = 0; i < list0.size(); i++) {
			UserinfoBean actionBean = (UserinfoBean)list0.get(i);
			Element no = new Element("node");
			no.setAttribute("id", "1"+actionBean.getId());
			if(act==null || act.equals("")){
				no.setAttribute("url","#");
			}else{
				if(act.equals("0")){
					no.setAttribute("url","usertreeok.jsp?act=0&formname=" + formName+"&nameinput="
							+ nameInput+"&idinput="+idInput	+ "&id="+actionBean.getId()+"&name="+actionBean.getName());
				}else if(act.equals("1")){
					
				}
			}
			no.setAttribute("text",actionBean.getName());
			root.addContent(no);
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
