/*
 * �������� 2005-6-5
 *
 * TODO
 * ����з��� ����
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
	 * @return ���� sqlPowerShow��
	 */
	public String getSqlPowerShow() {
		return sqlPowerShow;
	}
	/**
	 * @param sqlPowerShow Ҫ���õ� sqlPowerShow��
	 */
	public void setSqlPowerShow(String sqlPowerId) {
		this.sqlPowerShow = sqlPowerId;
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
