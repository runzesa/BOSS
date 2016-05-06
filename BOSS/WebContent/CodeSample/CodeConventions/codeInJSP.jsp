<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

	<!--页面中需要引用的java类-->
	<%@ page import="java.util.*" %>
	<%@ page import="org.genius.data.*" %>
	<%@ page import="java.sql.*"%>
	<%@ page import="com.genius.CodeSample.CodeConventions.*" %>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
	
	<!-- 引用外部css文件 -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    
    <!-- 引用外部js文件 -->
    <script type="text/javascript" src="js/mootools.js"></script>

	<!-- 页面中嵌入js代码 -->
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
	
	<!-- 通过javaBean和ResultSet获取在数据并存入ArrayList中  -->
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

	<!-- 将取得的数据直接写入页面  -->
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

        