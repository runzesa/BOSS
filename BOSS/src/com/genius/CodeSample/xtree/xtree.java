package com.genius.CodeSample.xtree;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.genius.data.DataConfig;

import com.genius.CodeSample.xtree.actionbean.XtreeSelectBean;
import com.genius.CodeSample.xtree.actionbean.XtreeUserBean;



public class xtree {
	public int totalSize;

	public ArrayList select() {
		DataConfig myData = new DataConfig();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			String sql = "select id,name from s_department where r_parent_id=0 order by id ";

			ResultSet rs = myData.executeQuery(sql);
			while (rs.next()) {
				XtreeSelectBean xtreeBean = new XtreeSelectBean();
				xtreeBean.setId(rs.getString("id"));
				xtreeBean.setName(rs.getString("name"));
				myList.add(xtreeBean);
				xtreeBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public ArrayList selectByParent(String pid) {
		DataConfig myData = new DataConfig();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			String sql = "select id,name from s_department where r_parent_id= "+pid+" order by id ";

			ResultSet rs = myData.executeQuery(sql);
			while (rs.next()) {
				XtreeSelectBean xtreeBean = new XtreeSelectBean();
				xtreeBean.setId(rs.getString("id"));
				xtreeBean.setName(rs.getString("name"));
				myList.add(xtreeBean);
				xtreeBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public boolean hasChild(String pid){
		DataConfig myData = new DataConfig();
		ArrayList myList = new ArrayList();
		boolean result=false;
		try{
			myData.openConnection();
			String sql = "select id from s_department where r_parent_id= "+pid;
			ResultSet rs = myData.executeQuery(sql);
			if(rs.next())
				return true;
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}
	
	public ArrayList selectUserByDepatment(String did){
		ArrayList myList = new ArrayList();
		DataConfig myData = new DataConfig();
		try{
			myData.openConnection();
			String sql = "select id,name from s_userinfo where department_id = "+did+" order by id ";
			ResultSet rs = myData.executeQuery(sql);
			while(rs.next()){
				XtreeUserBean userBean = new XtreeUserBean();
				userBean.setId(rs.getString("id"));
				userBean.setName(rs.getString("name"));
				myList.add(userBean);
				userBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
}

