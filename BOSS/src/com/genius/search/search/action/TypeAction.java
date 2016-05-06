/*
 * 创建日期 2005-7-20
 *
 * TODO
 * 天成研发部 
 * 
 */
package com.genius.search.search.action;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.TypeForm;
import com.genius.search.search.History;



/**
 * @author yangy
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TypeAction implements Controller {
	private String whatAction;
	private String toUrl="";

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse response) throws ServletException, IOException {	
		// TODO 自动生成方法存根
		arg2.setCharacterEncoding("gb2312"); 
		whatAction = (String)arg2.getParameter("actiontype");
	//	System.out.println(arg2.getParameter("id")+"!!!!!!!!!!!!!!!!!!+1");			

		if(whatAction.equals("delete")){
	//		System.out.println(arg2.getParameter("id")+"!!!!!!!!!!!!!!!!!!+2");			
	
			History sh1 = new History();
			
			TypeForm sh =new TypeForm();
			sh.del(arg2.getParameter("id"));
			sh1.delAllType(arg2.getParameter("id"));
			arg2.setAttribute("shlist",sh.list());
			arg2.setAttribute("searchname","");

				toUrl = "../search/type.jsp";
			}
		else if(whatAction.equals("add")){
			//保存sql查询并返回列表
			TypeForm sh =new TypeForm();
			

			sh.add((String)arg2.getParameter("searchname"),(String)arg2.getParameter("parentid"));
			
			arg2.setAttribute("shlist",sh.list());
			arg2.setAttribute("searchname","");
			toUrl = "../search/type.jsp";
		}
		else if(whatAction.equals("update")){
			//保存修改的sql查询并返回列表
	//		System.out.println(arg2.getParameter("id")+"!!!!!!!!!!!!!!!!!!+3");			
			TypeForm sh =new TypeForm();
			sh.edit(arg2.getParameter("id"),arg2.getParameter("searchname"),arg2.getParameter("parentid"));
			arg2.setAttribute("shlist",sh.list());
			arg2.setAttribute("searchname","");
			toUrl = "../search/type.jsp";
		}
		else if(whatAction.equals("addshow")){
			//打开为保存界面
			TypeForm sh =new TypeForm();
			arg2.setAttribute("shlist",sh.list());
			arg2.setAttribute("searchname","");
			toUrl = "../search/type.jsp";

		}
		else if(whatAction.equals("updateshow")){
			//打开为修改界面
			
			TypeForm sh =new TypeForm();
			arg2.setAttribute("shlist",sh.list());
			arg2.setAttribute("searchname",sh.getNameById(arg2.getParameter("id")));
			arg2.setAttribute("searchid", arg2.getParameter("id"));
			toUrl = "../search/type.jsp";
		}

		
		// TODO 自动生成方法存根
		return new ModelAndView(toUrl);
	}
}
