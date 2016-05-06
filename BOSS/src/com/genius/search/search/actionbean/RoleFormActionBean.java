package com.genius.search.search.actionbean;

public class RoleFormActionBean {


	private String role;

	private String id;
	private String selectStatus;
	
	
	/**
	 * @return 返回 selectStatus。
	 */
	public String getSelectStatus() {
		return selectStatus;
	}
	/**
	 * @param selectStatus 要设置的 selectStatus。
	 */
	public void setSelectStatus(String selectStatus) {
		this.selectStatus = selectStatus;
	}
	public String getRole(){
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getId(){
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
