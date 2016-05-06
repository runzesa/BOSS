package com.genius.personalsettings;

import java.util.ArrayList;
import java.util.List;

import org.genius.power.IPower;

import com.genius.personalsettings.actionbean.LeftBean;
import com.genius.personalsettings.actionbean.LeftCustomBean;
import com.genius.personalsettings.actionbean.UserinfoBean;

public interface IPersonalSettings  extends IPower {
	public boolean savepwd(String pwd_bak, String pwd_new1, String pwd_new2);
	public UserinfoBean getUserinfoBean();
	public boolean updateUserinfo(String name, String address, String phone, String mobile, String email);
//	public ArrayList getLeftCustoms();
	public boolean updateLeftCustoms(ArrayList<LeftCustomBean> leftCustoms);
//	private boolean deleteLeftCustom(String urlId);
//	public List getLeftChild(String rootid);
//	public List getLeftRoot();
//	public LeftBean getLeftParent(String childId);
	
	public ArrayList<LeftCustomBean> getLeftCustoms();
	public List<LeftCustomBean> getTitleRoots();
	public List<LeftCustomBean> getChilds(String id,String roleid);
	public LeftCustomBean getFirstChilds(String id);
	
}
