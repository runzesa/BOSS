package com.genius.CodeSample.CodeConventions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.genius.data.DataConfig;

public class codeInClsass {
	

	/**
	 * ��ѯ������ArrayList
	 * @return myList
	 */
	public ArrayList<javaBean> select() {
		ArrayList<javaBean> myList = new ArrayList<javaBean>();
		DataConfig myData = new DataConfig();
		myData.init();
        try {
            myData.openConnection();
            String sql="select * from table";
            ResultSet rs = myData.executeQuery(sql);
            while (rs.next()) {
            	javaBean bean = new javaBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				myList.add(bean);
				bean = null;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        return myList;
    }

	/**
	 * ����ָ��������ѯ����
	 * @param id
	 * @return myList
	 */
	public ArrayList<javaBean> selectById(String id) {
		ArrayList<javaBean> myList = new ArrayList<javaBean>();
		DataConfig myData = new DataConfig();
		myData.init();
        try {
            myData.openConnection();
            String sql="select * from table where id='"+id+"'";
            ResultSet rs = myData.executeQuery(sql);
            while (rs.next()) {
            	javaBean bean = new javaBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				myList.add(bean);
				bean = null;
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myData.closeConnection();
        }
        return myList;
    }
	
	/**
	 * ��������
	 * @param id
	 * @param name
	 * @return result
	 */
	public boolean insert(String id,String name){	
		boolean result = false;
		DataConfig myData = new DataConfig();
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into table(id,name) values ('" + id + "','" + name + "')";
			myData.addBatch(sql1);	
			
			if(myData.commit()){
				result = true;
			}else{
				result = false;
			}			
			myData.endTransaction();			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}
	
	/**
	 * �༭����
	 * @param id
	 * @param name
	 * @return result
	 */
	public boolean update(String id,String name){
		boolean result = false;
		DataConfig myData = new DataConfig();
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update table set name='" + name + "' where id='" + id + "'";
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
	
	/**
	 * ��������ɾ������
	 * @param id
	 * @return result
	 */
	public boolean delete(String id){
		boolean result=false;
		DataConfig myData = new DataConfig();
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			myData.addBatch("delete from table where id ='"+id+"'");
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
	
	/**
	 * ���ݵõ�������ɾ����������
	 * @param id
	 * @return result
	 */
	public boolean delete2(String[] id){
		boolean result=false;
		DataConfig myData = new DataConfig();
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			for(int i=0;i<id.length;i++){
				myData.addBatch("delete from table where id ='"+id[i]+"'");
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
