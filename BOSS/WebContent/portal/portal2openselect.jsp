<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage=""%>
<%@ page import=java.util.*,org.genius.data.*,org.genius.util.*"%>
<%@ page import="org.jdom.output.Format,org.jdom.Element,org.jdom.Document,com.genius.portal.actionbean.*"%>
<%@ page import="org.jdom.output.XMLOutputter,com.genius.portal.*"%>

<%
			Portal2 portal = new Portal2();
			ArrayList list = new ArrayList();
			list = portal.functionSelect();
			Element root = new Element("entity");
			Iterator it = list.iterator();
			while (it.hasNext()) {
				portal2Bean bean = (portal2Bean) it.next();
				Element row = new Element("row");
				Element field1 = new Element("field");
				field1.setAttribute("name", "value");
				field1.setAttribute("value", bean.getId());
				row.addContent(field1);
				Element field2 = new Element("field");
				field2.setAttribute("name", "field");
				field2.setAttribute("value", bean.getSelect());
				row.addContent(field2);
				root.addContent(row);
				bean = null;
			}
			Document doc = new Document(root);
			response.setContentType("application/xml;charset=GB2312");
			Format format = Format.getPrettyFormat();
			format.setEncoding("GB2312");
			XMLOutputter outer = new XMLOutputter(format);
			outer.output(doc, response.getWriter());
%>
