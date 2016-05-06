package com.workflow.util.beans;

/**
 * 公共的节点bean
 */
public class ObjectElementBean {
	/** *节点标签名* **/
	private String tagName;
	/** *节点显示名* **/
	private String name;
	/** *节点坐标* **/
	private String g;
	/** *connection连接线目标* **/
	private String to;
	/** *任务接收人类型:role/department/assignee* **/
	private String userType;
	/** *接收人* **/
	private String user;
	
	private String userId;
	/** *可读字段* **/
	private String formitem_r;
	/** *可写字段* **/
	private String formitem_w;
	

	
	/**
	 * @return 节点标签名
	 */
	public String getTagName() {
		return tagName;
	}
	/**
	 * @param elementName 节点标签名
	 */
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	/**
	 * @return 节点显示名
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name 节点显示名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return 节点坐标
	 */
	public String getG() {
		return g;
	}
	/**
	 * @param g 节点坐标
	 */
	public void setG(String g) {
		this.g = g;
	}
	/**
	 * @return connection连接线目标
	 */
	public String getTo() {
		return to;
	}
	/**
	 * @param to connection连接线目标
	 */
	public void setTo(String to) {
		this.to = to;
	}
	/**
	 * @return 任务接收人类型:role/department/assignee
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param type 任务接收人类型:role/department/assignee
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return 接收人
	 */
	public String getUser() {
		return user;
	}
	/**
	 * @param assignee 接收人
	 */
	public void setUser(String user) {
		this.user = user;
	}
	/**
	 * @return 可读字段
	 */
	public String getFormitem_r() {
		return formitem_r;
	}
	/**
	 * @param formitemR 可读字段
	 */
	public void setFormitem_r(String formitemR) {
		formitem_r = formitemR;
	}
	/**
	 * @return 可写字段
	 */
	public String getFormitem_w() {
		return formitem_w;
	}
	/**
	 * @param formitemW 可写字段
	 */
	public void setFormitem_w(String formitemW) {
		formitem_w = formitemW;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
