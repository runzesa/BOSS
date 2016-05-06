package com.workflow.definition;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class DeployForXml implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DeployForXml");
		
		String fileName = request.getParameter("name");
		
		//ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	//	applicationContext.start();
		//ProcessEngine pe = (ProcessEngine)applicationContext.getBean("processEngine");
		ProcessEngine pe = Configuration.getProcessEngine();
		RepositoryService rs = pe.getRepositoryService();
		rs.createDeployment().addResourceFromClasspath("../../process/"+fileName).deploy();
		
		return new ModelAndView("definitionlist.jsp");
	}

}
