package com.workflow.process;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.RepositoryService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import java.util.List;

@Deprecated
public class PicAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("pic");
		
		ProcessEngine processEngine = Configuration.getProcessEngine();
		RepositoryService repositoryService = processEngine.getRepositoryService();
		ExecutionService executionService = processEngine.getExecutionService();
		
		String id = request.getParameter("id");
		ProcessInstance processInstance = executionService.findProcessInstanceById(id);
		String srcName = (processInstance.getId().split("\\."))[0];
		
		String processDefinitionId = processInstance.getProcessDefinitionId();
		ProcessDefinition processDefinition = repositoryService
			.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).uniqueResult();
		InputStream inputStream = repositoryService.
			getResourceAsStream(processDefinition.getDeploymentId(),srcName+".png");
		byte[] b = new byte[1024];
		int len = -1;
		while ((len = inputStream.read(b, 0, 1024)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
		return null;
	}

}
