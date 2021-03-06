/*
*Generated by LiuRunze. 2016-04-09 15:08:41
*/
package com.genius.BOSS.login.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.genius.log.LogDatabaseAdvice;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.genius.BOSS.login.Login;

public class LoginOutAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();	
		if(session.getAttribute("userId")==null)
			return new ModelAndView("/errorstate.jsp");
		
		Logger logger = Logger.getLogger(LoginOutAction.class);
		logger.fatal(session.getAttribute("userId") + " LoginOut!");
		Login login = new Login();
		login.log(session.getAttribute("userId").toString(),
				LogDatabaseAdvice.TYPE_LOGINOUT);
				
		Map activeSession = (HashMap)application.getAttribute("activeSession");
		if(activeSession!=null){
			activeSession.remove((String)session.getAttribute("userId"));
			application.setAttribute("activeSession",activeSession);
		}
		
		Enumeration e = session.getAttributeNames();
		while(e.hasMoreElements()){
			session.removeAttribute((String)e.nextElement());
		}
		session.invalidate();
		return new ModelAndView("/login.jsp");

	}
}

