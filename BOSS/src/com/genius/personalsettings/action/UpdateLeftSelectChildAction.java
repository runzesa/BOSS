package com.genius.personalsettings.action;

import java.util.ArrayList;
import java.util.List;

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
 * 树的查询方法
 * @author Administrator
 */
public class UpdateLeftSelectChildAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") == null
				|| (!session.getAttribute("login").equals("true"))) {
			Element root = new Element("entity");
			System.out.println("xx");
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
		
		String formName = request.getParameter("formname");
		String nameInput = request.getParameter("nameinput");
		String idInput = request.getParameter("idinput");
		
		PersonalSettings personalSettings = new PersonalSettings();
		personalSettings.setSId(session.getAttribute("userId").toString());
		
		List<LeftCustomBean> myList = new ArrayList<LeftCustomBean>();
		String act = request.getParameter("act");
		String str = request.getParameter("pid");
		if(str==null || str.equals("")){
			str="0";
		}
	//	System.out.println("pid="+str);
		if(str.equals("0")){//top菜单
			myList = personalSettings.getTitleRoots();
			if(myList.size()>0){
				Element root = new Element("root");
				for (int i = 0; i < myList.size(); i++) {
					LeftCustomBean actionBean = myList.get(i);
					Element no = new Element("item");
					no.setAttribute("id", actionBean.getId());
					if(act==null || act.equals("")){
						if(actionBean.getTarget()!=null && !actionBean.getTarget().equals("")){
							
							no.setAttribute("itemTarget",actionBean.getTarget());
//"updateLeftSelectChild.do?pid="+actionBean.getId()+":"+actionBean.getTarget()+"&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput
							no.setAttribute("jsdata","none");
							no.setAttribute("state","closed");
						}else{
							no.setAttribute("url","javascript:addToHidden(\"none\")");
							//no.setAttribute("url","#");//javascript:aab()
						}
					}else {
						
					}
//					no.setAttribute("text",actionBean.getName());
					no.addContent(getNameElement(actionBean.getName()));
					root.addContent(no);
				}
				Document doc = new Document(root);
				response.setContentType("application/xml;charset=GB2312");
				Format format = Format.getPrettyFormat();
				format.setEncoding("GB2312");
				XMLOutputter outer = new XMLOutputter(format);
				outer.output(doc, response.getWriter());
//				outer.output(doc, System.out);
			}
		}else{//取top下左面第二三级菜单
			//myList = personalSettings.tree(str);
			String roleid = request.getSession().getAttribute("roleId")+"";
			if(str.indexOf(":")==-1){
				myList = personalSettings.getChilds(str,roleid);
				if(myList.size()>0){
					Element root = new Element("root");
					for (int i = 0; i < myList.size(); i++) {
						LeftCustomBean actionBean = myList.get(i);

						Element no = new Element("item");
						no.setAttribute("id", actionBean.getId());
						if(act==null || act.equals("")){
							List<LeftCustomBean> list = personalSettings.getChilds(actionBean.getId(),roleid);
							if(list!=null && list.size()>0){
								no.setAttribute("state","closed");
								no.setAttribute("jsdata","none");
//								no.setAttribute("XMLData","updateLeftSelectChild.do?pid="+actionBean.getId()+
//										"&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput);
//								no.setAttribute("url","javascript:addToHidden(\"none\")");
							}else{
								no.setAttribute("jsdata",actionBean.getName());
//								no.setAttribute("url","javascript:addToHidden("+actionBean.getId()+",\""+actionBean.getName()+"\")");//javascript:aab()
							}
						}else {
							
						}
//						no.setAttribute("text",actionBean.getName());
						no.setContent(getNameElement(actionBean.getName()));
						root.addContent(no);
					}
					
					Document doc = new Document(root);
					response.setContentType("application/xml;charset=GB2312");
					Format format = Format.getPrettyFormat();
					format.setEncoding("GB2312");
					XMLOutputter outer = new XMLOutputter(format);
					outer.output(doc, response.getWriter());
//					outer.output(doc, System.out);
				}
			}else{//取top下左面第一级菜单
				str = str.split(":")[1];
				String firstChild[] = str.split(",");
				if(firstChild.length>0){
					Element root = new Element("root");
					for (int i = 0; i < firstChild.length; i++) {
						LeftCustomBean actionBean = personalSettings.getFirstChilds(firstChild[i]);

						Element no = new Element("item");
						no.setAttribute("id", actionBean.getId());
						List<LeftCustomBean> list = null;
						if(act==null || act.equals("")){
							list = personalSettings.getChilds(actionBean.getId(),roleid);
							if(list!=null && list.size()>0){

								no.setAttribute("state","closed");
								no.setAttribute("jsdata","none");
//								no.setAttribute("XMLData","updateLeftSelectChild.do?pid="+actionBean.getId()+
//								"&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput);
//								no.setAttribute("url","javascript:addToHidden(\"none\")");
							}else{
								no.setAttribute("jsdata",actionBean.getName());
//								no.setAttribute("url","javascript:addToHidden("+actionBean.getId()+",\""+actionBean.getName()+"\")");//javascript:aab()
							}
						}else {
							
						}
//						no.setAttribute("text",actionBean.getName());
						no.setContent(getNameElement(actionBean.getName()));
						if(list!=null && list.size()>0)
							root.addContent(no);
					}
					
					Document doc = new Document(root);
					response.setContentType("application/xml;charset=GB2312");
					Format format = Format.getPrettyFormat();
					format.setEncoding("GB2312");
					XMLOutputter outer = new XMLOutputter(format);
					outer.output(doc, response.getWriter());
//					outer.output(doc, System.out);
				}
			}
		}
		return null;
	}
	private Element getNameElement(String name){
		Element content = new Element("content");
		Element nameE = new Element("name");
		nameE.setText(name);
		content.addContent(nameE);
		return content;
	}
}
