package com.workflow.util.beans;

/**
 * �����Ľڵ�bean
 */
public class ObjectElementBean {
	/** *�ڵ��ǩ��* **/
	private String tagName;
	/** *�ڵ���ʾ��* **/
	private String name;
	/** *�ڵ�����* **/
	private String g;
	/** *connection������Ŀ��* **/
	private String to;
	/** *�������������:role/department/assignee* **/
	private String userType;
	/** *������* **/
	private String user;
	
	private String userId;
	/** *�ɶ��ֶ�* **/
	private String formitem_r;
	/** *��д�ֶ�* **/
	private String formitem_w;
	

	
	/**
	 * @return �ڵ��ǩ��
	 */
	public String getTagName() {
		return tagName;
	}
	/**
	 * @param elementName �ڵ��ǩ��
	 */
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	/**
	 * @return �ڵ���ʾ��
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name �ڵ���ʾ��
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return �ڵ�����
	 */
	public String getG() {
		return g;
	}
	/**
	 * @param g �ڵ�����
	 */
	public void setG(String g) {
		this.g = g;
	}
	/**
	 * @return connection������Ŀ��
	 */
	public String getTo() {
		return to;
	}
	/**
	 * @param to connection������Ŀ��
	 */
	public void setTo(String to) {
		this.to = to;
	}
	/**
	 * @return �������������:role/department/assignee
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param type �������������:role/department/assignee
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return ������
	 */
	public String getUser() {
		return user;
	}
	/**
	 * @param assignee ������
	 */
	public void setUser(String user) {
		this.user = user;
	}
	/**
	 * @return �ɶ��ֶ�
	 */
	public String getFormitem_r() {
		return formitem_r;
	}
	/**
	 * @param formitemR �ɶ��ֶ�
	 */
	public void setFormitem_r(String formitemR) {
		formitem_r = formitemR;
	}
	/**
	 * @return ��д�ֶ�
	 */
	public String getFormitem_w() {
		return formitem_w;
	}
	/**
	 * @param formitemW ��д�ֶ�
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
