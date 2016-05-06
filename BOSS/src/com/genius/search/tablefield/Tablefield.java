/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.tablefield;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.genius.data.DataConfig;
import org.genius.data.PageDataConfig;
import org.genius.power.Permission;

import com.genius.search.tablefield.actionbean.InsertActionBean;
import com.genius.search.tablefield.actionbean.OftableActionBean;
import com.genius.search.tablefield.actionbean.SelectActionBean;

public class Tablefield implements ITablefield {

	public int totalSize;

	public String selectSql;
	
	private String selectSumSql;
	
	private String sId;
	
	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public String getSelectSql() {
		return selectSql;
	}

	public void setSelectSql(String selectSql) {
		this.selectSql = selectSql;
	}
	
	public String getSId() {
		return sId;
	}

	public void setSId(String sId) {
		this.sId=sId;
		
	}
	
	
	public ArrayList select(int pageNo, String orderField, String orderType, String searchField,String searchValue, String filter){
		boolean asc;
		PageDataConfig myData = new PageDataConfig(20, pageNo);
		myData.init(20, pageNo);
		ArrayList<SelectActionBean> myList=new ArrayList<SelectActionBean>();
		try {
			myData.openConnection();
			String sql ="select id,fieldvalue,fieldtext,oftable,fieldtype,bz from s_q_tablefield";

			if (filter != null) {
				Permission permission = new Permission();
				sql = permission.filterSql(sql, filter);
			}

			
			if (searchField!=null && searchField.equals("ADSsearchADS")) {
				sql = "select * from(" + sql + ") my_table where " + searchValue ;
			}else if (searchField != null && searchValue != null && !searchField.equals("null") && !searchValue.equals("null")) {
				sql = "select * from(" + sql + ") my_table where " + searchField+ " like '%" + searchValue + "%'";
			
			}

			if(orderField==null||orderField.equals("null")){
				orderField="id";
			}
			if(orderType==null||orderType.equals("null")){
				asc=false;
			}else if(orderType.equals("true")){
				asc=true;
			}else if(orderType.equals("false")){
				asc=false;
			}else{
				asc=false;
			}

			this.selectSumSql=sql;
			if (asc == true) {
				this.selectSql = "select * from(" + sql
						+ ") my_table_order order by  " + orderField + " asc";
			} else {
				this.selectSql = "select * from(" + sql
						+ ") my_table_order order by  " + orderField + " desc";
			}

			ResultSet rs=myData.executeQueryForSqlServer(sql, "id",orderField, asc );
			
			while(rs.next()){
				SelectActionBean tablefieldBean=new SelectActionBean();
				tablefieldBean.setId(rs.getString("id"));
				tablefieldBean.setFieldvalue(rs.getString("fieldvalue"));
				tablefieldBean.setFieldtext(rs.getString("fieldtext"));
				tablefieldBean.setOftable(rs.getString("oftable"));
				tablefieldBean.setFieldtype(rs.getString("fieldtype"));
				tablefieldBean.setBz(rs.getString("bz"));
				myList.add(tablefieldBean);
				tablefieldBean=null;
			}
			totalSize = myData.getTotalSize();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		 }finally{
			myData.closeConnection();
		}
		return myList;
	}
	
	
	public boolean insertNew(String oftable,String fieldtext,String fieldvalue,String fieldtype,String bz){
		
		boolean result=false;
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into s_q_tablefield (fieldvalue,fieldtext,oftable,fieldtype,bz) values ('" + fieldvalue + "','" + fieldtext + "','" + oftable + "','" + fieldtype + "','" + bz + "')";
			myData.addBatch(sql1);
			if(myData.commit()){
				result=true;
			}else{
				result=false;
			}
			myData.endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}
	
	public ArrayList oftableInsertSelect() {
		DataConfig myData = new DataConfig();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select tablevalue,tabletext from s_q_tablelist");
			while (rs.next()) {
				OftableActionBean oftableBean = new OftableActionBean();
				oftableBean.setTablevalue(rs.getString("tablevalue"));
				oftableBean.setTabletext(rs.getString("tabletext"));
				myList.add(oftableBean);
				oftableBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}


	public boolean insertEdit(String oftable,String fieldtext,String fieldvalue,String fieldtype,String bz,String id){
		
		boolean result=false;
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update s_q_tablefield set fieldvalue='" + fieldvalue + "',fieldtext='" + fieldtext + "',oftable='" + oftable + "',fieldtype='" + fieldtype + "',bz='" + bz + "' where id='" + id + "'";
			myData.addBatch(sql1);
			if(myData.commit()){
				result=true;
			}else{
				result=false;
			}
			
			myData.endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}
		
	public InsertActionBean insertSelectEdit(String id) {
		InsertActionBean bean = new InsertActionBean();
		DataConfig myData = new DataConfig();
        try {
            myData.openConnection();
            String sql="select fieldvalue,fieldtext,oftable,fieldtype,bz from s_q_tablefield where id=" + id + ";";
            ResultSet rs = myData.executeQuery(sql);
            while (rs.next()) {
				bean.setFieldvalue(rs.getString("fieldvalue"));
				bean.setFieldtext(rs.getString("fieldtext"));
				bean.setOftable(rs.getString("oftable"));
				bean.setFieldtype(rs.getString("fieldtype"));
				bean.setBz(rs.getString("bz"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        return bean;
    }
    

	
	public boolean delete(String[] id){
		boolean result=false;
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			myData.beginTransaction();
			for(int i=0;i<id.length;i++){
		
				myData.addBatch("delete from  s_q_tablefield where  id ='"+id[i]+"'");
		
			}
			
			if(myData.commit()){
				result=true;
			}else{
				result=false;
			}
			
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}
	}
