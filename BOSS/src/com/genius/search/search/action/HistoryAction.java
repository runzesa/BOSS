/*
 * 创建日期 2005-5-12
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

import com.genius.search.search.History;
import com.genius.search.search.RoleForm;
import com.genius.search.search.TypeForm;
import com.genius.search.search.actionbean.HistoryActionBean;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HistoryAction implements Controller {
	private String whatAction;
	private String toUrl="";
	

	/* （非 Javadoc）
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse response) throws ServletException, IOException {	
		arg2.setCharacterEncoding("gb2312"); 
		whatAction = (String)arg2.getParameter("action");
		int pageNo;
		 if (arg2.getParameter("pageNo") != null) {
            pageNo = Integer.valueOf(arg2.getParameter("pageNo")).intValue();
        } else {
            pageNo = 1;
        }
		
		if(whatAction.equals("delete")){
			//
			History sh=new History();

			boolean e=sh.del(arg2.getParameter("id"));
/*		    ActionErrors error=new ActionErrors();
		    if (!e)
		    	error.add(ActionErrors.GLOBAL_ERROR,new ActionError("errors.crm.sqlobject.delfailure"));
		    else
		    	error.add(ActionErrors.GLOBAL_ERROR,new ActionError("errors.crm.sqlobject.delok"));
	*/			toUrl = "../search/typelist.jsp";
			}
		else if(whatAction.equals("add")){
			//保存sql查询并返回列表
			HistoryActionBean sh =new HistoryActionBean();
			
			sh.setSearchName((String)arg2.getParameter("searchname"));
			sh.setSqlContent((String)arg2.getParameter("sqlcontent"));
			sh.setSqlshow((String)arg2.getParameter("showarray"));
			sh.setSqlPower((String)arg2.getParameter("sqlpower"));
			sh.setSqlQuary((String)arg2.getParameter("conditionvar"));
			sh.setSearchType((String)arg2.getParameter("searchtype"));
			sh.setSqlCountShow((String)arg2.getParameter("sqlcountshow"));
			sh.setSqlCountContent((String)arg2.getParameter("sqlcountcontent"));
			History history = new History();
			history.add(pageNo,sh);
			toUrl = "../search/typelist.jsp";
		}
		else if(whatAction.equals("update")){
			//保存修改的sql查询并返回列表
			HistoryActionBean sh =new HistoryActionBean();
			sh.setSearchName((String)arg2.getParameter("searchname"));
			sh.setSqlContent((String)arg2.getParameter("sqlcontent"));
			sh.setSqlshow((String)arg2.getParameter("showarray"));
			sh.setSqlPower((String)arg2.getParameter("sqlpower"));
			sh.setSqlQuary((String)arg2.getParameter("conditionvar"));
			sh.setSearchType((String)arg2.getParameter("searchtype"));
			sh.setSqlCountShow((String)arg2.getParameter("sqlcountshow"));
			sh.setSqlCountContent((String)arg2.getParameter("sqlcountcontent"));
			String editId = (String)arg2.getParameter("editid");

			History history =new History();
			history.update(editId,pageNo,sh);
			toUrl = "../search/typelist.jsp";
		}
		else if(whatAction.equals("addshow")){
			//打开为保存界面
			TypeForm stf = new TypeForm();
			RoleForm srf = new RoleForm();
			arg2.setAttribute("selectlist",stf.list());
			arg2.setAttribute("rolelist",srf.roleSelect());
			arg2.setAttribute("actiontype","add");
			toUrl = "../search/sqladd.jsp";
			
		}
		else if(whatAction.equals("updateshow")){
			//打开为修改界面
			String editid = (String)arg2.getParameter("id");
			TypeForm stf = new TypeForm();
			RoleForm srf = new RoleForm();
			History sh1 = new History();
			HistoryActionBean sh = sh1.getObjById(editid);
			
		    arg2.setAttribute("actiontype","update");
		    arg2.setAttribute("sqlcontent",sh.getSqlContent());
		    arg2.setAttribute("showarray",sh.getSqlshow());
		    arg2.setAttribute("sqlpower",sh.getSqlPower());
		    arg2.setAttribute("searchname",sh.getSearchName());
		    arg2.setAttribute("sqlquary",sh.getSqlQuary());
		    arg2.setAttribute("editid",editid);
		    arg2.setAttribute("searchtype",sh.getSearchType());
		    arg2.setAttribute("sqlcountshow",sh.getSqlCountShow());
		    arg2.setAttribute("sqlcountcontent",sh.getSqlCountContent());
		    arg2.setAttribute("selectlist",stf.list(sh.getSearchType()));
			arg2.setAttribute("rolelist",srf.roleSelect(sh.getSqlPower()));
		    toUrl = "../search/sqladd.jsp";
		}
		else if(whatAction.equals("addex")){
			//生成sql过程中保存。向导生成的sql语句
			String conditioncont = (String)arg2.getParameter("conditioncont");
			String objsql = (String)arg2.getParameter("objsql");
			String showarray1 = arg2.getParameter("showarray").toString();
			String sqlQuary = arg2.getParameter("conditionvar").toString();
			String [] a = arg2.getParameter("showarray").split(";");
			int fieldcount = a.length;
			String selectStr ="select ";
			String selectStrt="";
			String showarray="";
			for(int i=0;i<fieldcount;i++){
		//		System.out.println(a[i]);
				String [] b = a[i].split(":");
				selectStrt += b[0]+",";

				showarray+=b[1]+",";
			}
			selectStrt = selectStrt.substring(0,selectStrt.length()-1);
			selectStr += selectStrt;
			String sql = selectStr +" from ("+objsql+") yy where "+conditioncont;
		    arg2.setAttribute("actiontype","addex");
		    arg2.setAttribute("sqlcontent",sql);
		    arg2.setAttribute("showarray",showarray1);
		    arg2.setAttribute("sqlquary",sqlQuary);
		    toUrl = "../search/sqladd.jsp";
		}
		
		// TODO 自动生成方法存根
		return new ModelAndView(toUrl);
	}
	private void showList(){
		
		
	}
}
