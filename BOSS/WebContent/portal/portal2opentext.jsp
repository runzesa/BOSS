<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page
	import="java.io.IOException,java.sql.ResultSet,java.sql.SQLException,java.util.*,org.genius.data.*,org.genius.util.*,java.sql.*"%>
<%@ page import="com.genius.portal.actionbean.*"%>
<%@ page import="com.genius.portal.*"%>

<%String selectX = (String) request.getParameter("selectX");
			Portal2 portal = new Portal2();
			String cell = portal.cellText(selectX);
			out.println(cell);

		%>
