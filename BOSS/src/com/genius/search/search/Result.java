/*
 * �������� 2005-5-12
 *
 * TODO
 * ����з��� ����
 * 
 */
package com.genius.search.search;

import java.sql.ResultSet;
import java.util.ArrayList;

import org.genius.data.PageDataConfig;
import org.genius.data.DataConfig;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class Result {
	public int totalSize;
	public ArrayList list(String sql,String fieldlist,int pageNo){
		ArrayList all=new ArrayList();
		SPageDataConfig conn=new SPageDataConfig(20,pageNo);
		
		ResultSet rs;
	//	System.out.println("0 "+sql);
		int sing=0;
		try{
			sing=1;
			conn.openConnection();
			sing=2;
			rs=conn.executeQuery(sql);
			sing=3;
			while(rs.next()){
				String [] a=fieldlist.split(";");
				String [] b =new String [a.length];

				for(int i=0;i<a.length;i++){
					String str = a[i];
					String tmpStr = str.substring(0,1);
					if(!tmpStr.equals("S")){
						String [] c = str.split(" ");
						str = c[1];
					}
					b[i]=rs.getString(str);
				}
				all.add(b);
			}
			sing=4;
			totalSize = conn.getTotalSize();
			rs.close();
		}catch(Exception e){
			System.out.println("searchresult ERROR!!");
	//		System.out.println("sing="+sing);
			e.printStackTrace();
		}conn.closeConnection();
		return all;
	}
	public String sqlReplace(String sql,String replaceObj,String replaceCont){
		int tempint = sql.indexOf(replaceObj);
		if(tempint>0){
		String sql1 = sql.substring(0,tempint);
		//System.out.println(sql1);
		String sql2 = sql.substring(tempint+replaceObj.length(),sql.length());
		//System.out.println(sql2);
		sql = sql1+replaceCont+sql2;}
		return sql;
	}
	public String sqlQuary(String sql,String [] a){
		int tempint = sql.indexOf("@");
		if(tempint>0){
			for(int i=0;i<a.length;i++){
				int temps = sql.indexOf("@");
				String sql1 = sql.substring(0,temps);
				String sql2 = sql.substring(temps+"@".length(),sql.length());
				sql = sql1 + a[i] +sql2;
			}
		}
		return sql;
	}
	public String countShow(String [] sqlCountShow,String sql,int showArrayNum)
	{
//��������:ͳ����ʾ�ֶ���Ϣ���磺2��3��4����ͳ��sql��䣻�Զ����ѯ��ʾ�ֶ�����
		//String []sqlCountShow = sqlCountShows.split(",");
		if(sqlCountShow.length<1)
			return "";
		
		DataConfig conn=new DataConfig();
		ResultSet rs;
		String [] contResult =new String[sqlCountShow.length];
		
		try{
			conn.openConnection();
			sql+=" r";
			//System.out.println(sql);
			rs=conn.executeQuery(sql);
			while(rs.next()){


				for(int i=0;i<sqlCountShow.length;i++){
					
					contResult[i]=rs.getString(i+1);
				}
				
			}rs.close();
		}catch(Exception e){
			System.out.println("SearchResult.countShow is error!");
			e.printStackTrace();
		}
		if(conn!=null)
			conn.closeConnection();
		String [] a = new String[showArrayNum];
		
		a[0]="<tr bgcolor=\"#EFEFEF\"  height='25'><td align='center'><b>�ϼ�:</b></td>";
		for(int m=1;m<showArrayNum;m++){
			a[m]="<td></td>";
		}
		for(int k=0;k<sqlCountShow.length;k++){

			
			a[Integer.parseInt(sqlCountShow[k])]="<td align='center'><b>"+contResult[k]+"</b></td>";
		}
			String resultstr="";
		for(int n=0;n<a.length;n++)
		{
			resultstr+=a[n];
		}

		resultstr+="</tr>";
	//	System.out.println("resultstr:"+resultstr);
		return resultstr;
	}

}
