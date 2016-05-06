/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.tablefield.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.adminmanager.login.Login;
import com.genius.search.tablefield.TablefieldExt;

public final class InsertNewAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null
				|| !(Login.loginAdmin(session.getAttribute("userName")
						.toString(), session.getAttribute("roleId").toString()))) {
			return new ModelAndView("../error.jsp");
		}

		String fieldvalue = java.net.URLDecoder.decode(request.getParameter("fieldvalue"),"UTF-8");
		String fieldtext = java.net.URLDecoder.decode(request.getParameter("fieldtext"),"UTF-8");
		String oftable = java.net.URLDecoder.decode(request.getParameter("oftable"),"UTF-8");
		String fieldtype = java.net.URLDecoder.decode(request.getParameter("fieldtype"),"UTF-8");
		String bz = java.net.URLDecoder.decode(request.getParameter("bz"),"UTF-8");
		
		TablefieldExt tablefieldExt = new TablefieldExt();
		tablefieldExt.insertNew(oftable, fieldtext, fieldvalue, fieldtype, bz);
		return new ModelAndView("tf_select.do");
	}
}

