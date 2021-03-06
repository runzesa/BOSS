/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.medical_j;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import org.apache.poi.hssf.usermodel.*;
import org.genius.data.*;
import org.genius.util.*;
import org.genius.power.Permission;

import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;
import com.genius.BOSS.medical_j.actionbean.*;

public class Medical_j implements IMedical_j {

	public int totalSize;
	
	public int totalPageCount;

	public String selectSql;
	
	private String selectSumSql;
	
	private String sId;
	
	private final int pagerMaxSize = 200;
	
	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	
	public int getTotalPageCount(){
		return totalPageCount;
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
	
	
	public ArrayList select(int pageNo, String orderField, String orderType, String searchField,String searchValue,String pager, String filter){
		boolean asc;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IPageDataConfig myData = (IPageDataConfig) context
				.getBean("pageDataConfigProxy");
		if(pager == null || pager.equals("on")){
			myData.init(50, pageNo);
		}else{
			myData.init(pagerMaxSize,pageNo);
		}
		ArrayList<SelectActionBean> myList=new ArrayList<SelectActionBean>();
		try {
			myData.openConnection();
			String sql ="select id,case_id,user_id,content,create_time,modify_time from t_case_diary";

			if (filter != null) {
				Permission permission = new Permission();
				sql = permission.filterSql(sql, filter);
			}

			Map<String,String> fieldType = new HashMap<String,String>();
			{
				fieldType.put("searchNone","None");
				fieldType.put("id","string");
				fieldType.put("case_id","string");
				fieldType.put("user_id","string");
				fieldType.put("content","string");
				fieldType.put("create_time","longdate");
				fieldType.put("modify_time","string");
			}

			
			if (searchField!=null && searchField.equals("ADSsearchADS")) {
				sql = "select * from(" + sql + ") my_table where " + searchValue ;
			}else if (searchField != null && searchValue != null && !searchField.equals("null") && !searchValue.equals("null")) {
				if(fieldType.get(searchField)!="shortdate" && fieldType.get(searchField)!="longdate")
					sql = "select * from(" + sql + ") my_table where " + searchField + " like '%" + searchValue + "%'";
				else
					sql = "select * from(" + sql + ") my_table where convert(varchar(19)," + searchField + ",120) like '%" + searchValue + "%'";
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
				SelectActionBean medical_jBean=new SelectActionBean();
				
				medical_jBean.setId(rs.getString("id"));
				
				medical_jBean.setCase_id(rs.getString("case_id"));
				
				medical_jBean.setUser_id(rs.getString("user_id"));
				
				medical_jBean.setContent(rs.getString("content"));
				
				medical_jBean.setCreate_time(DateFormat.getLongDate(rs.getString("create_time")));
				
				medical_jBean.setModify_time(rs.getString("modify_time"));
				
				myList.add(medical_jBean);
				medical_jBean=null;
			}
			totalSize = myData.getTotalSize();
			totalPageCount = myData.getTotalPageCount();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		 }finally{
			myData.closeConnection();
		}
		return myList;
	}
	
	
	public HSSFWorkbook selectExcelSelect() {
        HSSFWorkbook workbook = new HSSFWorkbook();

        HSSFSheet sheet = workbook.createSheet("sheet1");

        ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig config = (IDataConfig) context.getBean("dataConfigProxy");
		config.init();
        try {
            config.openConnection();
            String sql = this.selectSql;
			HSSFRow rowhead = sheet.createRow((short) 0);
						HSSFCell cellhead0 = rowhead.createCell((short) 0);
			cellhead0.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead0.setCellValue("id");
			HSSFCell cellhead1 = rowhead.createCell((short) 1);
			cellhead1.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead1.setCellValue("case_id");
			HSSFCell cellhead2 = rowhead.createCell((short) 2);
			cellhead2.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead2.setCellValue("user_id");
			HSSFCell cellhead3 = rowhead.createCell((short) 3);
			cellhead3.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead3.setCellValue("内容");
			HSSFCell cellhead4 = rowhead.createCell((short) 4);
			cellhead4.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead4.setCellValue("创建时间");
			HSSFCell cellhead5 = rowhead.createCell((short) 5);
			cellhead5.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead5.setCellValue("修改时间");

            ResultSet rs = config.executeQuery(sql);
            int i = 1;
            while (rs.next()) {
                HSSFRow row = sheet.createRow((short) i);
							HSSFCell cell0 = row.createCell((short) 0);
				cell0.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell0.setCellValue(rs.getString("id"));
				HSSFCell cell1 = row.createCell((short) 1);
				cell1.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell1.setCellValue(rs.getString("case_id"));
				HSSFCell cell2 = row.createCell((short) 2);
				cell2.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell2.setCellValue(rs.getString("user_id"));
				HSSFCell cell3 = row.createCell((short) 3);
				cell3.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell3.setCellValue(rs.getString("content"));
				HSSFCell cell4 = row.createCell((short) 4);
				cell4.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell4.setCellValue(rs.getString("create_time"));
				HSSFCell cell5 = row.createCell((short) 5);
				cell5.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell5.setCellValue(rs.getString("modify_time"));

                i++;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            config.closeConnection();
        }
        return workbook;
    }
    	
	public Table selectPdfSelect() {
        Table table = null;
        ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig config = (IDataConfig) context.getBean("dataConfigProxy");
		config.init();

        try {
            table = new Table(6);
            int width[] = { 16,16,16,16,16,16};
            table.setWidths(width);
            table.setWidth(80); 

            //table.setDefaultHorizontalAlignment(Element.ALIGN_LEFT);
            //table.setDefaultVerticalAlignment(Element.ALIGN_MIDDLE);
            table.setAutoFillEmptyCells(true);
            table.setPadding(1);
            table.setSpacing(0);
            //aTable.setDefaultCellBorder(0);
            table.setBorder(0);
            BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",
                    false);
            Font font = new Font(bf, 12);

            config.openConnection();
            String sql = this.selectSql;
            ResultSet rs = config.executeQuery(sql);
            int i = 0;
            
			 table.addCell(new Cell(new Phrase("id",font)));

			 table.addCell(new Cell(new Phrase("case_id",font)));

			 table.addCell(new Cell(new Phrase("user_id",font)));

			 table.addCell(new Cell(new Phrase("内容",font)));

			 table.addCell(new Cell(new Phrase("创建时间",font)));

			 table.addCell(new Cell(new Phrase("修改时间",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("case_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("user_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("content"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("create_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_time"), font)));
			
                i++;
            }
        } catch (BadElementException e) {

            e.printStackTrace();
        } catch (DocumentException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            config.closeConnection();
        }

        return table;
    }
    
    	
	public Table selectWordSelect() {
        Table table = null;
        ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig config = (IDataConfig) context.getBean("dataConfigProxy");
		config.init();

        try {
            table = new Table(6);
            int width[] = { 16,16,16,16,16,16};
            table.setWidths(width);
            table.setWidth(80); 

            //table.setDefaultHorizontalAlignment(Element.ALIGN_LEFT);
            //table.setDefaultVerticalAlignment(Element.ALIGN_MIDDLE);
            table.setAutoFillEmptyCells(true);
            table.setPadding(1);
            table.setSpacing(0);
            //aTable.setDefaultCellBorder(0);
            table.setBorder(0);
            BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",
                    false);
            Font font = new Font(bf, 12);

            config.openConnection();
            String sql = this.selectSql;
            ResultSet rs = config.executeQuery(sql);
            int i = 0;
            
			 table.addCell(new Cell(new Phrase("id",font)));

			 table.addCell(new Cell(new Phrase("case_id",font)));

			 table.addCell(new Cell(new Phrase("user_id",font)));

			 table.addCell(new Cell(new Phrase("内容",font)));

			 table.addCell(new Cell(new Phrase("创建时间",font)));

			 table.addCell(new Cell(new Phrase("修改时间",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("case_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("user_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("content"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("create_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_time"), font)));
			
                i++;
            }
        } catch (BadElementException e) {

            e.printStackTrace();
        } catch (DocumentException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            config.closeConnection();
        }

        return table;
    }
    
    
	public Map<String,String[]> getIndexModelInfo(){
		Map<String,String[]> infoMap = new HashMap<String,String[]>();
		String[] field;
			
		field = new String[]{"id","id","id","checkbox","string"};	
		infoMap.put("id",field);
			
		field = new String[]{"case_id","case_id","case_id","string","string"};	
		infoMap.put("case_id",field);
			
		field = new String[]{"user_id","user_id","user_id","string","string"};	
		infoMap.put("user_id",field);
			
		field = new String[]{"content","content","内容","string","string"};	
		infoMap.put("content",field);
			
		field = new String[]{"create_time","create_time","创建时间","string","longdate"};	
		infoMap.put("create_time",field);
			
		field = new String[]{"modify_time","modify_time","修改时间","string","string"};	
		infoMap.put("modify_time",field);
	
		return infoMap;
	}



	public boolean insertNew(String create_time,String modify_time,String case_id,String content,String user_id){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into t_case_diary (case_id,user_id,content,create_time,modify_time) values ('" + case_id + "','" + user_id + "','" + content + "','" + create_time + "','" + modify_time + "')";
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
	
	public boolean insertEdit(String create_time,String modify_time,String case_id,String content,String id,String user_id){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update t_case_diary set case_id='" + case_id + "',user_id='" + user_id + "',content='" + content + "',create_time='" + create_time + "',modify_time='" + modify_time + "' where id='" + id + "'";
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
        ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
        try {
            myData.openConnection();
            String sql="select id,case_id,user_id,content,create_time,modify_time from t_case_diary where id='" + id + "'";
            ResultSet rs = myData
                    .executeQuery(sql);
            while (rs.next()) {
				bean.setCase_id(rs.getString("case_id"));
				bean.setUser_id(rs.getString("user_id"));
				bean.setContent(rs.getString("content"));
				bean.setCreate_time(rs.getString("create_time"));
				bean.setModify_time(rs.getString("modify_time"));

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
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			for(int i=0;i<id.length;i++){
		
				myData.addBatch("delete from  t_case_diary where  id ='"+id[i]+"'");
		
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

