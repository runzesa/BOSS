package com.workflow.util.bak;

@Deprecated
public class AssigneeBean {
	/** *�������������* **/
	private String assType;
	/** *�����˱���,assignee�Ļ�����Ϊ����,department�Ļ����������,roleͬ��-��ɫ��* **/
	private String assValue;
	/** *����һ�ڵ�������ߵ���ʾ��* **/
	private String outName;
	/** *������* **/
	private String taskName;
	
	public String getAssType() {
		return assType;
	}
	
	public void setAssType(String assType) {
		this.assType = assType;
	}
	
	public String getAssValue() {
		return assValue;
	}
	
	public void setAssValue(String assValue) {
		this.assValue = assValue;
	}

	public String getOutName() {
		return outName;
	}

	public void setOutName(String outName) {
		this.outName = outName;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
}
