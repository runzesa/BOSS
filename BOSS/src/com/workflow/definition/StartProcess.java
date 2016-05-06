package com.workflow.definition;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessEngine;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class StartProcess implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("startProcess");
		
		String pdId = request.getParameter("key");
		ProcessEngine pe = Configuration.getProcessEngine();
		ExecutionService es = pe.getExecutionService();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("init_user",request.getSession().getAttribute("userId"));
		map.put("formid",request.getParameter("formid"));//����ļ�ֵ,��������������Ӧ�����ݱ������ݵ�id
		es.startProcessInstanceByKey(pdId,map);
		
		return null;
	}
}
