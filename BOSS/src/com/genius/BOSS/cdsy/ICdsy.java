/*
*Generated by GeniusPlatform. 2016-05-06 10:03:56
*/
package com.genius.BOSS.cdsy;

import java.util.*;

import org.genius.power.IPower;

import com.genius.BOSS.cdsy.actionbean.*;;

public interface ICdsy extends IPower {
	
	public int getTotalSize();	
	public int getTotalPageCount();
	public void setTotalSize(int totalSize);
	public String getSelectSql();
	public void setSelectSql(String selectSql);
	public ArrayList select(int pageNo, String orderField, String orderType, String searchField,String searchValue, String pager,String filter);
		
		
		
	public InsertActionBean insertSelectEdit(String id);	
	public boolean insertNew(String source,String apply_state,String department,String create_time,String img_url,String operate_state,String user_id,String ucg,String open_state,String modify_user,String title,String audior_name,String modify_time,String attachment_id,String rank_type,String info,String academic,String content,String key_word,String cover_img,String score,String create_user,String type);public ArrayList user_idInsertSelect();public ArrayList typeInsertSelect();public ArrayList departmentInsertSelect();	
	public boolean insertEdit(String source,String apply_state,String department,String create_time,String img_url,String operate_state,String user_id,String ucg,String open_state,String modify_user,String title,String audior_name,String modify_time,String attachment_id,String rank_type,String info,String academic,String content,String key_word,String id,String cover_img,String score,String create_user,String type);	
		
		
		
		
		
		
	public boolean delete(String[] id);	
		
		
	

}