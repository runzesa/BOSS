/*
 * @ XmlParse.java  2005-10-8
 *
 * @ Author GuanHui
 * 
 * Copyright GuanHui . All rights reserved.
 * 
 */
package com.workflow.util.bak;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jdom.DocType;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

public class XmlParse {

	private Document doc;

	private Element root;

	private DocType docType;

	public XmlParse() {
	}

	/**
	 * 设置文件名
	 * 
	 * @param fileName
	 */
	public XmlParse(String fileName) {
		InputStream is = getClass().getResourceAsStream("/" + fileName);
		SAXBuilder builder = new SAXBuilder();
		try {
			doc = builder.build(is);
			root = doc.getRootElement();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Document getDoc() {
		return doc;
	}

	public void setDoc(Document doc) {
		this.doc = doc;
	}

	public DocType getDocType() {
		return docType;
	}

	public void setDocType(DocType docType) {
		this.docType = docType;
	}

	public Element getRoot() {
		return root;
	}

	public void setRoot(Element root) {
		this.root = root;
	}

	/**
	 * 得到目标元素内容，该方法仅适用于xml文件只有三级的情况
	 * 
	 * @param tableNumber
	 *            目标元素位于第几个二级元素之中，排列从0开始
	 * @param colName
	 *            目标元素的名字
	 * @return 目标节点内容
	 */
	public String getElement(int tableNumber, String colName) {
		String myElementText;

		List<?> myList = root.getChildren();
		Element table = (Element) myList.get(tableNumber);
		Element myElement = (Element) table.getChild(colName);
		myElementText = myElement.getText().trim();

		return myElementText;
	}

	/**
	 * 得到目标元素内容，该方法仅适用于xml文件只有两级的情况
	 * 
	 * @param colName
	 *            目标元素的名字
	 * @return 目标节点内容
	 */
	public String getElement(String colName) {
		String myElementText;

		Element myElement = (Element) root.getChild(colName);
		myElementText = myElement.getText().trim();

		return myElementText;
	}

	/**
	 * 该方法用于根据属性名称定位Element
	 * 
	 * @param ElementName
	 *            节点名称
	 * @param AttributeName
	 *            属性名称
	 * @param AttributeValue
	 *            属性值
	 * @return 节点
	 */
	public Element location(String ElementName, String AttributeName,
			String AttributeValue) {

		List<?> locationList = root.getChildren(ElementName);
		Iterator<?> locationIt = locationList.iterator();

		while (locationIt.hasNext()) {
			Element locationElement = (Element) locationIt.next();
			if (locationElement.getAttributeValue(AttributeName).equals(
					AttributeValue)) {
				return locationElement;
			}
		}
		return null;
	}

	/**
	 * 生成xml文档
	 * 
	 * @param doc
	 * @param fileName
	 *            文件名，包含路径
	 * 
	 */
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
	
	/**
	 * 返回指定名称节点的列表
	 * @param parent 父节点
	 * @param tagName 节点名称
	 */
	public List<Element> getChildrenByTagName(Element parent,String tagName){
		List<Element> children = new ArrayList<Element>();
		List<?> all = parent.getChildren();
		
		for(Object obj:all){
			Element e = (Element)obj;
			if(e.getName().equals(tagName))
				children.add(e);
		}
		return children;
	}

}
