package com.genius.search.search.actionbean;

public class HistoryActionBean {
	
	String searchName;
	String sqlContent;
	String sqlshow;
	String sqlPower;
	String showdate;
	String id;
	String sqlQuary;
	String searchType;
	String sqlCountShow;
	String sqlCountContent;
	String searchTypeName;
	
	
	
	
	/**
	 * @return ���� searchTypeName��
	 */
	public String getSearchTypeName() {
		return searchTypeName;
	}
	/**
	 * @param searchTypeName Ҫ���õ� searchTypeName��
	 */
	public void setSearchTypeName(String searchTypeName) {
		this.searchTypeName = searchTypeName;
	}
	/**
	 * @return ���� searchType��
	 */
	public String getSearchType() {
		return searchType;
	}
	/**
	 * @param searchType Ҫ���õ� searchType��
	 */
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	/**
	 * @return ���� sqlCountContent��
	 */
	public String getSqlCountContent() {
		return sqlCountContent;
	}
	/**
	 * @param sqlCountContent Ҫ���õ� sqlCountContent��
	 */
	public void setSqlCountContent(String sqlCountContent) {
		if (sqlCountContent==null)
			sqlCountContent="";
		this.sqlCountContent = sqlCountContent;
	}
	/**
	 * @return ���� sqlCountShow��
	 */
	public String getSqlCountShow() {
		
		return sqlCountShow;
	}
	/**
	 * @param sqlCountShow Ҫ���õ� sqlCountShow��
	 */
	public void setSqlCountShow(String sqlCountShow) {
		if(sqlCountShow==null)
			sqlCountShow="";
		this.sqlCountShow = sqlCountShow;
	}
	/**
	 * @return ���� sqlQuary��
	 */
	public String getSqlQuary() {
		return sqlQuary;
	}
	/**
	 * @param sqlQuary Ҫ���õ� sqlQuary��
	 */
	public void setSqlQuary(String sqlQuary) {
		if(sqlQuary==null)
			sqlQuary="";
		this.sqlQuary = sqlQuary;
	}
	/**
	 * @return ���� id��
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id Ҫ���õ� id��
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return ���� showdate��
	 */
	public String getShowdate() {
		return showdate;
	}
	/**
	 * @param showdate Ҫ���õ� showdate��
	 */
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	/**
	 * @return ���� searchName��
	 */
	public String getSearchName() {
		return searchName;
	}
	/**
	 * @param searchName Ҫ���õ� searchName��
	 */
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	/**
	 * @return ���� sqlContent��
	 */
	public String getSqlContent() {
		return sqlContent;
	}
	/**
	 * @param sqlContent Ҫ���õ� sqlContent��
	 */
	public void setSqlContent(String sqlContent) {
		this.sqlContent = sqlContent;
	}
	/**
	 * @return ���� sqlPower��
	 */
	public String getSqlPower() {
		return sqlPower;
	}
	/**
	 * @param sqlPower Ҫ���õ� sqlPower��
	 */
	public void setSqlPower(String sqlPower) {
		this.sqlPower = sqlPower;
	}
	/**
	 * @return ���� sqlshow��
	 */
	public String getSqlshow() {
		return sqlshow;
	}
	/**
	 * @param sqlshow Ҫ���õ� sqlshow��
	 */
	public void setSqlshow(String sqlshow) {
		this.sqlshow = sqlshow;
	}
	/**
	 * @return ���� conditionContent��
	 */

}
