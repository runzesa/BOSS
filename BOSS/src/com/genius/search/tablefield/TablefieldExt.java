/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.tablefield;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.genius.data.DataConfig;
import com.genius.search.tablefield.actionbean.*;

public class TablefieldExt extends Tablefield{

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


