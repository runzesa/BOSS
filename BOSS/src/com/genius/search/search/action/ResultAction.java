/*
 * 创建日期 2005-5-12
 *
 * TODO
 * 天成研发部
 * 
 */
package com.genius.search.search.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.genius.search.search.Result;

import javax.servlet.ServletException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


import org.genius.data.PageDataConfig;

import java.io.IOException;
import java.util.List;
import com.genius.search.search.History;
import com.genius.search.search.actionbean.HistoryActionBean;



/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ResultAction implements Controller {
	

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse arg3) throws ServletException, IOException {	
		String lx = arg2.getParameter("lx");
		
		String searchid;
		searchid = arg2.getParameter("id");
		arg2.getSession().setAttribute("searchid",searchid);
		
		String actionType=(String)arg2.getParameter("action");
		String toUrl="list";
		String userid= arg2.getSession().getAttribute("userId")+"";
		String deptid= arg2.getSession().getAttribute("departmentId")+"";

		int pageNo;
		 if (arg2.getParameter("pageNo") != null) {
           pageNo = Integer.valueOf(arg2.getParameter("pageNo")).intValue();
       } else {
           pageNo = 1;
       }
		
		if(actionType.equals("list")){
			String currentPage=arg2.getParameter("currentPage");//当前页面数
			String conditioncont = (String)arg2.getParameter("conditioncont");
			String objsql = (String)arg2.getParameter("objsql");
			String showarray1 = arg2.getParameter("showarray").toString();
			String [] a = arg2.getParameter("showarray").split(";");
			int fieldcount = a.length;
			String selectStr ="select ";
			String selectStrt="";
			String showarray="";
			for(int i=0;i<fieldcount;i++){
				String [] b = a[i].split(":");
				selectStrt += b[0]+",";
	
				showarray+=b[1]+",";
			}
			selectStrt = selectStrt.substring(0,selectStrt.length()-1);
			selectStr += selectStrt;
			String sql = selectStr +" from ("+objsql+") yy where "+conditioncont;
			Result sr = new Result();
			List searchresult = sr.list(sql,selectStrt,pageNo);
//			arg2.setAttribute("toolbar",p.getToolBar("searchresult.do?action=list",conditioncont,objsql,showarray1));
			arg2.setAttribute("mylist",searchresult);
			arg2.setAttribute("myshow",showarray);
			arg2.setAttribute("sr",sr);
			arg2.setAttribute("searchName", arg2.getAttribute("searchName"));//存入查询名称
			
		}else if(actionType.equals("listex")){
			searchid = arg2.getParameter("id");
			History h =new History();
			HistoryActionBean sh = h.getObjById(searchid);
			arg2.setAttribute("searchName", sh.getSearchName());//存入查询名称
			if(!(sh.getSqlQuary()==null||sh.getSqlQuary().equals(""))){
				arg3.sendRedirect("quary.do?actiontype=fill&id="+searchid+"&lx="+lx);
			
				return null;
			}
			String showarray1 = sh.getSqlshow();
			String [] a = showarray1.split(";");
			int fieldcount = a.length;
			String showarray="";
			String selectStrt="";
			for(int i=0;i<fieldcount;i++){
				if(a[i].indexOf(":")<=0){
					System.out.println("生成查询项目列表失败!请检查查询记录");
					return null;}
				String [] b = a[i].split(":");
				selectStrt += b[0]+";";
				showarray+=b[1]+",";
			}
			selectStrt = selectStrt.substring(0,selectStrt.length()-1);
			showarray = showarray.substring(0,showarray.length()-1);
			String sql = sh.getSqlContent();
			Result sr = new Result();
			sql = sr.sqlReplace(sql,"[[deptId]]",deptid);
			sql = sr.sqlReplace(sql,"[[userId]]",userid);

			arg2.getSession().setAttribute("searchsql",sql);
			arg2.getSession().setAttribute("searchid",searchid);
			List searchresult = sr.list(sql,selectStrt,pageNo);
			String countString="";
			if(sh.getSqlCountShow()!=null&&sh.getSqlCountShow().length()>0){
				String sql1 = sh.getSqlCountContent();
				sql1 = sql1 +" ("+sql+")";
				String sqlshow = sh.getSqlCountShow();
				if(sqlshow.indexOf(",")>0){
				String []sqlCountShow = sqlshow.split(",");
				countString = sr.countShow(sqlCountShow,sql1,fieldcount);}
				else{
					String [] sqlCountShow = new String[1];
					sqlCountShow[0] = sqlshow;
					
					countString = sr.countShow(sqlCountShow,sql1,fieldcount);
				}
			}
			arg2.setAttribute("countstring",countString);
			 PageDataConfig myData = new PageDataConfig(sr.totalSize, 20,
	                pageNo);
	        String toolBar = myData
	                .getToolbar("result.do?action=listex&id="+searchid);
			arg2.setAttribute("toolBar", toolBar);
//			arg2.setAttribute("toolbar",p.getToolBar("searchresult.do?action=listex&id="+searchid));
			arg2.setAttribute("mylist",searchresult);
			arg2.setAttribute("myshow",showarray);
			
			arg2.setAttribute("sr",sr);	
		
		}
		
		String url = "../search/result.jsp";
		if("0".equals(lx) && (null==arg2.getSession().getAttribute("login") || "null".equals(arg2.getSession().getAttribute("login")))){
			url = "../search/result.jsp";
		}else{
			url = "../search/result.jsp";
		}
		// TODO 自动生成方法存根
		return new ModelAndView(url);
	}
}
