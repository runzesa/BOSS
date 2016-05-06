package com.workflow.definition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class DelProcess implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DelProcess");
		
		String id = request.getParameter("id");
		
		ProcessEngine pe = Configuration.getProcessEngine();
		RepositoryService rs = pe.getRepositoryService();
		try{
			rs.deleteDeploymentCascade(id);
		}catch(Exception e){
			rs.deleteDeploymentCascade(id);
		}
		return new ModelAndView("definitionlist.jsp");
	}

}
