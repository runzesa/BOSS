/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.PCbar;

import java.util.*;

import org.genius.power.IPower;

import com.genius.BOSS.PCbar.actionbean.*;;

public interface IPCbar extends IPower {
	
	public int getTotalSize();	
	public int getTotalPageCount();
	public void setTotalSize(int totalSize);
	public String getSelectSql();
	public void setSelectSql(String selectSql);
	public ArrayList select(int pageNo, String orderField, String orderType, String searchField,String searchValue, String pager,String filter);
		
		
		
	public InsertActionBean insertSelectEdit(String id);	
	public boolean insertNew(String show_position,String img_url,String resource_type,String resource_order,String resource_name,String modify_user,String dest_type,String modify_time,String is_delete,String show_type,String reource_param,String create_user,String resource_id,String crreate_time);	
	public boolean insertEdit(String show_position,String img_url,String resource_type,String resource_order,String resource_name,String modify_user,String dest_type,String modify_time,String is_delete,String show_type,String id,String reource_param,String create_user,String resource_id,String crreate_time);	
		
		
		
		
		
		
	public boolean delete(String[] id);	
		
		
	

}
