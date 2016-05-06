package com.workflow.util.bak;

@Deprecated
public class AssigneeBean {
	/** *任务接收人类型* **/
	private String assType;
	/** *接收人变量,assignee的话可以为任意,department的话可以填部门名,role同理-角色名* **/
	private String assValue;
	/** *到下一节点的连接线的显示名* **/
	private String outName;
	/** *任务名* **/
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
