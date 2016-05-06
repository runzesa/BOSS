<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*" %>    
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>流程定义</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.js" type="text/javascript"></script>
</head>
<%
	ProcessEngine pe = Configuration.getProcessEngine();
	RepositoryService rs = pe.getRepositoryService();
	List<ProcessDefinition> pdList = rs.createProcessDefinitionQuery().list();
	Collections.reverse(pdList);
%>
<body class="right_date_body" scroll="auto">
<div class="bmgl_div">
	<div class="yhgl_div">
		流程定义：
	</div>
</div>

<div class="bmgl_div">
<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<thead>
		<tr align="center" style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
			<td height="25">流程名称</td>
			<td>流程定义编号</td>
			<td>版本号</td>
			<td>删除流程定义</td>
		</tr>
	</thead>
	<tbody>
	<%for(ProcessDefinition pd:pdList){ %>
		<tr align="center" height="20" bgcolor="#FFFFFF">
			<td><%=pd.getName() %></td>
			<td><%=pd.getId() %></td>
			<td><%=pd.getVersion() %></td>
			<td><a href="delProcess.do?id=<%=pd.getDeploymentId() %>">删除</a></td>
		</tr>
	<%} %>
	</tbody>
</table>
</div>
</body>
</html>

