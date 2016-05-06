/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.APPbar;

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
import com.genius.BOSS.APPbar.actionbean.*;

public class APPbar implements IAPPbar {

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
			String sql ="select id,resource_id,img_url,dest_type,reource_param,resource_order,is_delete,show_type,resource_name,show_position,resource_type,crreate_time,create_user,modify_time,modify_user from tb_program_manage";

			if (filter != null) {
				Permission permission = new Permission();
				sql = permission.filterSql(sql, filter);
			}

			Map<String,String> fieldType = new HashMap<String,String>();
			{
				fieldType.put("searchNone","None");
				fieldType.put("id","string");
				fieldType.put("resource_id","string");
				fieldType.put("img_url","string");
				fieldType.put("dest_type","string");
				fieldType.put("reource_param","string");
				fieldType.put("resource_order","string");
				fieldType.put("is_delete","string");
				fieldType.put("show_type","string");
				fieldType.put("resource_name","string");
				fieldType.put("show_position","string");
				fieldType.put("resource_type","string");
				fieldType.put("crreate_time","string");
				fieldType.put("create_user","string");
				fieldType.put("modify_time","string");
				fieldType.put("modify_user","string");
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
				SelectActionBean APPbarBean=new SelectActionBean();
				
				APPbarBean.setId(rs.getString("id"));
				
				APPbarBean.setResource_id(rs.getString("resource_id"));
				
				APPbarBean.setImg_url(rs.getString("img_url"));
				
				APPbarBean.setDest_type(rs.getString("dest_type"));
				
				APPbarBean.setReource_param(rs.getString("reource_param"));
				
				APPbarBean.setResource_order(rs.getString("resource_order"));
				
				APPbarBean.setIs_delete(rs.getString("is_delete"));
				
				APPbarBean.setShow_type(rs.getString("show_type"));
				
				APPbarBean.setResource_name(rs.getString("resource_name"));
				
				APPbarBean.setShow_position(rs.getString("show_position"));
				
				APPbarBean.setResource_type(rs.getString("resource_type"));
				
				APPbarBean.setCrreate_time(rs.getString("crreate_time"));
				
				APPbarBean.setCreate_user(rs.getString("create_user"));
				
				APPbarBean.setModify_time(rs.getString("modify_time"));
				
				APPbarBean.setModify_user(rs.getString("modify_user"));
				
				myList.add(APPbarBean);
				APPbarBean=null;
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
			cellhead1.setCellValue("资源ID");
			HSSFCell cellhead2 = rowhead.createCell((short) 2);
			cellhead2.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead2.setCellValue("栏目图片");
			HSSFCell cellhead3 = rowhead.createCell((short) 3);
			cellhead3.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead3.setCellValue("跳转目标类型");
			HSSFCell cellhead4 = rowhead.createCell((short) 4);
			cellhead4.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead4.setCellValue("跳转地址");
			HSSFCell cellhead5 = rowhead.createCell((short) 5);
			cellhead5.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead5.setCellValue("显示顺序");
			HSSFCell cellhead6 = rowhead.createCell((short) 6);
			cellhead6.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead6.setCellValue("是否使用");
			HSSFCell cellhead7 = rowhead.createCell((short) 7);
			cellhead7.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead7.setCellValue("系统类型");
			HSSFCell cellhead8 = rowhead.createCell((short) 8);
			cellhead8.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead8.setCellValue("栏目名称");
			HSSFCell cellhead9 = rowhead.createCell((short) 9);
			cellhead9.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead9.setCellValue("展示位置");
			HSSFCell cellhead10 = rowhead.createCell((short) 10);
			cellhead10.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead10.setCellValue("资源类型");
			HSSFCell cellhead11 = rowhead.createCell((short) 11);
			cellhead11.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead11.setCellValue("创建时间");
			HSSFCell cellhead12 = rowhead.createCell((short) 12);
			cellhead12.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead12.setCellValue("创建人");
			HSSFCell cellhead13 = rowhead.createCell((short) 13);
			cellhead13.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead13.setCellValue("修改时间");
			HSSFCell cellhead14 = rowhead.createCell((short) 14);
			cellhead14.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead14.setCellValue("修改人");

            ResultSet rs = config.executeQuery(sql);
            int i = 1;
            while (rs.next()) {
                HSSFRow row = sheet.createRow((short) i);
							HSSFCell cell0 = row.createCell((short) 0);
				cell0.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell0.setCellValue(rs.getString("id"));
				HSSFCell cell1 = row.createCell((short) 1);
				cell1.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell1.setCellValue(rs.getString("resource_id"));
				HSSFCell cell2 = row.createCell((short) 2);
				cell2.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell2.setCellValue(rs.getString("img_url"));
				HSSFCell cell3 = row.createCell((short) 3);
				cell3.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell3.setCellValue(rs.getString("dest_type"));
				HSSFCell cell4 = row.createCell((short) 4);
				cell4.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell4.setCellValue(rs.getString("reource_param"));
				HSSFCell cell5 = row.createCell((short) 5);
				cell5.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell5.setCellValue(rs.getString("resource_order"));
				HSSFCell cell6 = row.createCell((short) 6);
				cell6.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell6.setCellValue(rs.getString("is_delete"));
				HSSFCell cell7 = row.createCell((short) 7);
				cell7.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell7.setCellValue(rs.getString("show_type"));
				HSSFCell cell8 = row.createCell((short) 8);
				cell8.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell8.setCellValue(rs.getString("resource_name"));
				HSSFCell cell9 = row.createCell((short) 9);
				cell9.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell9.setCellValue(rs.getString("show_position"));
				HSSFCell cell10 = row.createCell((short) 10);
				cell10.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell10.setCellValue(rs.getString("resource_type"));
				HSSFCell cell11 = row.createCell((short) 11);
				cell11.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell11.setCellValue(rs.getString("crreate_time"));
				HSSFCell cell12 = row.createCell((short) 12);
				cell12.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell12.setCellValue(rs.getString("create_user"));
				HSSFCell cell13 = row.createCell((short) 13);
				cell13.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell13.setCellValue(rs.getString("modify_time"));
				HSSFCell cell14 = row.createCell((short) 14);
				cell14.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell14.setCellValue(rs.getString("modify_user"));

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
            table = new Table(15);
            int width[] = { 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6};
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

			 table.addCell(new Cell(new Phrase("资源ID",font)));

			 table.addCell(new Cell(new Phrase("栏目图片",font)));

			 table.addCell(new Cell(new Phrase("跳转目标类型",font)));

			 table.addCell(new Cell(new Phrase("跳转地址",font)));

			 table.addCell(new Cell(new Phrase("显示顺序",font)));

			 table.addCell(new Cell(new Phrase("是否使用",font)));

			 table.addCell(new Cell(new Phrase("系统类型",font)));

			 table.addCell(new Cell(new Phrase("栏目名称",font)));

			 table.addCell(new Cell(new Phrase("展示位置",font)));

			 table.addCell(new Cell(new Phrase("资源类型",font)));

			 table.addCell(new Cell(new Phrase("创建时间",font)));

			 table.addCell(new Cell(new Phrase("创建人",font)));

			 table.addCell(new Cell(new Phrase("修改时间",font)));

			 table.addCell(new Cell(new Phrase("修改人",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("img_url"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("dest_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("reource_param"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_order"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("is_delete"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("show_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_name"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("show_position"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("crreate_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("create_user"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_user"), font)));
			
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
            table = new Table(15);
            int width[] = { 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6};
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

			 table.addCell(new Cell(new Phrase("资源ID",font)));

			 table.addCell(new Cell(new Phrase("栏目图片",font)));

			 table.addCell(new Cell(new Phrase("跳转目标类型",font)));

			 table.addCell(new Cell(new Phrase("跳转地址",font)));

			 table.addCell(new Cell(new Phrase("显示顺序",font)));

			 table.addCell(new Cell(new Phrase("是否使用",font)));

			 table.addCell(new Cell(new Phrase("系统类型",font)));

			 table.addCell(new Cell(new Phrase("栏目名称",font)));

			 table.addCell(new Cell(new Phrase("展示位置",font)));

			 table.addCell(new Cell(new Phrase("资源类型",font)));

			 table.addCell(new Cell(new Phrase("创建时间",font)));

			 table.addCell(new Cell(new Phrase("创建人",font)));

			 table.addCell(new Cell(new Phrase("修改时间",font)));

			 table.addCell(new Cell(new Phrase("修改人",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("img_url"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("dest_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("reource_param"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_order"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("is_delete"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("show_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_name"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("show_position"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("resource_type"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("crreate_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("create_user"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("modify_user"), font)));
			
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
			
		field = new String[]{"id","id","id","string","string"};	
		infoMap.put("id",field);
			
		field = new String[]{"resource_id","resource_id","资源ID","string","string"};	
		infoMap.put("resource_id",field);
			
		field = new String[]{"img_url","img_url","栏目图片","string","string"};	
		infoMap.put("img_url",field);
			
		field = new String[]{"dest_type","dest_type","跳转目标类型","string","string"};	
		infoMap.put("dest_type",field);
			
		field = new String[]{"reource_param","reource_param","跳转地址","string","string"};	
		infoMap.put("reource_param",field);
			
		field = new String[]{"resource_order","resource_order","显示顺序","string","string"};	
		infoMap.put("resource_order",field);
			
		field = new String[]{"is_delete","is_delete","是否使用","string","string"};	
		infoMap.put("is_delete",field);
			
		field = new String[]{"show_type","show_type","系统类型","string","string"};	
		infoMap.put("show_type",field);
			
		field = new String[]{"resource_name","resource_name","栏目名称","string","string"};	
		infoMap.put("resource_name",field);
			
		field = new String[]{"show_position","show_position","展示位置","string","string"};	
		infoMap.put("show_position",field);
			
		field = new String[]{"resource_type","resource_type","资源类型","string","string"};	
		infoMap.put("resource_type",field);
			
		field = new String[]{"crreate_time","crreate_time","创建时间","string","string"};	
		infoMap.put("crreate_time",field);
			
		field = new String[]{"create_user","create_user","创建人","string","string"};	
		infoMap.put("create_user",field);
			
		field = new String[]{"modify_time","modify_time","修改时间","string","string"};	
		infoMap.put("modify_time",field);
			
		field = new String[]{"modify_user","modify_user","修改人","string","string"};	
		infoMap.put("modify_user",field);
	
		return infoMap;
	}



	public boolean insertNew(String show_position,String img_url,String resource_type,String resource_order,String resource_name,String modify_user,String dest_type,String modify_time,String is_delete,String show_type,String reource_param,String create_user,String resource_id,String crreate_time){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into tb_program_manage (resource_id,img_url,dest_type,reource_param,resource_order,is_delete,show_type,resource_name,show_position,resource_type,crreate_time,create_user,modify_time,modify_user) values ('" + resource_id + "','" + img_url + "','" + dest_type + "','" + reource_param + "','" + resource_order + "','" + is_delete + "','" + show_type + "','" + resource_name + "','" + show_position + "','" + resource_type + "','" + crreate_time + "','" + create_user + "','" + modify_time + "','" + modify_user + "')";
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
	
	public boolean insertEdit(String show_position,String img_url,String resource_type,String resource_order,String resource_name,String modify_user,String dest_type,String modify_time,String is_delete,String show_type,String id,String reource_param,String create_user,String resource_id,String crreate_time){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update tb_program_manage set resource_id='" + resource_id + "',img_url='" + img_url + "',dest_type='" + dest_type + "',reource_param='" + reource_param + "',resource_order='" + resource_order + "',is_delete='" + is_delete + "',show_type='" + show_type + "',resource_name='" + resource_name + "',show_position='" + show_position + "',resource_type='" + resource_type + "',crreate_time='" + crreate_time + "',create_user='" + create_user + "',modify_time='" + modify_time + "',modify_user='" + modify_user + "' where id='" + id + "'";
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
            String sql="select id,resource_id,img_url,dest_type,reource_param,resource_order,is_delete,show_type,resource_name,show_position,resource_type,crreate_time,create_user,modify_time,modify_user from tb_program_manage where id='" + id + "'";
            ResultSet rs = myData
                    .executeQuery(sql);
            while (rs.next()) {
				bean.setResource_id(rs.getString("resource_id"));
				bean.setImg_url(rs.getString("img_url"));
				bean.setDest_type(rs.getString("dest_type"));
				bean.setReource_param(rs.getString("reource_param"));
				bean.setResource_order(rs.getString("resource_order"));
				bean.setIs_delete(rs.getString("is_delete"));
				bean.setShow_type(rs.getString("show_type"));
				bean.setResource_name(rs.getString("resource_name"));
				bean.setShow_position(rs.getString("show_position"));
				bean.setResource_type(rs.getString("resource_type"));
				bean.setCrreate_time(rs.getString("crreate_time"));
				bean.setCreate_user(rs.getString("create_user"));
				bean.setModify_time(rs.getString("modify_time"));
				bean.setModify_user(rs.getString("modify_user"));

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
		
				myData.addBatch("delete from  tb_program_manage where  id ='"+id[i]+"'");
		
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

