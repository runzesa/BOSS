/*
 * 创建日期 2005-7-20
 *
 * TODO
 * 天成研发部 
 * 
 */
package com.genius.search.search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

//import org.apache.struts.action.ActionForm;

import org.genius.data.DataConfig;

import com.genius.search.search.actionbean.TypeFromActionBean;


/**
 * @author yangy
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TypeForm {
    public boolean isExist(String _xmid) {
        boolean bolRet = false;
        DataConfig conn=new DataConfig();
        ResultSet rs = null;
        String sql = "select * from s_q_searchtype where searchId='" + _xmid + "'";
        try {
        	conn.openConnection();
            rs = conn.executeQuery(sql);
            if (rs.next()) {
                bolRet = true;
            }
            rs.close();
        } catch (Exception e) {
            System.out.println("com.genius.mobile.search"
                    + " SearchTypeForm.isExist is error");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.closeConnection();
            }
        }
        return bolRet;
    }
    public String getNameById(String _typeid){
    String bolRet = "";
    DataConfig conn=new DataConfig();

    ResultSet rs = null;
    String sql = "select * from s_q_searchtype where searchId='" + _typeid + "'";
    try {
    	conn.openConnection();
        rs = conn.executeQuery(sql);
        if (rs.next()) {
            bolRet = rs.getString("searchname");
        }
        rs.close();
    } catch (Exception e) {
        System.out.println("com.genius.mobile.form"
                + " SearchTypeForm.isExist is error");
        e.printStackTrace();
    } finally {
        if (conn != null) {
            conn.closeConnection();
        }
    }
    return bolRet;
}
    public boolean edit(String searchid,String searchname,String parentid)
    {
		boolean bu;
        DataConfig conn=new DataConfig();

		String sql="update s_q_searchtype set searchname='"+searchname+"',searchparentid="+parentid+" where searchid="+searchid;
//		System.out.println(sql);
		try{
			conn.openConnection();
			conn.executeUpdate(sql);
			bu=true;
			conn.closeConnection();
			
		}
		catch(Exception e){
            System.out.println("com.genius.tcxmgl.search"
                    + " SearchTypeForm.edit is error");
            e.printStackTrace();
			bu=false;
		
		}
		finally{
            if (conn != null) {
                conn.closeConnection();
            }
			
		}
		return bu;
    }

	public boolean add(String searchname,String parentId){
		
	   	boolean bu=false;
		   

        DataConfig conn=new DataConfig();

//        String sql = "insert into searchtype (searchname,searchorderid,searchparentid"
//        		+ ") values ('" + searchname
//        		+ "',(select max(searchorderid)+1 from searchtype)"
//        		+ ","+parentId+  ")";
        String sql = "insert into s_q_searchtype (searchname,searchorderid,searchparentid"
    		+ ") values ('" + searchname
    		+ "',NULL,"+parentId+  ")";
        try {
            conn.openConnection();
            conn.executeUpdate(sql);

            conn.closeConnection();
            bu =true;
            
        } catch (Exception e) {
        	if (conn!=null)
            conn.closeConnection();
            bu= false;
        } finally {
        }
	        return bu;
	}
    public ArrayList list() {
        ArrayList pros = new ArrayList();
        DataConfig myData = new DataConfig();
        String sql = "select a.*,b.searchname parentshowname from s_q_searchtype a LEFT OUTER JOIN s_q_searchtype b on a.searchparentid = b.searchid order by a.searchid";
        try {
        	myData.openConnection();
        	Connection conn = myData.getConnection();
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
               //System.out.println(rs.getString("xmid"));
            	TypeFromActionBean stf = new TypeFromActionBean();
                stf.setSearchId(rs.getString("searchid"));
                stf.setSearchName(rs.getString("searchname"));
                stf.setSelectStatus("");
                stf.setSearchOrderId(rs.getString("searchorderid"));
                stf.setSearchParentId(rs.getString("searchparentid"));
                stf.setSearchParentName(rs.getString("parentshowname"));
                
                pros.add(stf);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        return pros;
    }
    public ArrayList list(String searchtype) {
        ArrayList pros = new ArrayList();
        DataConfig myData = new DataConfig();
        String sql = "select a.*,b.searchname parentshowname from s_q_searchtype a LEFT OUTER JOIN s_q_searchtype b on a.searchparentid = b.searchid order by a.searchid desc";
        try {
        	myData.openConnection();
        	Connection conn = myData.getConnection();
        	
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
                //System.out.println(rs.getString("xmid"));
            	TypeFromActionBean stf = new TypeFromActionBean();

                stf.setSearchId(rs.getString("searchid"));
                stf.setSearchName(rs.getString("searchname"));
                stf.setSearchOrderId(rs.getString("searchorderid"));
                stf.setSearchParentId(rs.getString("searchparentid"));
                stf.setSearchParentName(rs.getString("parentshowname"));
                String selects="";
                if(rs.getString("searchid").equals(searchtype))
                	selects="selected";
                stf.setSelectStatus(selects);
                pros.add(stf);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        return pros;
    }
	public boolean del(String sid) {
		boolean isadd=false;
        DataConfig conn=new DataConfig();

        String sql="delete from s_q_searchtype where searchid="+sid;
        //System.out.println(sql);
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
