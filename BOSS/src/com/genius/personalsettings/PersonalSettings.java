package com.genius.personalsettings;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.genius.data.DataConfig;
import org.genius.data.IDataConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.genius.personalsettings.actionbean.LeftBean;
import com.genius.personalsettings.actionbean.LeftCustomBean;
import com.genius.personalsettings.actionbean.UserinfoBean;

public class PersonalSettings implements IPersonalSettings{
	private String sId;
	public String getSId() {
		return sId;
	}
	public void setSId(String sId) {
		this.sId = sId;
	}
	public boolean savepwd(String pwdBak, String pwdNew1, String pwdNew2) {
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select password from s_userinfo where id='"+sId+"'");
			
			if(rs.next() && rs.getString(1).equals(pwdBak) && pwdNew1.equals(pwdNew2)){
				String sql = "update s_userinfo set password='"+pwdNew1+"' where id='" + sId + "'";
				myData.addBatch(sql);
				if(myData.commit()){
					result=true;
				}else{
					result=false;
				}
			}
			
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return result;
	}

	public UserinfoBean getUserinfoBean() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		UserinfoBean bean = new UserinfoBean();
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select * from s_userinfo where id='"+sId+"'");
			while(rs.next()){
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setUsername(rs.getString("username"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone(rs.getString("phone"));
				bean.setMobile(rs.getString("mobile"));
				bean.setEmail(rs.getString("email"));
			}
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return bean;
	}

	public boolean updateUserinfo(String name, String address, String phone, String mobile, String email){
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			
			String sql = "update s_userinfo " +
							"set name='" + name + "', address='" + address + "', phone='" + phone
								+ "', mobile='" + mobile + "', email='" + email + "'" +
						 " where id='" + sId + "'";
			myData.addBatch(sql);
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
	 * ��ȡ��¼�û�������б�
	 * @return ��¼�û�������б�
	 */
	public ArrayList<LeftCustomBean> getLeftCustoms() {
		ArrayList<LeftCustomBean> arrayList = new ArrayList<LeftCustomBean>();

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select a.id,a.name,a.url,b.url moduleid from S_Left_Custom a,S_Left b ,s_role_left c,s_userinfo d "+
					"where a.url=b.id and b.id=c.left_id and c.role_id=d.role_id and d.id=a.user_id and a.user_Id='"+sId+"' order by id");
			LeftCustomBean bean = null;
			while(rs.next()){
				bean = new LeftCustomBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setUrl(rs.getString("url"));
				if(checkChild(rs.getString("moduleid")))
					arrayList.add(bean);
			}
			rs.close();
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
	
		return arrayList;
	}
	
	/**
	 * ��ȡtop�Ϸ�������
	 * @return list(LeftCustomBean)
	 */
	public List<LeftCustomBean> getTitleRoots(){
		List<LeftCustomBean> arrayList = new ArrayList<LeftCustomBean>();

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select a.id,a.name,a.titlelinks from s_title_link a");
			LeftCustomBean bean = null;
			while(rs.next()){
				bean = new LeftCustomBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setTarget(rs.getString("titlelinks"));
				arrayList.add(bean);
			}
			rs.close();
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
	
		return arrayList;
	
	}
	
	/**
	 * ����id��ȡ��ģ��
	 * @param id ��ģ��id
	 * @return ��ģ���µ���ģ��
	 */
	public List<LeftCustomBean> getChilds(String id,String roleid){
		List<LeftCustomBean> arrayList = new ArrayList<LeftCustomBean>();
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select a.id,a.name,a.url from s_left a,s_role_left b where a.id=b.left_id and b.role_id='"+roleid+"' and a.parent='"+id+"'");
			LeftCustomBean bean = null;
			while(rs.next()){
				bean = new LeftCustomBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				if(checkChild(rs.getString("url")))
					arrayList.add(bean);
			}
			rs.close();
			myData.endTransaction();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
	
		return arrayList;
	}
	public static boolean checkChild(String url){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		boolean b = false;
		try {
			myData.openConnection();
			String urls[] = url.split("\\.");
			if(url==null)
				return b;
			if(url.startsWith("spe.")){
				String sql = "select id,name from s_module2 where (is_open is null or is_open=0) and id="+ urls[1];
				ResultSet rs2 = myData.executeQuery(sql);
				if(rs2.next())
					b=true;
				rs2.close();
			}else if(url.startsWith("def.")){
				String sql = "select id,name from s_module where (is_open is null or is_open=0) and id="+ urls[1];
				ResultSet rs2 = myData.executeQuery(sql);
				if(rs2.next())
					b=true;
				rs2.close();
			}else if(url.equals("") || url.equals("#")){
				b=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
		return b;
	}
	
	/**
	 * ������ȡ��ȡtop�����µĵ�һ������
	 * @param id top��ĳ�����ӵ�id
	 * @return �������ӵ�bean
	 */
	public LeftCustomBean getFirstChilds(String id){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		LeftCustomBean bean = null;
		try {
			myData.openConnection();
			myData.beginTransaction();
			ResultSet rs = myData.executeQuery("select a.id,a.name from s_left a where a.id='"+id+"'");
			if(rs.next()){
				bean = new LeftCustomBean();
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
			}
			rs.close();
			myData.endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			myData.closeConnection();
		}
	
		return bean;
	}
	
	/**
	 * ��������,ɾ����ǰ�û������о����ݲ���������
	 * @param leftCustoms Ҫ����������б�
	 * @return �Ƿ�ɹ�
	 */
	public boolean updateLeftCustoms(ArrayList<LeftCustomBean> leftCustoms) {
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
			deleteLeftCustom(sId);
			for (int i = 0; i < leftCustoms.size(); i++) {
				LeftCustomBean bean = leftCustoms.get(i);
				String sql = "insert into s_left_custom(name,url,user_id) " +
						"values ('" + bean.getName() + "', '" + bean.getUrl() + "','"+sId+"')";
				myData.addBatch(sql);
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
	
	/**
	 * ɾ��ĳ���û�������left�˵�
	 * @param urlId �û�id
	 * @return
	 */
	private boolean deleteLeftCustom(String urlId) {
		boolean result=false;
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		IDataConfig myData = (IDataConfig) context.getBean("dataConfigProxy");
		myData.init();
		try {
			myData.openConnection();
			myData.beginTransaction();
				myData.addBatch("delete from s_left_custom where user_id ='"+urlId+"'");
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
