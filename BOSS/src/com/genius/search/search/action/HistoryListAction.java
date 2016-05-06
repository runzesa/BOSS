/*
 * 创建日期 2005-6-4
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.HistoryListForm;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HistoryListAction implements Controller{

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse arg3) throws ServletException, IOException {	
		// TODO 自动生成方法存根
		String currentPage=arg2.getParameter("currentPage");//当前页面数
        HistoryListForm form=new HistoryListForm();
        ArrayList list=new ArrayList();

		int pageNo;
		 if (arg2.getParameter("pageNo") != null) {
           pageNo = Integer.valueOf(arg2.getParameter("pageNo")).intValue();
       } else {
           pageNo = 1;
       }

        String  user = arg2.getSession().getAttribute("userId").toString();
    //    System.out.println("这里::"+user);
			if (user == null) {
				arg3.sendRedirect("../login.jsp");
				return null;
			}else
			{
				int userid=0;
				
				userid = Integer.parseInt(arg2.getSession().getAttribute("userId").toString());
				
				int deptid=Integer.parseInt(arg2.getSession().getAttribute("departmentId").toString());
				int power=Integer.parseInt(arg2.getSession().getAttribute("power").toString());
				list = form.list(Integer.toString(power),pageNo);
				arg2.setAttribute("list",list);
				//arg2.setAttribute("sr",form);

			}
		return new ModelAndView("../search/searchTypeList.jsp");
	}
}
