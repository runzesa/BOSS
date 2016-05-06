/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.searchtype.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.adminmanager.login.Login;
import com.genius.search.searchtype.SearchtypeExt;
import com.genius.search.searchtype.actionbean.InsertActionBean;

public final class InsertSelectEditAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null
				|| !(Login.loginAdmin(session.getAttribute("userName")
						.toString(), session.getAttribute("roleId").toString()))) {
			return new ModelAndView("../error.jsp");
		}
		
		String myId = request.getParameter("id");

		SearchtypeExt searchtypeExt = new SearchtypeExt();
		InsertActionBean bean = searchtypeExt.insertSelectEdit(myId);
		
		request.setAttribute("bean", bean);
		request.setAttribute("updateid", myId);
		request.setAttribute("typeList", searchtypeExt.searchparentidInsertSelect());
		return new ModelAndView("st_insert.jsp?acttype=update");
	}
}