<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@page import="org.jbpm.api.*,java.util.*,org.jbpm.api.model.*" %>
<%@page import="org.jbpm.api.history.HistoryActivityInstance"%>
<%@page import="com.workflow.util.ChangeDatetime"%>
<%
	String id = request.getParameter("id");
	ProcessEngine pe = Configuration.getProcessEngine();
	RepositoryService rs = pe.getRepositoryService();
	ExecutionService es = pe.getExecutionService();
	
	ProcessInstance processInstance = es.findProcessInstanceById(id);
	//String srcName = (processInstance.getId().split("\\."))[0];
	String srcName = id.split("\\.")[0];
	
	Set<String> activityNames = processInstance.findActiveActivityNames();
	ActivityCoordinates ac = rs.
		getActivityCoordinates(processInstance.getProcessDefinitionId(),activityNames.iterator().next());
	
	HistoryService hs = pe.getHistoryService();
	List<HistoryActivityInstance> haiList = hs.createHistoryActivityInstanceQuery().executionId(id).list();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>流程跟踪</title>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="right_date_body" scroll="auto">
<div class="gzl_date_top">
    <div><h1>流程跟踪</h1></div>
</div>
<div class="gzl_date">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>状态</th>
          		<th>开始时间</th>
          		<th>结束时间</th>
          		<th>持续时间</th>
			</tr>
		</thead>
		<tbody>
		<%for(HistoryActivityInstance hai:haiList){
			%>
			<tr>
				<td><%=hai.getActivityName()%></td>
				<td><%=ChangeDatetime.showDatetime(hai.getStartTime()) %></td>
				<td>&nbsp;<%=ChangeDatetime.showDatetime(hai.getEndTime()) %></td>
				<td>&nbsp;<%=ChangeDatetime.getDuration(hai.getDuration())%></td>
			</tr>
		<%} %>
		</tbody>
	</table>
<div style="position:relative;">
<img src="../process/<%=srcName %>.png" style="position:absolute;left:0px;top:0px;" />
<div style="position:absolute;border:2px solid red;left:<%=ac.getX()%>px;top:<%=ac.getY()%>px;width:<%=ac.getWidth()%>px;height:<%=ac.getHeight()%>px;"></div>
</div>
</div>
</body>
</html>