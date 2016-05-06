package com.workflow.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

import com.workflow.util.beans.ObjectElementBean;
import com.workflow.util.beans.TransitionBean;

/**
 * 取xml中属性
 */
public class XmlInfo {
//	private String fileName;
	public static final String returnType_NAME = "NAME";
	public static final String returnType_TYPE = "TYPE";
	private Element root;
	
	public XmlInfo() {}
	
	/**
	 * 获取指定名称的流程定义文件
	 * @param 流程定义名称
	 */
	public XmlInfo(String fileName){
//		this.fileName = fileName;
		InputStream is = getClass().getResourceAsStream("/" + "../../process/"+fileName+".jpdl.xml");
		SAXBuilder builder = new SAXBuilder();
		try {
			Document doc = builder.build(is);
			root = doc.getRootElement();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	 * 从当前xml中获取所有tagName节点,再从中找出name属性值相符的节点,返回第一个符合条件的节点
	 * @param tagName 节点标签名
	 * @param name 节点name属性值
	 * @return element
	 */
	public Element getElementByName(String tagName,String name){
		Element element = null;
		List<Element> children = getChildrenByTagName(this.root, tagName);
		for(Element child:children){
			if(child.getAttributeValue("name").equals(name)){
				element = child;
				break;
			}
		}
		return element;
	}
	
	/**
	 * 获取与nodeName相符的节点
	 * @param nodeName
	 * @return
	 */
	public Element getElementByName(String nodeName) {
		Element returnElement = null;
		for (Object object : root.getChildren()) {
			Element element = (Element)object;
			if(nodeName.equals(element.getAttributeValue("name"))){
				returnElement = element;
				break;
			}
		}
		return returnElement;
	}
	
	/**
	 * 返回未指定名称的第一个节点
	 * @param tagName 标签名
	 * @return element
	 */
	public Element getElementByTagName(String tagName){
		Element element = null;
		//查出当前xml下所有标签名为tagName的节点,但只返回第一个
		List<Element> children = getChildrenByTagName(this.root, tagName);
		for(Element child:children){
			element = child;
			break;
		}
		return element;
	}
	
	/**
	 * 获取指定name的节点,返回此节点的标签名
	 * @param name 节点名称
	 * @param returnType 返回类型
	 * @return
	 */
	private String getNodeType(String name, String returnType){
		String result = "";
		List<?> children = root.getChildren();
		for(Object obj:children){
			Element e = (Element)obj;
			if(e.getAttributeValue("name").equals(name)){
				if(returnType_NAME.equals(returnType))
					result = e.getAttributeValue("name");
				else if(returnType_TYPE.equals(returnType))
					result = e.getName();
				break;
			}
		}
		return result;
	}
	
	/**
	 * 获取某个节点的下一个节点的类型orname值
	 * @param nodeName
	 * @param nodeType
	 * @return
	 */
	public String getNextNodeType(String nodeName, String getType){
		String type = "";
		Element task = getElementByName("task", nodeName);
		
		List<Element> outs = getChildrenByTagName(task,"transition");
		for(Element out:outs){
			String outToName = out.getAttributeValue("to").toString();
			//根据name找到节点,取得节点的标签名
			String nodeType = getNodeType(outToName, getType);
			type = nodeType;
		}
		
		return type;
	}
	
	public String subUserString(String user){
		return user.substring(2, user.length()-1);		
	}

	/****************************** *流程相关方法* ******************************/
	
	/**
	 * 获取节点的连接线列表
	 * @param nodeName 节点名
	 * @param tagName 节点标签
	 */
	public List<TransitionBean> getNodeTransitionList(String nodeName, String tagName){
		Element element = null;
		List<TransitionBean> returnList = new ArrayList<TransitionBean>();
		
		if(tagName!=null && !"".equals(tagName))
			element = getElementByName(tagName, nodeName);
		else
			element = getElementByName(nodeName);

		if(element!=null && element.getChildren().size()>0){
			List<Element> list = getChildrenByTagName(element, "transition");
			TransitionBean bean = null;
			for (Element element2 : list) {
				bean = new TransitionBean();
				bean.setName(element2.getAttributeValue("name"));
				bean.setTo(element2.getAttributeValue("to"));
				returnList.add(bean);
			}
		}
		
		return returnList;
	}
	/**
	 * 获取节点的连接线列表
	 * @param nodeName 节点名
	 * @return
	 */
	public List<TransitionBean> getNodeTransitionList(String nodeName){
		return getNodeTransitionList(nodeName, null);
	}
	
	/**
	 * 获取连接线的目标节点
	 * @param nodeName 节点name
	 * @return
	 */
	public ObjectElementBean getTransitionTo(String nodeName){
		Element element = getElementByName(nodeName);
		ObjectElementBean bean = new ObjectElementBean();
		if(element!=null){
			String tagName = element.getName();
			bean.setTagName(tagName);
			bean.setName(element.getAttributeValue("name"));
			String type = element.getAttributeValue("type");
			
			if("task".equals(tagName) || "decision".equals(tagName)){
				bean.setUserType(type);
				bean.setUser(subUserString(element.getAttributeValue("assignee")));
				if("static-user".equals(type)){
					bean.setUserId(element.getAttributeValue("assigneeId"));
				}
			}else if("end".equals(tagName)){
				bean.setUserType("endprocess");
				bean.setUser("endprocess");
			}
		}
		return bean;
	}

	/**
	 * 获取任务的参与者列表
	 * @param taskName 任务名称
	 * @return 任务参与者列表
	 */
	@SuppressWarnings (value = "deprecation")
	public List<com.workflow.util.bak.AssigneeBean> getNextUser(String taskName){
		List<com.workflow.util.bak.AssigneeBean> result = new ArrayList<com.workflow.util.bak.AssigneeBean>();
		//根据任务名称取得任务
		Element task = getElementByName("task",taskName);
		//取得任务的流转属性
		List<Element> outs = getChildrenByTagName(task,"transition");
		
		for(Element out:outs){
			//取得流转给谁
			String outToName = out.getAttributeValue("to").toString();
			//根据name找到节点,取得节点的标签名
			String nodeType = getNodeType(outToName, returnType_TYPE);
			
			if(nodeType.equals("task")){
				result.add(getAssignee(outToName,out.getAttributeValue("name").toString()));
			}else if(nodeType.equals("end")){
				result.add(getEnd(out));
			}
		}
		return result;
	}
	
	/**
	 * 返回结束的节点
	 * @param endElement
	 * @return
	 */
	@SuppressWarnings (value = "deprecation")
	private com.workflow.util.bak.AssigneeBean getEnd(Element endElement){
		String outTo = endElement.getAttributeValue("to").toString();
		String outName = endElement.getAttributeValue("name").toString();
		com.workflow.util.bak.AssigneeBean ass = new com.workflow.util.bak.AssigneeBean();
		ass.setAssType("endprocess");
		ass.setAssValue("endprocess");
		ass.setOutName(outName);
		ass.setTaskName(outTo);
		return ass;
	}
	
	/**
	 * 获取任务标签task的参与者属性(none/department/assignee/role)
	 * @param taskName 任务的name
	 * @param outName 流转的连接线名
	 * @return 
	 */
	@SuppressWarnings (value = "deprecation")
	private com.workflow.util.bak.AssigneeBean getAssignee(String taskName,String outName){
		Element task = getElementByName("task",taskName);
		//任务分配属性
		com.workflow.util.bak.AssigneeBean ass = new com.workflow.util.bak.AssigneeBean();
		//流转连接线名称
		ass.setOutName(outName);
		//任务名
		ass.setTaskName(task.getAttributeValue("name"));
		//任务接收者
		String assignee = task.getAttributeValue("assignee");
		//任务接收者类型type="NONE/DEPARTMENT/ROLE/assignee"
		ass.setAssType(task.getAttributeValue("type"));
		ass.setAssValue(assignee.substring(2,assignee.length()-1));
		return ass;
	}
	
	/**
	 * 解析xml获取流程对应的表单地址
	 * @return 流程对应的表单地址:xxx/insert.jsp
	 */
	public String getDefault(){
		String defaultName = "";
		defaultName = root.getAttributeValue("form");//xml根节点中存储表单地址的属性
		return defaultName;
	}
	
	/**
	 * 从流程配置文件里取流程描述(根节点的description属性)
	 * @return 流程描述
	 */
	public String getDeafaultDescribe(){
		if(root.getAttributeValue("description")!=null)
			return root.getAttributeValue("description");
		else
			return "";
	}
	
	/****************************** *从XmlParse移来的* ******************************/
	/**
	 * 返回指定标签名的节点的子节点列表
	 * @param parent 父节点
	 * @param tagName 节点名称
	 */
	private List<Element> getChildrenByTagName(Element parent,String tagName){
		List<Element> children = new ArrayList<Element>();
		List<?> all = parent.getChildren();
		
		for(Object obj:all){
			Element e = (Element)obj;
			if(e.getName().equals(tagName))
				children.add(e);
		}
		return children;
	}
	
	
	/****************************** *目前用不到* ******************************/
	/**
	 * 保存对xml的修改
	 */
	@Deprecated
	public void saveEdit(Document doc,String fileName){
		createXml(doc,"../../process/"+fileName+".jpdl.xml");
	}
	
	/**
	 * 生成xml文档
	 * @param doc
	 * @param fileName 文件名，包含路径
	 */
	@Deprecated
	public void createXml(Document doc, String fileName) {
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		try {
			outer.output(doc, new FileOutputStream(fileName));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	
}
