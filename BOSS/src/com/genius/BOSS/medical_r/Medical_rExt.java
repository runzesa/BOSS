/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.medical_r;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.genius.data.DataConfig;
import com.genius.BOSS.medical_r.actionbean.*;

public class Medical_rExt extends Medical_r{

    public SelectActionBean getWindowData(String id) {
    	SelectActionBean bean = new SelectActionBean();
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			String sql = "select * from table where id="+id;
			ResultSet rs = myData.executeQuery(sql);
			while (rs.next()) {
				/*
				bean.setName(rs.getString("name"));
				*/
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}

		return bean;
    }
}


