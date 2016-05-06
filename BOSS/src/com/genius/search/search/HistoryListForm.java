/*
 * 创建日期 2005-6-5
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.genius.data.DataConfig;
import org.genius.data.PageDataConfig;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HistoryListForm {
	int  pageNo;
	String searchName;
	String sqlContent;
	String sqlshow;
	String sqlPower;
	String showdate;
	String id;
	String sqlPowerShow;
	
	

	/**
	 * @return 返回 sqlPowerShow。
	 */
	public String getSqlPowerShow() {
		return sqlPowerShow;
	}
	/**
	 * @param sqlPowerShow 要设置的 sqlPowerShow。
	 */
	public void setSqlPowerShow(String sqlPowerId) {
		this.sqlPowerShow = sqlPowerId;
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
	public ArrayList list(String userpower,int pageNo){
		ArrayList all=new ArrayList();
		PageDataConfig conn=new PageDataConfig(20,pageNo);
		ResultSet rs;
		String sql=""; 
		if (userpower.equals("9999")) {
		sql = "select id,searchname,sqlcontent,sqlshow,sqlquary,savedate,sqlpower from s_q_sqlobject order by sqlpower desc,id desc";}
		else {
			sql = "select id,searchname,sqlcontent,sqlshow,sqlquary,savedate,sqlpower from s_q_sqlobject where sqlpower="+userpower+" order by sqlpower desc,id desc"; }
	//	System.out.println(sql);
		try{
			conn.openConnection();
			rs=conn.executeQuery(sql);
			while(rs.next()){
				HistoryListForm sh=new HistoryListForm();
				sh.setSearchName(rs.getString("searchname"));
				sh.setSqlContent(rs.getString("sqlcontent"));
				sh.setSqlshow(rs.getString("sqlshow"));
				sh.setShowdate(rs.getString("savedate"));		
				sh.setSqlPower(rs.getString("sqlpower"));
				sh.setSqlPowerShow(rs.getString("sqlpower"));
				sh.setId(rs.getString("id"));
				all.add(sh);
			}rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}conn.closeConnection();
		return all;
	}
	
}
