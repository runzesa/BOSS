/*
 * 创建日期 2005-5-12
 *
 * TODO
 * 天成研发部 杨勇
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.HistoryActionBean;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class History  {

	public boolean add(int pageNo, HistoryActionBean bean){
		
		DataConfig conn=new DataConfig();
		String sql ="";
		if(conn.databaseTypeid ==0){ //Database type 0：MicrosoftSqlServer
			sql = "insert into s_q_sqlobject (searchname,sqlcontent,sqlquary,sqlshow,savedate,sqlpower,searchtype,sqlcountshow,sqlcountcontent) values ("
				+"'"+bean.getSearchName()+"',"
				+"'"+bean.getSqlContent().replaceAll("'","''")+"',"
				+"'"+bean.getSqlQuary()+"',"
				+"'"+bean.getSqlshow()+"',"
				+"convert(datetime,'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"'),"
				+bean.getSqlPower()+","
				+bean.getSearchType()+","
				+"'"+bean.getSqlCountShow()+"',"
				+"'"+bean.getSqlCountContent().replaceAll("'","''")+"'"
	            + ")";
		}else if(conn.databaseTypeid ==1){ //Database type 1：Oracle
			sql = "insert into s_q_sqlobject (searchname,sqlcontent,sqlquary,sqlshow,savedate,sqlpower,searchtype,sqlcountshow,sqlcountcontent) values ("
				+"'"+bean.getSearchName()+"',"
				+"'"+bean.getSqlContent().replaceAll("'","''")+"',"
				+"'"+bean.getSqlQuary()+"',"
				+"'"+bean.getSqlshow()+"',"
				+"to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','yyyy-mm-dd'),"
				+bean.getSqlPower()+","
				+bean.getSearchType()+","
				+"'"+bean.getSqlCountShow()+"',"
				+"'"+bean.getSqlCountContent().replaceAll("'","''")+"'"
	            + ")";
			
		}else{}
//+"to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','yyyy-mm-dd'),"
	//	System.out.println(sql);
	   	boolean bu;
		   
	        try {

	        	conn.openConnection();
	        	conn.executeUpdate(sql);
	            bu = true;
	        } catch (Exception e) {
	            bu = false;
	        } finally {
	        	conn.closeConnection();
	        }
	        return bu;
	}
	public boolean update(String myid,int pageNo, HistoryActionBean bean){
		DataConfig conn=new DataConfig();
		String sql="";
		if(conn.databaseTypeid ==0){ //Database type 0：MicrosoftSqlServer
			sql = "update s_q_sqlobject set "
		       	+"searchname="+"'"+bean.getSearchName()+"',"
					+"sqlcontent="+"'"+bean.getSqlContent().replaceAll("'","''")+"',"
					+"sqlshow="+"'"+bean.getSqlshow().replaceAll("'","''")+"',"
					+"sqlQuary="+"'"+bean.getSqlQuary()+"',"
					+"savedate="+"convert(datetime,'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"'),"
					+"sqlpower="+bean.getSqlPower()+","
					+"searchtype="+bean.getSearchType()+","
					+"sqlcountshow='"+bean.getSqlCountShow()+"',"
					+"sqlcountcontent='"+bean.getSqlCountContent().replaceAll("'","''")+"'"
		       	+" where id="+myid;
		}else if(conn.databaseTypeid ==1){ //Database type 1：Oracle
			sql = "update s_q_sqlobject set "
		       	+"searchname="+"'"+bean.getSearchName()+"',"
					+"sqlcontent="+"'"+bean.getSqlContent().replaceAll("'","''")+"',"
					+"sqlshow="+"'"+bean.getSqlshow().replaceAll("'","''")+"',"
					+"sqlQuary="+"'"+bean.getSqlQuary()+"',"
					+"savedate="+"to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','yyyy-mm-dd'),"
					+"sqlpower="+bean.getSqlPower()+","
					+"searchtype="+bean.getSearchType()+","
					+"sqlcountshow='"+bean.getSqlCountShow()+"',"
					+"sqlcountcontent='"+bean.getSqlCountContent().replaceAll("'","''")+"'"
		       	+" where id="+myid;
			
		}else{}
   //     System.out.println(sql);
	   	boolean bu;
	//+"savedate="+"to_date('"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','yyyy-mm-dd'),"
	        try {
	        	conn.openConnection();
	        	conn.executeUpdate(sql);
	            bu = true;
	        } catch (Exception e) {
	            bu = false;
	        } finally {
	        	conn.closeConnection();
	        }
	        return bu;
	}
	public ArrayList list(){
		ArrayList all=new ArrayList();
		DataConfig conn=new DataConfig();
		ResultSet rs;
		String sql = "select a.id,a.searchname,a.sqlcontent,a.sqlshow,a.savedate,a.sqlpower,a.sqlquary,a.searchtype,b.searchname as searchtypename from s_q_sqlobject a LEFT OUTER JOIN s_q_searchtype b on a.searchtype=b.searchid order by id";
		//page.count(sql);//计算总页数
       // Query q=new Query(sql);
       // q.setMaxResults(page.getMaxPage());
       // q.setFirstPage(page.getCurrentPage());
       // sql=q.getQuerySql();
		try{
        	conn.openConnection();
			rs=conn.executeQuery(sql);
			while(rs.next()){
				HistoryActionBean sh=new HistoryActionBean();
				sh.setSearchName(rs.getString("searchname"));
				sh.setSqlContent(rs.getString("sqlcontent"));
				sh.setSqlshow(rs.getString("sqlshow"));
				sh.setShowdate(rs.getString("savedate"));		
				sh.setSqlPower(rs.getString("sqlpower"));
				sh.setSqlQuary(rs.getString("sqlquary"));
				sh.setSearchType(rs.getString("searchtype"));
				sh.setSearchTypeName(rs.getString("searchtypename"));
				sh.setId(rs.getString("id"));
				all.add(sh);
				
			}rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}conn.closeConnection();
		return all;
	}
	public ArrayList list(String power){
		ArrayList all=new ArrayList();
		DataConfig myData=new DataConfig();
		ResultSet rs;
		String sql = "select a.id,a.searchname,a.sqlcontent,a.sqlshow,a.savedate,a.sqlpower,a.sqlquary,a.searchtype,b.searchname as searchtypename from s_q_sqlobject a LEFT OUTER JOIN s_q_searchtype b on a.searchtype=b.searchid" +
				" and a.sqlpower="+power+" order by id";
//		System.out.println(sql);
		//page.count(sql);//计算总页数
       // Query q=new Query(sql);
       // q.setMaxResults(page.getMaxPage());
       // q.setFirstPage(page.getCurrentPage());
       // sql=q.getQuerySql();
		try{
        	myData.openConnection();
			rs=myData.getConnection().createStatement().executeQuery(sql);
			while(rs.next()){
				HistoryActionBean sh=new HistoryActionBean();
				sh.setSearchName(rs.getString("searchname"));
				sh.setSqlContent(rs.getString("sqlcontent"));
				sh.setSqlshow(rs.getString("sqlshow"));
				sh.setShowdate(rs.getString("savedate"));		
				sh.setSqlPower(rs.getString("sqlpower"));
				sh.setSqlQuary(rs.getString("sqlquary"));
				sh.setSearchType(rs.getString("searchtype"));
				sh.setSearchTypeName(rs.getString("searchtypename"));
				sh.setId(rs.getString("id"));
				all.add(sh);
				
			}rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}myData.closeConnection();
		return all;
	}
	public HistoryActionBean getObjById(String id){
		HistoryActionBean sh = new HistoryActionBean();
		DataConfig conn=new DataConfig();
		ResultSet rs;
		String sql = "select * from s_q_sqlobject where id="+id;
	//	System.out.println(sql);
		try{
        	conn.openConnection();
			rs=conn.executeQuery(sql);
			while(rs.next()){
				sh.setSearchName(rs.getString("searchname"));
				sh.setSqlContent(rs.getString("sqlcontent"));
				sh.setSqlshow(rs.getString("sqlshow"));
				sh.setSqlPower(rs.getString("sqlpower"));
				sh.setShowdate(rs.getString("savedate"));
				sh.setSqlQuary(rs.getString("sqlquary"));
				sh.setSearchType(rs.getString("searchtype"));
				sh.setSqlCountContent(rs.getString("sqlcountcontent"));
				sh.setSqlCountShow(rs.getString("sqlcountshow"));
			}rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}conn.closeConnection();
		return sh;
	}
	public boolean del(String sid) {
		boolean isadd=false;
		DataConfig conn=new DataConfig();
        String sql="delete from s_q_sqlobject where id="+sid;
 //       System.out.println(sql);
        try {

        	conn.openConnection();
         	conn.executeUpdate(sql);
            isadd=true;
        } catch (Exception e) {
        	e.printStackTrace();
            isadd=false;
        } finally {
            conn.closeConnection();
        }
        return isadd;
	}
	public boolean delAllType(String typeid){
		boolean isadd=false;
		DataConfig conn=new DataConfig();
        String sql="delete from s_q_sqlobject where s_q_searchtype="+typeid;
        
        try {

        	conn.openConnection();
         	conn.executeUpdate(sql);
            isadd=true;
        } catch (Exception e) {
        	e.printStackTrace();
            isadd=false;
        } finally {
            conn.closeConnection();
        }
        return isadd;
	}

}
