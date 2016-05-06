package com.workflow.util;

import org.jbpm.api.task.Task;

public class FlowInfo {
	
	/**
	 * 通过当前任务获取流程对应的表单地址
	 * @param 当前任务
	 */
	public String getDefaultForm(Task curTask){
		String defaultForm = "";
		try {
			XmlInfo xmlInfo = new XmlInfo(getProcessDefinitionName(curTask));
			defaultForm = xmlInfo.getDefault();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return defaultForm;
	}
	
	/**
	 * 获得当前任务所属流程定义名称
	 * @param 当前任务
	 */
	private String getProcessDefinitionName(Task curTask){
		//String executionId = (curTask.getExecutionId()).replace(".",",");
		//String[] names = (executionId).split(",");
		String[] names = (curTask.getExecutionId()).split("\\.");
		return names[0];
	}
}
