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
	 * 获取指定名称的流程定义文件
	 * @param 流程定义名称
	 */
	public XmlInfo(String fileName) throws JDOMException, IOException{
//		this.fileName = fileName;
		xml = new XmlParse("../../process/"+fileName+".jpdl.xml");
		root = xml.getRoot();
	}
	
	/**
	 * 获取xml根节点
	 */
	public Element getRoot(){
		return root;
	}
	
	/**
	 * 获得根节点root下所有子节点
	 */
	public List<?> getAllNode(){
		List<?> nodeList = new ArrayList<Object>();
		nodeList = root.getChildren();
		return nodeList;
	}
	
	/**
	 * 获取任务的参与者列表
	 * @param 任务名称
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
	 * 获取流程的结束节点
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
	 * 获取任务的参与者属性
	 * @param 任务名称
	 * @return
	 */
	@Deprecated
	public AssigneeBean getAssignee(String taskName,String outName){
//		String result = "";
		//Element task = root.getChild(taskName);
		Element task = getElementByName(root,"task",taskName);
		//type="NONE/DEPARTMENT/ROLE/assignee"
		//任务分配属性
		AssigneeBean ass = new AssigneeBean();
		ass.setOutName(outName);
		ass.setTaskName(task.getAttributeValue("name"));

		//任务分配为assignee
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
	 * 获取指定类型和name的首个节点
	 * @param 父节点
	 * @param 节点类型
	 * @param 节点name属性值
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
	 * 返回未指定名称的第一个类型节点
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
	 * 获取指定名称的节点类型
	 * @param 节点名称
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
//		TODO 工作流生成器的根节点这个属性名为from
		defaultName = root.getAttributeValue("from");//工作流生成工具生成的xml的属性
//		defaultName = root.getAttributeValue("form");//jbpm生成的xml的属性
		return defaultName;
	}
	
	public String getDeafaultDescribe(){
		if(root.getAttributeValue("description")!=null)
			return root.getAttributeValue("description");
		else
			return "";
	}
	
	
	
	
	/****************************** *目前用不到* ******************************/
	/**
	 * 保存对xml的修改
	 */
	@Deprecated
	public void saveEdit(Document doc,String fileName){
		XmlParse xmlparse=new XmlParse();	
		xmlparse.createXml(doc,"../../process/"+fileName+".jpdl.xml");
	}
}
