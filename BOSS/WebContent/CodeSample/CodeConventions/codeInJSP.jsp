<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

	<!--ҳ������Ҫ���õ�java��-->
	<%@ page import="java.util.*" %>
	<%@ page import="org.genius.data.*" %>
	<%@ page import="java.sql.*"%>
	<%@ page import="com.genius.CodeSample.CodeConventions.*" %>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
	
	<!-- �����ⲿcss�ļ� -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    
    <!-- �����ⲿjs�ļ� -->
    <script type="text/javascript" src="js/mootools.js"></script>

	<!-- ҳ����Ƕ��js���� -->
	<script language="JavaScript">
	<!--
		var str="";
		function example(){
			//do something...
		}
	-->
	</script>
	
</head>

	<body>
	
	<!-- ͨ��javaBean��ResultSet��ȡ�����ݲ�����ArrayList��  -->
	<% 
	DataConfig myData = new DataConfig();
	ArrayList myList = new ArrayList();
	myData.init();
	try{
		myData.openConnection();
		String sql = "select * from table";
		ResultSet rs = myData.executeQuery(sql);
		while(rs.next()){	
			javaBean bean = new javaBean();
			bean.setId(rs.getString("id"));
			//......
			myList.add(bean);
			bean = null;	
		}
		rs.close();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		myData.closeConnection();
	}
	
	%>

	<!-- ��ȡ�õ�����ֱ��д��ҳ��  -->
	<select name='select1'>
	<% 
	DataConfig myData2 = new DataConfig();
	myData2.init();
	try{
		myData2.openConnection();
		String sql = "select * from table";
		ResultSet rs = myData2.executeQuery(sql);
		while(rs.next()){
			%>
			<option value='<%=rs.getString("id")%>'><%=rs.getString("name") %></option>
			<%
		}
		rs.close();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		myData2.closeConnection();
	}
	%>
	</select>
	
	</body>
</html>                      

        