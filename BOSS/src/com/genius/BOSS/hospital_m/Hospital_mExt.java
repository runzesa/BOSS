/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.hospital_m;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.genius.data.DataConfig;
import com.genius.BOSS.hospital_m.actionbean.*;

public class Hospital_mExt extends Hospital_m{

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


