/*
 * 创建日期 2005-6-24
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search.action;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


import com.genius.search.search.History;
import com.genius.search.search.actionbean.HistoryActionBean;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class Quary implements Controller {

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse response) throws ServletException, IOException {
		String lx = arg2.getParameter("lx");
		
		// TODO 自动生成方法存根
		arg2.setCharacterEncoding("GB2312"); //设置输入编码格式
		String actiontype = arg2.getParameter("actiontype");
	//	System.out.println("searchquary");
		String toUrl="../search/quary.jsp";
		if(actiontype.equals("fulfill")){
			String sqlquary = arg2.getParameter("quary");
			String searchid = arg2.getParameter("id");
			String []a =sqlquary.split(";");
			String []sqlQuaryCont =new String[a.length] ;
			for(int i=0;i<a.length;i++){
				sqlQuaryCont[i]=arg2.getParameter("myvar"+Integer.toString(i));
	//			System.out.println(sqlQuaryCont[i]);
			}
			arg2.getSession().setAttribute("sqlquary",sqlQuaryCont);
			arg2.getSession().setAttribute("searchid",searchid);
			toUrl="/search/resultex.do?lx="+lx;
		}else{
			String searchid = arg2.getParameter("id");
			if(searchid.equals("")){
				System.out.println("SearchQuary缺少ID参数!!");
				
			}
			History h =new History();
			HistoryActionBean sh = h.getObjById(searchid);
			String sqlquary = sh.getSqlQuary();
			sqlquary = sqlquary.trim();
			if(sqlquary.length()>0){
				sqlquary = sqlquary.substring(0,sqlquary.length()-1);
				
			}
			arg2.setAttribute("id",searchid);
			arg2.setAttribute("sqlquary",sqlquary);
			if("0".equals(lx) && (null==arg2.getSession().getAttribute("login") || "null".equals(arg2.getSession().getAttribute("login")))){
				toUrl = "../search/quary2.jsp";
			}else{
				toUrl = "../search/quary.jsp";
			}
		}
		return new ModelAndView(toUrl);
	}
}
