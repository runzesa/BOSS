package com.workflow.util;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.genius.data.DataConfig;

/**
 * 某些地方可能会需要查询数据库,通过此类实现具体需求
 */
public class GetData {
	private static DataConfig myData = new DataConfig();
	
	/**
	 * 根据id获取用户名
	 * @param userID 用户id
	 * @return 用户名
	 */
	public static String getNameById(String userID){
		String name = "";
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select a.name from s_userinfo a where a.id='" + userID+"'");
			if(rs.next()){
				name = rs.getString("name");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return name;
	}
	
	/**
	 * 根据用户登录名获取id
	 * @param userID 用户id
	 * @return 用户id
	 */
	public static String getIdByUserName(String userID){
		String name = "";
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select a.id from s_userinfo a where a.username='" + userID+"'");
			if(rs.next()){
				name = rs.getString("id");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return name;
	}
	
//	public static void delTask(String taskId, String executionId){
//		try {
//			myData.openConnection();
//			myData.beginTransaction();
//			myData.addBatch("delete JBPM4_TASK where EXECUTION_ID_='"+executionId+"' and DBID_<>'"+taskId+"'");
//			//ResultSet rs = myData.executeQuery("select a.name from s_userinfo a where a.id='" + userID+"'");
//			
//			myData.commit();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			myData.closeConnection();
//		}
//	}
}
