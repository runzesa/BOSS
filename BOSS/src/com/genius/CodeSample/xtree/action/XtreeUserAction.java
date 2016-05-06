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
import com.genius.CodeSample.xtree.actionbean.XtreeUserBean;

public class XtreeUserAction implements Controller{
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
			
			if(xt.hasChild(xtreeBean.getId())){
				
				tree.setAttribute("src","xtreeuser.do?pid="+xtreeBean.getId()+"&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"");
			//	tree.setAttribute("action","departmentxtreeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"&name="+xtreeBean.getName()+"&id="+xtreeBean.getId()+"");
			}else{
				tree.setAttribute("icon","images/folder.png");
				tree.setAttribute("openIcon","images/openfolder.png");
			//	tree.setAttribute("action","departmentxtreeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"&name="+xtreeBean.getName()+"&id="+xtreeBean.getId()+"");				
			}
			
			ArrayList userList = new ArrayList();
			xtree userTree = new xtree();
			userList = userTree.selectUserByDepatment(xtreeBean.getId());
			
			if(!userList.isEmpty()){
				Iterator userit = userList.iterator();
				while(userit.hasNext()){
					XtreeUserBean userBean = (XtreeUserBean)userit.next();
					Element user = new Element("tree");
					user.setAttribute("text",userBean.getName());
					user.setAttribute("action","userxtreeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput+"&name="+userBean.getName()+"&id="+userBean.getId()+"");
					user.setAttribute("icon","images/user2.gif");
					tree.addContent(user);
					userBean = null;
				}
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
