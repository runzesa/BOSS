package com.genius.search.search;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.genius.data.DataConfig;

import com.genius.adminmanager.userinfo.*;


public class Suserinfo extends Userinfo{
	public boolean roleChek(String power){
        DataConfig myData = new DataConfig();
        String searchPower="";
        try {
            myData.openConnection();
            String sql = "select count(*) row_count from (select a.role_id,a.operate_id,b.class_name "+
			             "from s_role_operate a,s_operate b where a.operate_id=b.id and b.class_name="+
						 "'search'and a.role_id =" +power +") u";

           // System.out.println("sql:"+sql);
            ResultSet rs = myData.executeQuery(sql);
            while (rs.next()) {
                searchPower = rs.getString("row_count");
            }
        } catch (SQLException e) {
        	System.out.println("userinfo.rolechek Error!");
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        if (searchPower.equals("0")) { return true;} 
        else    	return false;
    }
}
