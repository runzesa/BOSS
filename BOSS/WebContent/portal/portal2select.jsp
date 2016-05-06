<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page
	import="java.io.IOException,java.sql.ResultSet,java.sql.SQLException,java.util.*,org.genius.data.*,org.genius.util.*,java.sql.*"%>
<%@ page import="com.genius.portal.actionbean.*"%>
<%@ page import="com.genius.portal.*"%>
<%String userId = (String) session.getAttribute("userId");
			String portal = request.getParameter("portal");

			Portal2 po = new Portal2();
			portal2Bean bean = po.selectLink(userId, portal);
			String result = "";
			if (bean.getPortletName() == null || bean.getPortletName() == ""
					|| bean.getPortletName().equals("")
					|| bean.getPortletName().equals("null")) {
				result = "未定义功能模块" + "#" + bean.getPortletLink();
			} else {
				result = bean.getPortletName() + "#" + bean.getPortletLink();
			}
			out.println(result);

		%>
