package com.genius.search.search;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.genius.data.DataConfig;

public class Excel
{
    public HSSFWorkbook selectExcelSelect(String searchSQL,int searchId)
    {   
    	String[] head = biaotou(searchId); 	
    	
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("sheet1");
		DataConfig config = new DataConfig();
		config.init();
        try {
            config.openConnection();
			HSSFRow rowhead = sheet.createRow((short) 0);
		    String test="";
			for(int j=0;j<=(head.length-1);j++)
		    {  
	//		   System.out.println("@@@@@@@@@@@@@@@@@"+head.length);
			   test = head[j].substring(head[j].indexOf(":")+1);
		//	   System.out.println("-------------"+test);
		       HSSFCell cellhead = rowhead.createCell((short) j);
			   cellhead.setEncoding(HSSFCell.ENCODING_UTF_16);
			   cellhead.setCellValue(test);
		    }
            ResultSet rs = config.executeQuery(searchSQL);
            int i = 1;
            
            while (rs.next()) {
                HSSFRow row = sheet.createRow((short) i);
				for(int k=1;k<=head.length;k++)
				{
	                HSSFCell cell = row.createCell((short) (k-1));
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(rs.getString(k));
		//			System.out.println("================"+rs.getString(k));
				}
                i++;
            }
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            config.closeConnection();
        }
        return workbook;
    }
    
    public String[] biaotou(int id)
    {
        DataConfig myData = new DataConfig();
        myData.init();
        String sqlShow="";
        try {
	            myData.openConnection();
	            String sql = "select sqlshow from s_q_sqlobject where id='"+id+"'";	            
	            ResultSet rs = myData.executeQuery(sql);      
	            while(rs.next())
	            {
	            sqlShow = rs.getString("sqlshow");
	            }
	            rs.close();            
     } catch (SQLException e) {
	     e.printStackTrace();
     } finally {
	     myData.closeConnection();
     }
     String[] head = sqlShow.split(";");	
     return head;
     }    
}
    	