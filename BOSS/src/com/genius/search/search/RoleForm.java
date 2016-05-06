
/*
*Copyright GuanHui . All rights reserved.
*/
package com.genius.search.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.RoleFormActionBean;


public class RoleForm {

	public ArrayList roleSelect(){
		DataConfig myData=new DataConfig();
		ArrayList myList=new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs=myData.executeQuery("select name ,id from s_role order by id");
			while(rs.next()){
				RoleFormActionBean roleBean=new RoleFormActionBean();
				roleBean.setId(rs.getString("id"));
				roleBean.setRole(rs.getString("name"));
				roleBean.setSelectStatus("");				
				myList.add(roleBean);
				roleBean=null;
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("com.genius.mobile.search"
                    + " roleSelect is error");
            e.printStackTrace();		 }finally{
			myData.closeConnection();
		}
		return myList;
	}

	public ArrayList roleSelect(String sqlpower){
		DataConfig myData=new DataConfig();
		ArrayList myList=new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs=myData.executeQuery("select name ,id from s_role order by id");
			while(rs.next()){
				RoleFormActionBean roleBean=new RoleFormActionBean();
				roleBean.setId(rs.getString("id"));
				roleBean.setRole(rs.getString("name"));
				String selects="";
  /* ÁÙÊ±Òþ²Ø             
				if(rs.getString("id").equals(sqlpower))*/
                	selects="selected";
                roleBean.setSelectStatus(selects);	
				myList.add(roleBean);
				roleBean=null;
			}
			rs.close();
		} catch (SQLException e) {
			System.out.println("com.genius.tcxmgl.search"
                    + " roleSelect is error");
            e.printStackTrace();		 }finally{
			myData.closeConnection();
		}
		return myList;
	}
	
	
}

