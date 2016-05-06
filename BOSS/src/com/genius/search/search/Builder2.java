/*
 * 创建日期 2005-5-21
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.Builder2ActionBean;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class Builder2 {
	
	public String builderSql(String wheresql){
		String [] a = wheresql.split(",");
		String fieldList="select a.fieldtext,a.fieldvalue,b.tablevalue,(b.tabletext+'.'+a.fieldtext) fieldshow,substring(a.fieldtype,0,5) fieldtype,a.id from s_q_tablefield a,s_q_tablelist b where a.oftable = b.tablevalue and a.oftable in ('";
		String quanlification = "";

		for(int i=0;i<a.length;i++){
			quanlification += a[i];
			quanlification += "','";
		}
		quanlification = quanlification.substring(0,(quanlification.length()-2));
		quanlification +=")";

		fieldList += quanlification;
		return fieldList;
		
	}
	public List fieldList(String sql){
		ArrayList r_list = new ArrayList();
		DataConfig conn = new DataConfig();
		ResultSet rs = null;

		try {
			conn.openConnection();
			rs = conn.executeQuery(sql);
			while (rs.next()) {
				Builder2ActionBean sb=new Builder2ActionBean();

				sb.setFieldOfTable(rs.getString("tablevalue"));
				sb.setFieldShow(rs.getString("fieldshow"));
				sb.setFieldValue(rs.getString("fieldvalue"));
				sb.setFieldType(rs.getString("fieldtype"));
				sb.setFieldOptionValue(rs.getString("tablevalue")+"."+rs.getString("fieldvalue"));
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
}
