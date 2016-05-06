/*
*Generated by LiuRunze. 2009-06-09 18:02:15
*/
package com.genius.search.searchtype;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.genius.data.DataConfig;
import org.genius.data.PageDataConfig;
import org.genius.power.Permission;

import com.genius.search.searchtype.actionbean.InsertActionBean;
import com.genius.search.searchtype.actionbean.SearchparentidActionBean;
import com.genius.search.searchtype.actionbean.SelectActionBean;

public class Searchtype implements ISearchtype {

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
			String sql ="select searchid,searchname,(select b.searchname from s_q_searchtype b where b.searchid=a.searchparentid)searchparentid from s_q_searchtype a";

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
				orderField="searchid";
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

			ResultSet rs=myData.executeQueryForSqlServer(sql, "searchid",orderField, asc );
			
			while(rs.next()){
				SelectActionBean searchtypeBean=new SelectActionBean();
				
				searchtypeBean.setSearchid(rs.getString("searchid"));
				String check = rs.getString("searchname");
				if(null==check || "null".equals(check))
					check="";
				searchtypeBean.setSearchname(check);
				check = rs.getString("searchparentid");
				if(null==check || "null".equals(check))
					check="";
				searchtypeBean.setSearchparentid(check);
				
				myList.add(searchtypeBean);
				searchtypeBean=null;
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
    
	public boolean insertNew(String searchparentid,String searchname){
		
		boolean result=false;
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into s_q_searchtype (searchname,searchparentid) values ('" + searchname + "','" + searchparentid + "')";
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
	
	public ArrayList searchparentidInsertSelect() {
		DataConfig myData = new DataConfig();
		ArrayList myList = new ArrayList();
		SearchparentidActionBean searchparentidBean0 = new SearchparentidActionBean();
		searchparentidBean0.setSearchid("0");
		searchparentidBean0.setSearchname("û����������");
		myList.add(searchparentidBean0);
		try {
			myData.openConnection();

			ResultSet rs = myData.executeQuery("select searchid,searchname from s_q_searchtype");
			while (rs.next()) {
				SearchparentidActionBean searchparentidBean = new SearchparentidActionBean();
				searchparentidBean.setSearchid(rs.getString("searchid"));
				searchparentidBean.setSearchname(rs.getString("searchname"));
				myList.add(searchparentidBean);
				searchparentidBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}


	public boolean insertEdit(String searchparentid,String searchid,String searchname){
		
		boolean result=false;
		DataConfig myData = new DataConfig();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update s_q_searchtype set searchname='" + searchname + "',searchparentid='" + searchparentid + "' where searchid='" + searchid + "'";
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
		
	public InsertActionBean insertSelectEdit(String searchid) {
		InsertActionBean bean = new InsertActionBean();
		DataConfig myData = new DataConfig();
        try {
            myData.openConnection();
            String sql="select searchname,searchparentid from s_q_searchtype where searchid=" + searchid + ";";
            ResultSet rs = myData
                    .executeQuery(sql);
            while (rs.next()) {
				bean.setSearchname(rs.getString("searchname"));
				bean.setSearchparentid(rs.getString("searchparentid"));

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
		
				myData.addBatch("delete from  s_q_searchtype where  searchid ='"+id[i]+"'");
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
