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
	 * @return 返回 searchTypeName。
	 */
	public String getSearchTypeName() {
		return searchTypeName;
	}
	/**
	 * @param searchTypeName 要设置的 searchTypeName。
	 */
	public void setSearchTypeName(String searchTypeName) {
		this.searchTypeName = searchTypeName;
	}
	/**
	 * @return 返回 searchType。
	 */
	public String getSearchType() {
		return searchType;
	}
	/**
	 * @param searchType 要设置的 searchType。
	 */
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	/**
	 * @return 返回 sqlCountContent。
	 */
	public String getSqlCountContent() {
		return sqlCountContent;
	}
	/**
	 * @param sqlCountContent 要设置的 sqlCountContent。
	 */
	public void setSqlCountContent(String sqlCountContent) {
		if (sqlCountContent==null)
			sqlCountContent="";
		this.sqlCountContent = sqlCountContent;
	}
	/**
	 * @return 返回 sqlCountShow。
	 */
	public String getSqlCountShow() {
		
		return sqlCountShow;
	}
	/**
	 * @param sqlCountShow 要设置的 sqlCountShow。
	 */
	public void setSqlCountShow(String sqlCountShow) {
		if(sqlCountShow==null)
			sqlCountShow="";
		this.sqlCountShow = sqlCountShow;
	}
	/**
	 * @return 返回 sqlQuary。
	 */
	public String getSqlQuary() {
		return sqlQuary;
	}
	/**
	 * @param sqlQuary 要设置的 sqlQuary。
	 */
	public void setSqlQuary(String sqlQuary) {
		if(sqlQuary==null)
			sqlQuary="";
		this.sqlQuary = sqlQuary;
	}
	/**
	 * @return 返回 id。
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id 要设置的 id。
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return 返回 showdate。
	 */
	public String getShowdate() {
		return showdate;
	}
	/**
	 * @param showdate 要设置的 showdate。
	 */
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	/**
	 * @return 返回 searchName。
	 */
	public String getSearchName() {
		return searchName;
	}
	/**
	 * @param searchName 要设置的 searchName。
	 */
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	/**
	 * @return 返回 sqlContent。
	 */
	public String getSqlContent() {
		return sqlContent;
	}
	/**
	 * @param sqlContent 要设置的 sqlContent。
	 */
	public void setSqlContent(String sqlContent) {
		this.sqlContent = sqlContent;
	}
	/**
	 * @return 返回 sqlPower。
	 */
	public String getSqlPower() {
		return sqlPower;
	}
	/**
	 * @param sqlPower 要设置的 sqlPower。
	 */
	public void setSqlPower(String sqlPower) {
		this.sqlPower = sqlPower;
	}
	/**
	 * @return 返回 sqlshow。
	 */
	public String getSqlshow() {
		return sqlshow;
	}
	/**
	 * @param sqlshow 要设置的 sqlshow。
	 */
	public void setSqlshow(String sqlshow) {
		this.sqlshow = sqlshow;
	}
	/**
	 * @return 返回 conditionContent。
	 */

}
