package com.workflow.util;

import org.jbpm.api.task.Task;

public class FlowInfo {
	
	/**
	 * ͨ����ǰ�����ȡ���̶�Ӧ�ı���ַ
	 * @param ��ǰ����
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
	 * ��õ�ǰ�����������̶�������
	 * @param ��ǰ����
	 */
	private String getProcessDefinitionName(Task curTask){
		//String executionId = (curTask.getExecutionId()).replace(".",",");
		//String[] names = (executionId).split(",");
		String[] names = (curTask.getExecutionId()).split("\\.");
		return names[0];
	}
}
