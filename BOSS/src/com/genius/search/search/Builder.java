/*
 * 创建日期 2005-5-12
 *
 * TODO
 * 天成研发部
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.BuilderActionBean;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class Builder {

	/**
	 * table列表
	 * @return
	 */
	public List list(){
		ArrayList r_list = new ArrayList();
		DataConfig conn = new DataConfig();
		ResultSet rs = null;
        String sql = "select * from s_q_tableList";
		try {
			conn.openConnection();
//			System.out.println("SearchBuilder.java  ="+sql);
			rs = conn.executeQuery(sql);
			while (rs.next()) {
				BuilderActionBean sb=new BuilderActionBean();

				sb.setTableText(rs.getString("tabletext"));
				sb.setTableValue(rs.getString("tablevalue"));
				sb.setTableId(Integer.toString(rs.getInt("id")));
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
