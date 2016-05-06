/*
 * 创建日期 2005-5-13
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search.action;

import java.util.List;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.search.search.Builder1;
import com.genius.search.search.actionbean.Builder1ActionBean;
/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class BuilderAction1 implements Controller {
	
	private String whatAction;
	private String toUrl;
	

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
				HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成方法存根
		whatAction = (String)arg2.getParameter("action");
		
		if(whatAction.equals("gettablelist")){
			//从sqlbuilder.jsp传入,需要获取选中的表信息
			String [] b = arg2.getParameterValues("selectedtable");
			String [] a = b[0].split(",");
			String tableList="select * from s_q_tableList where tableValue in ('";
			String fieldList="select a.fieldtext,a.fieldvalue,b.tablevalue,(b.tabletext+'.'+a.fieldtext) fieldshow,substring(a.fieldtype,0,4) fieldtype,a.id from s_q_tablefield a,s_q_tablelist b where a.oftable = b.tablevalue and a.oftable in ('";
			String quanlification = "";

			for(int i=0;i<a.length;i++){
				quanlification += a[i];
				quanlification += "','";
			}
			quanlification = quanlification.substring(0,(quanlification.length()-2));
			quanlification +=")";
			tableList += quanlification;
			fieldList += quanlification;
			
	//		System.out.println("quanlification="+quanlification);
	//		System.out.println("tableList="+tableList);
	//		System.out.println("fieldList="+fieldList);
			
			Builder1 sb1 = new Builder1();
			List atablelist = sb1.tablelist(tableList);
			List afieldlist = sb1.fieldList(fieldList);
			StringBuffer buffer = new StringBuffer();
			buffer.append("<script>");
			buffer.append("\n var subcat = new Array(); ");

			for(int j = 0; j<afieldlist.size(); j++){

				Builder1ActionBean tmepOne = (Builder1ActionBean)afieldlist.get(j); 

				 String addBuffer = "\n subcat["+j+"]=new Array('" + tmepOne.getFieldOfTable() + "','S" + tmepOne.getFieldId() + "','" + tmepOne.getFieldShow() + "');"; 

				 buffer.append(addBuffer);
			}

			buffer.append("\n</script>");
			StringBuffer buffer1 = new StringBuffer();
			buffer1.append("<script>");
			buffer1.append("\n var objsqlarray = new Array(); ");
			for(int k=0;k<atablelist.size();k++){
				Builder1ActionBean tempOne = (Builder1ActionBean)atablelist.get(k);
				String addBuffer1 = "\n objsqlarray["+k+"]=new Array('T-" + tempOne.getTableValue() + "','select "+sb1.selectStr(tempOne.getTableValue())+" from " + tempOne.getTableValue() + "','y" + Integer.toString(k) + "');"; 
				buffer1.append(addBuffer1);
			}
			buffer1.append("\n</script>");
			arg2.setAttribute("tablelist",atablelist);
			arg2.setAttribute("fieldlist",afieldlist);
			arg2.setAttribute("jsbuffer",buffer.toString());
			arg2.setAttribute("jsbuffer1",buffer1.toString());
			toUrl = "buildobject";
			
		}else if(whatAction.equals("saveobj")){
			//保存生成的数据对象返回
			
		}
		return new ModelAndView("../search/builder1.jsp");
	}
}
