/*
 * �������� 2005-5-13
 *
 * TODO
 * ����з��� ����
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.Builder1ActionBean;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class Builder1 {
	public List tablelist(String sql){
		ArrayList r_list = new ArrayList();
		DataConfig conn = new DataConfig();
		ResultSet rs = null;
        
		try {
			conn.openConnection();
			System.out.println("searchbuilder1.java-tablelist  ="+sql);
			rs = conn.executeQuery(sql);
			while (rs.next()) {
				Builder1ActionBean sb=new Builder1ActionBean();

				sb.setTableText(rs.getString("tabletext"));
				sb.setTableValue(rs.getString("tablevalue"));
				sb.setTableValueShow("T-"+rs.getString("tablevalue"));

				r_list.add(sb);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.closeConnection();
			}
		}
		return r_list;
			
	}
	public List fieldList(String sql){
		ArrayList r_list = new ArrayList();
		DataConfig conn = new DataConfig();
		ResultSet rs = null;

		try {
			conn.openConnection();
	//		System.out.println("searchbuilder1.java-fieldList  ="+sql);
			rs = conn.executeQuery(sql);
			while (rs.next()) {
				Builder1ActionBean sb=new Builder1ActionBean();

				sb.setFieldOfTable(rs.getString("tablevalue"));
				sb.setFieldShow(rs.getString("fieldshow"));
				sb.setFieldValue(rs.getString("fieldvalue"));
				sb.setFieldType(rs.getString("fieldtype"));
				sb.setFieldId(rs.getString("id"));
				r_list.add(sb);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.closeConnection();
			}
		}
		return r_list;
		}
	public String selectStr(String ss){
		String selectStr="";
		String sql = "select * from s_q_tablefield where oftable='"+ss+"'";
	//	System.out.println("searchBuilder1.selectStr:"+sql);
		DataConfig conn = new DataConfig();
		ResultSet rs = null;
	
		try {
			conn.openConnection();
			rs = conn.executeQuery(sql);
			while (rs.next()) {
				selectStr +=rs.getString("fieldvalue")+" S"+rs.getString("id")+",";
	
			}
			selectStr = selectStr.substring(0,selectStr.length()-1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.closeConnection();
			}
		}
		return selectStr;
	}
}
