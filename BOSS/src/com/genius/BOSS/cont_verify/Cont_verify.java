/*
*Generated by GeniusPlatform. 2016-04-11 15:57:15
*/
package com.genius.BOSS.cont_verify;

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
import com.genius.BOSS.cont_verify.actionbean.*;

public class Cont_verify implements ICont_verify {

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
			String sql ="select id,name,id_card_no,phone_no,account,role,sex,point,credit,register_time,email,birthday,is_identify,status,area from b_user";

			if (filter != null) {
				Permission permission = new Permission();
				sql = permission.filterSql(sql, filter);
			}

			Map<String,String> fieldType = new HashMap<String,String>();
			{
				fieldType.put("searchNone","None");
				fieldType.put("id","string");
				fieldType.put("name","string");
				fieldType.put("id_card_no","string");
				fieldType.put("phone_no","string");
				fieldType.put("account","string");
				fieldType.put("role","string");
				fieldType.put("sex","string");
				fieldType.put("point","string");
				fieldType.put("credit","string");
				fieldType.put("register_time","string");
				fieldType.put("email","string");
				fieldType.put("birthday","string");
				fieldType.put("is_identify","string");
				fieldType.put("status","string");
				fieldType.put("area","string");
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
				orderField="register_time";
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
				SelectActionBean cont_verifyBean=new SelectActionBean();
				
				cont_verifyBean.setId(rs.getString("id"));
				
				cont_verifyBean.setName(rs.getString("name"));
				
				cont_verifyBean.setId_card_no(rs.getString("id_card_no"));
				
				cont_verifyBean.setPhone_no(rs.getString("phone_no"));
				
				cont_verifyBean.setAccount(rs.getString("account"));
				
				cont_verifyBean.setRole(rs.getString("role"));
				
				cont_verifyBean.setSex(rs.getString("sex"));
				
				cont_verifyBean.setPoint(rs.getString("point"));
				
				cont_verifyBean.setCredit(rs.getString("credit"));
				
				cont_verifyBean.setRegister_time(rs.getString("register_time"));
				
				cont_verifyBean.setEmail(rs.getString("email"));
				
				cont_verifyBean.setBirthday(rs.getString("birthday"));
				
				cont_verifyBean.setIs_identify(rs.getString("is_identify"));
				
				cont_verifyBean.setStatus(rs.getString("status"));
				
				cont_verifyBean.setArea(rs.getString("area"));
				
				myList.add(cont_verifyBean);
				cont_verifyBean=null;
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
			cellhead1.setCellValue("用户名");
			HSSFCell cellhead2 = rowhead.createCell((short) 2);
			cellhead2.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead2.setCellValue("身份证号");
			HSSFCell cellhead3 = rowhead.createCell((short) 3);
			cellhead3.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead3.setCellValue("电话");
			HSSFCell cellhead4 = rowhead.createCell((short) 4);
			cellhead4.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead4.setCellValue("账号");
			HSSFCell cellhead5 = rowhead.createCell((short) 5);
			cellhead5.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead5.setCellValue("角色");
			HSSFCell cellhead6 = rowhead.createCell((short) 6);
			cellhead6.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead6.setCellValue("性别");
			HSSFCell cellhead7 = rowhead.createCell((short) 7);
			cellhead7.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead7.setCellValue("积分");
			HSSFCell cellhead8 = rowhead.createCell((short) 8);
			cellhead8.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead8.setCellValue("学分");
			HSSFCell cellhead9 = rowhead.createCell((short) 9);
			cellhead9.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead9.setCellValue("注册时间");
			HSSFCell cellhead10 = rowhead.createCell((short) 10);
			cellhead10.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead10.setCellValue("email");
			HSSFCell cellhead11 = rowhead.createCell((short) 11);
			cellhead11.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead11.setCellValue("生日");
			HSSFCell cellhead12 = rowhead.createCell((short) 12);
			cellhead12.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead12.setCellValue("认证情况");
			HSSFCell cellhead13 = rowhead.createCell((short) 13);
			cellhead13.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead13.setCellValue("状态");
			HSSFCell cellhead14 = rowhead.createCell((short) 14);
			cellhead14.setEncoding(HSSFCell.ENCODING_UTF_16);
			cellhead14.setCellValue("地区");

            ResultSet rs = config.executeQuery(sql);
            int i = 1;
            while (rs.next()) {
                HSSFRow row = sheet.createRow((short) i);
							HSSFCell cell0 = row.createCell((short) 0);
				cell0.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell0.setCellValue(rs.getString("id"));
				HSSFCell cell1 = row.createCell((short) 1);
				cell1.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell1.setCellValue(rs.getString("name"));
				HSSFCell cell2 = row.createCell((short) 2);
				cell2.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell2.setCellValue(rs.getString("id_card_no"));
				HSSFCell cell3 = row.createCell((short) 3);
				cell3.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell3.setCellValue(rs.getString("phone_no"));
				HSSFCell cell4 = row.createCell((short) 4);
				cell4.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell4.setCellValue(rs.getString("account"));
				HSSFCell cell5 = row.createCell((short) 5);
				cell5.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell5.setCellValue(rs.getString("role"));
				HSSFCell cell6 = row.createCell((short) 6);
				cell6.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell6.setCellValue(rs.getString("sex"));
				HSSFCell cell7 = row.createCell((short) 7);
				cell7.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell7.setCellValue(rs.getString("point"));
				HSSFCell cell8 = row.createCell((short) 8);
				cell8.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell8.setCellValue(rs.getString("credit"));
				HSSFCell cell9 = row.createCell((short) 9);
				cell9.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell9.setCellValue(rs.getString("register_time"));
				HSSFCell cell10 = row.createCell((short) 10);
				cell10.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell10.setCellValue(rs.getString("email"));
				HSSFCell cell11 = row.createCell((short) 11);
				cell11.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell11.setCellValue(rs.getString("birthday"));
				HSSFCell cell12 = row.createCell((short) 12);
				cell12.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell12.setCellValue(rs.getString("is_identify"));
				HSSFCell cell13 = row.createCell((short) 13);
				cell13.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell13.setCellValue(rs.getString("status"));
				HSSFCell cell14 = row.createCell((short) 14);
				cell14.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell14.setCellValue(rs.getString("area"));

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

			 table.addCell(new Cell(new Phrase("用户名",font)));

			 table.addCell(new Cell(new Phrase("身份证号",font)));

			 table.addCell(new Cell(new Phrase("电话",font)));

			 table.addCell(new Cell(new Phrase("账号",font)));

			 table.addCell(new Cell(new Phrase("角色",font)));

			 table.addCell(new Cell(new Phrase("性别",font)));

			 table.addCell(new Cell(new Phrase("积分",font)));

			 table.addCell(new Cell(new Phrase("学分",font)));

			 table.addCell(new Cell(new Phrase("注册时间",font)));

			 table.addCell(new Cell(new Phrase("email",font)));

			 table.addCell(new Cell(new Phrase("生日",font)));

			 table.addCell(new Cell(new Phrase("认证情况",font)));

			 table.addCell(new Cell(new Phrase("状态",font)));

			 table.addCell(new Cell(new Phrase("地区",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("name"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("id_card_no"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("phone_no"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("account"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("role"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("sex"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("point"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("credit"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("register_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("email"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("birthday"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("is_identify"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("status"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("area"), font)));
			
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

			 table.addCell(new Cell(new Phrase("用户名",font)));

			 table.addCell(new Cell(new Phrase("身份证号",font)));

			 table.addCell(new Cell(new Phrase("电话",font)));

			 table.addCell(new Cell(new Phrase("账号",font)));

			 table.addCell(new Cell(new Phrase("角色",font)));

			 table.addCell(new Cell(new Phrase("性别",font)));

			 table.addCell(new Cell(new Phrase("积分",font)));

			 table.addCell(new Cell(new Phrase("学分",font)));

			 table.addCell(new Cell(new Phrase("注册时间",font)));

			 table.addCell(new Cell(new Phrase("email",font)));

			 table.addCell(new Cell(new Phrase("生日",font)));

			 table.addCell(new Cell(new Phrase("认证情况",font)));

			 table.addCell(new Cell(new Phrase("状态",font)));

			 table.addCell(new Cell(new Phrase("地区",font)));

            while (rs.next()) {
    		
                table.addCell(new Cell(new Phrase(rs.getString("id"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("name"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("id_card_no"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("phone_no"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("account"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("role"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("sex"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("point"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("credit"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("register_time"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("email"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("birthday"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("is_identify"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("status"), font)));
			
                table.addCell(new Cell(new Phrase(rs.getString("area"), font)));
			
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
			
		field = new String[]{"name","name","用户名","link","string"};	
		infoMap.put("name",field);
			
		field = new String[]{"id_card_no","id_card_no","身份证号","string","string"};	
		infoMap.put("id_card_no",field);
			
		field = new String[]{"phone_no","phone_no","电话","string","string"};	
		infoMap.put("phone_no",field);
			
		field = new String[]{"account","account","账号","string","string"};	
		infoMap.put("account",field);
			
		field = new String[]{"role","role","角色","string","string"};	
		infoMap.put("role",field);
			
		field = new String[]{"sex","sex","性别","string","string"};	
		infoMap.put("sex",field);
			
		field = new String[]{"point","point","积分","string","string"};	
		infoMap.put("point",field);
			
		field = new String[]{"credit","credit","学分","string","string"};	
		infoMap.put("credit",field);
			
		field = new String[]{"register_time","register_time","注册时间","string","string"};	
		infoMap.put("register_time",field);
			
		field = new String[]{"email","email","email","string","string"};	
		infoMap.put("email",field);
			
		field = new String[]{"birthday","birthday","生日","string","string"};	
		infoMap.put("birthday",field);
			
		field = new String[]{"is_identify","is_identify","认证情况","string","string"};	
		infoMap.put("is_identify",field);
			
		field = new String[]{"status","status","状态","string","string"};	
		infoMap.put("status",field);
			
		field = new String[]{"area","area","地区","string","string"};	
		infoMap.put("area",field);
	
		return infoMap;
	}



	public boolean insertNew(String credit,String birthday,String area,String point,String name,String phone_no,String id_card_no,String role,String status,String account,String idcard_img,String sex,String email,String is_identify,String cert_img,String head_img,String register_time){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="insert into b_user (account,name,email,phone_no,head_img,sex,idcard_img,id_card_no,birthday,role,register_time,is_identify,status,point,credit,cert_img,area) values ('" + account + "','" + name + "','" + email + "','" + phone_no + "','" + head_img + "','" + sex + "','" + idcard_img + "','" + id_card_no + "','" + birthday + "','" + role + "','" + register_time + "','" + is_identify + "','" + status + "','" + point + "','" + credit + "','" + cert_img + "','" + area + "')";
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
	
	public ArrayList areaInsertSelect() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		ArrayList myList = new ArrayList();
		try {
			myData.openConnection();

			ResultSet rs = myData.executeQuery("select area_id,name from b_area where level_type = '2'");
			while (rs.next()) {
				AreaActionBean areaBean = new AreaActionBean();
				areaBean.setArea_id(rs.getString("area_id"));
				areaBean.setName(rs.getString("name"));
				myList.add(areaBean);
				areaBean = null;
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			myData.closeConnection();
		}
		return myList;
	}


	public boolean insertEdit(String credit,String birthday,String area,String point,String name,String phone_no,String id_card_no,String role,String status,String account,String idcard_img,String sex,String email,String is_identify,String cert_img,String head_img,String register_time,String id){
		
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			String sql1 ="update b_user set account='" + account + "',name='" + name + "',email='" + email + "',phone_no='" + phone_no + "',head_img='" + head_img + "',sex='" + sex + "',idcard_img='" + idcard_img + "',id_card_no='" + id_card_no + "',birthday='" + birthday + "',role='" + role + "',register_time='" + register_time + "',is_identify='" + is_identify + "',status='" + status + "',point='" + point + "',credit='" + credit + "',cert_img='" + cert_img + "',area='" + area + "' where id='" + id + "'";
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
            String sql="select id,account,name,email,phone_no,head_img,sex,idcard_img,id_card_no,birthday,role,register_time,is_identify,status,point,credit,cert_img,area from b_user where id='" + id + "'";
            ResultSet rs = myData
                    .executeQuery(sql);
            while (rs.next()) {
				bean.setAccount(rs.getString("account"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone_no(rs.getString("phone_no"));
				bean.setHead_img(rs.getString("head_img"));
				bean.setSex(rs.getString("sex"));
				bean.setIdcard_img(rs.getString("idcard_img"));
				bean.setId_card_no(rs.getString("id_card_no"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setRole(rs.getString("role"));
				bean.setRegister_time(rs.getString("register_time"));
				bean.setIs_identify(rs.getString("is_identify"));
				bean.setStatus(rs.getString("status"));
				bean.setPoint(rs.getString("point"));
				bean.setCredit(rs.getString("credit"));
				bean.setCert_img(rs.getString("cert_img"));
				bean.setArea(rs.getString("area"));

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
		
				myData.addBatch("delete from  b_user where  id ='"+id[i]+"'");
		
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

