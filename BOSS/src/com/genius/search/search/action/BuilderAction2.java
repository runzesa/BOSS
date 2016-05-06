/*
 * 创建日期 2005-5-21
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.Builder2;
import com.genius.search.search.actionbean.Builder2ActionBean;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class BuilderAction2 implements Controller {

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse response) throws ServletException, IOException {
		
		String tempstr  = arg2.getParameter("tablestore");
		String tempstr1 = arg2.getParameter("objsql");
		Builder2 sb2 = new Builder2();
		String mysql = sb2.builderSql(tempstr);
		List afieldlist = sb2.fieldList(mysql);
		StringBuffer buffer = new StringBuffer();
		buffer.append("<script>");
		buffer.append("\n var subcat = new Array(); ");
	//	System.out.println(afieldlist.get(1).getClass());
		for(int j = 0; j<afieldlist.size(); j++){
			Builder2ActionBean tmepOne = (Builder2ActionBean)afieldlist.get(j); 
			String addBuffer = "\n subcat["+j+"]=new Array('" + tmepOne.getFieldOfTable() + "','S" + tmepOne.getFieldId() + "','" + tmepOne.getFieldShow() + "','" + tmepOne.getFieldType() + "');"; 
			buffer.append(addBuffer);
		}

		buffer.append("\n</script>");
	//	System.out.println("builderaction2-buffer="+buffer.toString());
		arg2.setAttribute("buffer",buffer.toString());
		arg2.setAttribute("objsql",tempstr1);
		
	//	System.out.println("builderaction2-tempstr1="+tempstr1);
		arg2.setAttribute("afieldlist",afieldlist);
		return new ModelAndView("../search/builder2.jsp");
	}
}
