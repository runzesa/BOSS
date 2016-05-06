/*
 * �������� 2005-6-24
 *
 * TODO
 * ����з��� 
 * 
 */
package com.genius.search.search.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//import org.apache.catalina.connector.Request;
import org.genius.data.PageDataConfig;

import com.genius.search.search.History;
import com.genius.search.search.Result;
import com.genius.search.search.actionbean.HistoryActionBean;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class ResultActionEx implements Controller {

	/* ���� Javadoc��
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ModelAndView handleRequest(HttpServletRequest arg2,
			HttpServletResponse response) throws ServletException, IOException {	
		// TODO �Զ����ɷ������
		String userid= arg2.getSession().getAttribute("userId")+"";
		
		String deptid= arg2.getSession().getAttribute("departmentId")+"";
		String currentPage=arg2.getParameter("currentPage");//��ǰҳ����
		String searchid = (String)arg2.getSession().getAttribute("searchid");
		String [] sqlQuaryCont = (String [])arg2.getSession().getAttribute("sqlquary");
		History h =new History();
		HistoryActionBean sh = h.getObjById(searchid);
		arg2.setAttribute("searchName", sh.getSearchName());//�����ѯ����
		String showarray1 = sh.getSqlshow();
		String [] a = showarray1.split(";");
		int fieldcount = a.length;
		String showarray="";
		String selectStrt="";
		for(int i=0;i<fieldcount;i++){
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
		sql = sr.sqlQuary(sql,sqlQuaryCont);
		
//		---------������sql������session-------------
		HttpSession session = arg2.getSession();
		session.setAttribute("searchsql",sql);
		session.setAttribute("searchid",searchid);
	//	System.out.println(sql);
		
		int pageNo;
		if (arg2.getParameter("pageNo") != null) {
          pageNo = Integer.valueOf(arg2.getParameter("pageNo")).intValue();
		} else {
          pageNo = 1;
		}
		 
		List searchresult = sr.list(sql,selectStrt,pageNo);
		
		String countString="";
		if(sh.getSqlCountShow()!=null&&sh.getSqlCountShow().length()>0){
			String sql1 = sh.getSqlCountContent();
			sql1 = sql1+" ("+sql+")";
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
                .getToolbar("resultex.do?1=1");
		arg2.setAttribute("toolBar", toolBar);

//		arg2.setAttribute("toolbar",p.getToolBar("searchresultex.do?1=1"));
		arg2.setAttribute("mylist",searchresult);
		arg2.setAttribute("myshow",showarray);
		arg2.setAttribute("sr",sr);	
//		System.out.println("countstring="+countString);
		
		String lx = arg2.getParameter("lx");
		String toUrl = "../search/result.jsp";
		if("0".equals(lx) && (null==arg2.getSession().getAttribute("login") || "null".equals(arg2.getSession().getAttribute("login")))){
			toUrl = "../search/result2.jsp";
		}else{
			toUrl = "../search/result.jsp";
		}
		
		return new ModelAndView(toUrl);
	}
}
