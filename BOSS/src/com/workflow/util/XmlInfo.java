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
 * ȡxml������
 */
public class XmlInfo {
//	private String fileName;
	public static final String returnType_NAME = "NAME";
	public static final String returnType_TYPE = "TYPE";
	private Element root;
	
	public XmlInfo() {}
	
	/**
	 * ��ȡָ�����Ƶ����̶����ļ�
	 * @param ���̶�������
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
	 * �ӵ�ǰxml�л�ȡ����tagName�ڵ�,�ٴ����ҳ�name����ֵ����Ľڵ�,���ص�һ�����������Ľڵ�
	 * @param tagName �ڵ��ǩ��
	 * @param name �ڵ�name����ֵ
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
	 * ��ȡ��nodeName����Ľڵ�
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
	 * ����δָ�����Ƶĵ�һ���ڵ�
	 * @param tagName ��ǩ��
	 * @return element
	 */
	public Element getElementByTagName(String tagName){
		Element element = null;
		//�����ǰxml�����б�ǩ��ΪtagName�Ľڵ�,��ֻ���ص�һ��
		List<Element> children = getChildrenByTagName(this.root, tagName);
		for(Element child:children){
			element = child;
			break;
		}
		return element;
	}
	
	/**
	 * ��ȡָ��name�Ľڵ�,���ش˽ڵ�ı�ǩ��
	 * @param name �ڵ�����
	 * @param returnType ��������
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
	 * ��ȡĳ���ڵ����һ���ڵ������ornameֵ
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
			//����name�ҵ��ڵ�,ȡ�ýڵ�ı�ǩ��
			String nodeType = getNodeType(outToName, getType);
			type = nodeType;
		}
		
		return type;
	}
	
	public String subUserString(String user){
		return user.substring(2, user.length()-1);		
	}

	/****************************** *������ط���* ******************************/
	
	/**
	 * ��ȡ�ڵ���������б�
	 * @param nodeName �ڵ���
	 * @param tagName �ڵ��ǩ
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
	 * ��ȡ�ڵ���������б�
	 * @param nodeName �ڵ���
	 * @return
	 */
	public List<TransitionBean> getNodeTransitionList(String nodeName){
		return getNodeTransitionList(nodeName, null);
	}
	
	/**
	 * ��ȡ�����ߵ�Ŀ��ڵ�
	 * @param nodeName �ڵ�name
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
	 * ��ȡ����Ĳ������б�
	 * @param taskName ��������
	 * @return ����������б�
	 */
	@SuppressWarnings (value = "deprecation")
	public List<com.workflow.util.bak.AssigneeBean> getNextUser(String taskName){
		List<com.workflow.util.bak.AssigneeBean> result = new ArrayList<com.workflow.util.bak.AssigneeBean>();
		//������������ȡ������
		Element task = getElementByName("task",taskName);
		//ȡ���������ת����
		List<Element> outs = getChildrenByTagName(task,"transition");
		
		for(Element out:outs){
			//ȡ����ת��˭
			String outToName = out.getAttributeValue("to").toString();
			//����name�ҵ��ڵ�,ȡ�ýڵ�ı�ǩ��
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
	 * ���ؽ����Ľڵ�
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
	 * ��ȡ�����ǩtask�Ĳ���������(none/department/assignee/role)
	 * @param taskName �����name
	 * @param outName ��ת����������
	 * @return 
	 */
	@SuppressWarnings (value = "deprecation")
	private com.workflow.util.bak.AssigneeBean getAssignee(String taskName,String outName){
		Element task = getElementByName("task",taskName);
		//�����������
		com.workflow.util.bak.AssigneeBean ass = new com.workflow.util.bak.AssigneeBean();
		//��ת����������
		ass.setOutName(outName);
		//������
		ass.setTaskName(task.getAttributeValue("name"));
		//���������
		String assignee = task.getAttributeValue("assignee");
		//�������������type="NONE/DEPARTMENT/ROLE/assignee"
		ass.setAssType(task.getAttributeValue("type"));
		ass.setAssValue(assignee.substring(2,assignee.length()-1));
		return ass;
	}
	
	/**
	 * ����xml��ȡ���̶�Ӧ�ı���ַ
	 * @return ���̶�Ӧ�ı���ַ:xxx/insert.jsp
	 */
	public String getDefault(){
		String defaultName = "";
		defaultName = root.getAttributeValue("form");//xml���ڵ��д洢����ַ������
		return defaultName;
	}
	
	/**
	 * �����������ļ���ȡ��������(���ڵ��description����)
	 * @return ��������
	 */
	public String getDeafaultDescribe(){
		if(root.getAttributeValue("description")!=null)
			return root.getAttributeValue("description");
		else
			return "";
	}
	
	/****************************** *��XmlParse������* ******************************/
	/**
	 * ����ָ����ǩ���Ľڵ���ӽڵ��б�
	 * @param parent ���ڵ�
	 * @param tagName �ڵ�����
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
	
	
	/****************************** *Ŀǰ�ò���* ******************************/
	/**
	 * �����xml���޸�
	 */
	@Deprecated
	public void saveEdit(Document doc,String fileName){
		createXml(doc,"../../process/"+fileName+".jpdl.xml");
	}
	
	/**
	 * ����xml�ĵ�
	 * @param doc
	 * @param fileName �ļ���������·��
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
