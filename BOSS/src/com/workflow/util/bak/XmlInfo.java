package com.workflow.util.bak;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;


/**
 * @author fengL
 */
public class XmlInfo {
//	private String fileName;
	private Element root;
	XmlParse xml;
	
	/**
	 * ��ȡָ�����Ƶ����̶����ļ�
	 * @param ���̶�������
	 */
	public XmlInfo(String fileName) throws JDOMException, IOException{
//		this.fileName = fileName;
		xml = new XmlParse("../../process/"+fileName+".jpdl.xml");
		root = xml.getRoot();
	}
	
	/**
	 * ��ȡxml���ڵ�
	 */
	public Element getRoot(){
		return root;
	}
	
	/**
	 * ��ø��ڵ�root�������ӽڵ�
	 */
	public List<?> getAllNode(){
		List<?> nodeList = new ArrayList<Object>();
		nodeList = root.getChildren();
		return nodeList;
	}
	
	/**
	 * ��ȡ����Ĳ������б�
	 * @param ��������
	 */
	@Deprecated
	public List<AssigneeBean> getNextUser(String taskName){
		List<AssigneeBean> result = new ArrayList<AssigneeBean>();
		Element task = getElementByName(root,"task",taskName);
		List<Element> outs = xml.getChildrenByTagName(task,"transition");
		
		for(Element out:outs){
			String outToName = out.getAttributeValue("to").toString();
			if(getNodeType(outToName).equals("task")){
				result.add(getAssignee(outToName,out.getAttributeValue("name").toString()));
			}else if(getNodeType(outToName).equals("end")){
				result.add(getEnd(out));
			}
		}
		return result;
	}
	
	/**
	 * ��ȡ���̵Ľ����ڵ�
	 */
	@Deprecated
	public AssigneeBean getEnd(Element endElement){
		AssigneeBean ass = new AssigneeBean();
		String outTo = endElement.getAttributeValue("to").toString();
		String outName = endElement.getAttributeValue("name").toString();
		ass.setAssType("endprocess");
		ass.setAssValue("endprocess");
		ass.setOutName(outName);
		ass.setTaskName(outTo);
		return ass;
	}
	
	/**
	 * ��ȡ����Ĳ���������
	 * @param ��������
	 * @return
	 */
	@Deprecated
	public AssigneeBean getAssignee(String taskName,String outName){
//		String result = "";
		//Element task = root.getChild(taskName);
		Element task = getElementByName(root,"task",taskName);
		//type="NONE/DEPARTMENT/ROLE/assignee"
		//�����������
		AssigneeBean ass = new AssigneeBean();
		ass.setOutName(outName);
		ass.setTaskName(task.getAttributeValue("name"));

		//�������Ϊassignee
		String assignee = task.getAttributeValue("assignee");
		
		if(assignee.indexOf("#{")!=0){
			ass.setAssType("static_user");
			ass.setAssValue(assignee);
		}else{	
			ass.setAssType(task.getAttributeValue("type"));
			ass.setAssValue(assignee.substring(2,assignee.length()-1));
		}
		
		return ass;
	}
	
	/**
	 * ��ȡָ�����ͺ�name���׸��ڵ�
	 * @param ���ڵ�
	 * @param �ڵ�����
	 * @param �ڵ�name����ֵ
	 * @return
	 */
	public Element getElementByName(Element parent,String tagName,String name){
		Element element = null;
		List<Element> children = xml.getChildrenByTagName(parent, tagName);
		for(Element child:children){
			if(child.getAttributeValue("name").equals(name)){
				return child;
			}
		}
		return element;
	}
	
	/**
	 * ����δָ�����Ƶĵ�һ�����ͽڵ�
	 * @param parent
	 * @param tagName
	 * @return
	 */
	public Element getElementByTagName(Element parent,String tagName){
		Element element = null;
		List<Element> children = xml.getChildrenByTagName(parent, tagName);
		for(Element child:children){
			return child;
		}
		return element;
	}
	
	
	/**
	 * ��ȡָ�����ƵĽڵ�����
	 * @param �ڵ�����
	 */
	public String getNodeType(String name){
		String result = "";
		List<?> children = root.getChildren();
		for(Object obj:children){
			Element e = (Element)obj;
			if(e.getAttributeValue("name").equals(name))
				result = e.getName();
		}
		return result;
	}
	
	/**
	 * @return
	 */
	public String getDefault(){
		String defaultName = "";
//		TODO �������������ĸ��ڵ����������Ϊfrom
		defaultName = root.getAttributeValue("from");//���������ɹ������ɵ�xml������
//		defaultName = root.getAttributeValue("form");//jbpm���ɵ�xml������
		return defaultName;
	}
	
	public String getDeafaultDescribe(){
		if(root.getAttributeValue("description")!=null)
			return root.getAttributeValue("description");
		else
			return "";
	}
	
	
	
	
	/****************************** *Ŀǰ�ò���* ******************************/
	/**
	 * �����xml���޸�
	 */
	@Deprecated
	public void saveEdit(Document doc,String fileName){
		XmlParse xmlparse=new XmlParse();	
		xmlparse.createXml(doc,"../../process/"+fileName+".jpdl.xml");
	}
}
