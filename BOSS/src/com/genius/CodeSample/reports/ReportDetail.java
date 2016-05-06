package com.genius.CodeSample.reports;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.io.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import org.apache.poi.hssf.usermodel.*;
import org.genius.data.*;
import org.genius.util.*;
import org.genius.power.Permission;

import org.apache.poi.hssf.usermodel.*;

import com.genius.CodeSample.reports.actionbean.ReportBean;
import com.genius.CodeSample.reports.actionbean.SelladdBean;
import com.genius.CodeSample.reports.actionbean.SelltypeBean;
import com.genius.search.tablefield.actionbean.OftableActionBean;

public class ReportDetail implements IReportDetail {
  private String sId;
  
	public String getSId() {
		return sId;
	}

	public void setSId(String sId) {
		this.sId=sId;
	}
	
	public ArrayList selectSelladd(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select id,selladd from e_r_selladd");
			while (rs.next()) {
				SelladdBean selladd = new SelladdBean();
				selladd.setId(rs.getInt("id"));
				selladd.setSelladd(rs.getString("selladd"));
				myList.add(selladd);
				selladd = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public ArrayList selectSelltype(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select id,selltype from e_r_selltype");
			while (rs.next()) {
				SelltypeBean selltype = new SelltypeBean();
				selltype.setId(rs.getInt("id"));
				selltype.setSelltype(rs.getString("selltype"));
				myList.add(selltype);
				selltype = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public ArrayList getSelladd(String stradds){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select id,selladd from e_r_selladd where id in(" + stradds + ")");
			while (rs.next()) {
				SelladdBean selladd = new SelladdBean();
				selladd.setId(rs.getInt("id"));
				selladd.setSelladd(rs.getString("selladd"));
				myList.add(selladd);
				selladd = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public ArrayList getSellType(String strType){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select id,selltype from e_r_selltype where id in(" + strType + ")");
			while (rs.next()) {
				SelltypeBean selltype = new SelltypeBean();
				selltype.setId(rs.getInt("id"));
				selltype.setSelltype(rs.getString("selltype"));
				myList.add(selltype);
				selltype = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}
	
	public ArrayList getReportItem(String fromDate, String toDate, String types, String adds){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList result = new ArrayList();
		try {
			myData.openConnection();
			ResultSet rs = myData.executeQuery("select sum(sell) sumsell,addid,typeid from " +
					"e_r_selldata where typeid in("+types+") and addid in("+adds+") " +
							"and selldate >='"+fromDate+"' and selldate <='"+toDate+"'" +
									" group by typeid,addid order by typeid,addid");		
			while (rs.next()) {
				ReportBean report = new ReportBean();
				report.setSumsell(rs.getInt("sumsell"));
				report.setAddid(rs.getInt("addid"));
				report.setTypeid(rs.getInt("typeid"));
				result.add(report);
				report = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return result;
	}
	
	
	public List report(String fromDate, String toDate, String stypes, String sadds, boolean sumToParent){

	    ArrayList items = getReportItem(fromDate,toDate,stypes,sadds);
	    int itemsnum = 0;
	    
	    ArrayList types = getSellType(stypes);
	    ArrayList adds = getSelladd(sadds);
	    Iterator type = types.iterator();
	    Iterator add = adds.iterator();
	    
	    Map addmap = new TreeMap();    
	    for(int i = 0; i<adds.size(); ++i){
	    	addmap.put(i+1, ((SelladdBean)add.next()).getId());
	    }	    
	    List result = new ArrayList();	    
	    for(int i = 0; i < types.size(); ++i){
	    	SelltypeBean selltypeBean = (SelltypeBean)type.next();
	    	
	    	int[] row = new int[adds.size()+1];
	    	row[0] = selltypeBean.getId();
	    	for(int j = 1; j <= adds.size(); ++j){
	    		ReportBean reportBean = new ReportBean();
	    		if(itemsnum < items.size()){
	    			reportBean = (ReportBean)items.get(itemsnum);	    			
	    		}else{
	    			reportBean.setAddid(0);
	    			reportBean.setTypeid(0);
	    		}   		
	    		if(reportBean.getAddid() == (Integer)addmap.get(j) && reportBean.getTypeid() ==  selltypeBean.getId()){
	    			row[j] = ((ReportBean)items.get(itemsnum)).getSumsell();
	    			++itemsnum;
	    		}else{
	    			row[j] = 0;    			
	    		}
	    	}
	    	result.add(row);    	
	    }
	    return result;
	}
}
