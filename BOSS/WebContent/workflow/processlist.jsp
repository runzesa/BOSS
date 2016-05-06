<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*" %>    
<%@page import="org.jbpm.api.task.Task"%>
<%@page import="com.workflow.util.GetData"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>办结流程</title>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.js" type="text/javascript"></script>

</head>
<% 
	ProcessEngine pe = Configuration.getProcessEngine();
	ExecutionService es=pe.getExecutionService();  
	
	String userName = (String)session.getAttribute("userId");
	
	List<ProcessInstance> piList = es.createProcessInstanceQuery().list();
	Collections.reverse(piList);
	TaskService ts = pe.getTaskService();
%>
<body class="right_date_body" scroll="auto">
<div id="message_box"></div>
<div class="gzl_date_top">
    <div><h1>流程实例</h1></div>
</div>
<div class="gzl_date">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>流程编号</th>
				<th>流程定义编号</th>
				<th>发起人</th>
				<th>待办人</th>
          		<th>当前任务</th>
          		<th>状态</th>
          		<th>流程跟踪</th>
			</tr>
		</thead>
		<tbody>
		<%for(ProcessInstance pi:piList){
			List<Task> taskList = ts.createTaskQuery().processInstanceId(pi.getId()).list();
			if(taskList.size()==0)
				continue;
			Task task = taskList.get(0);
			Object var = ts.getVariable(task.getId(),"init_user");
			if(!userName.equals(task.getAssignee()) && !userName.equals(var))
				continue;
			%>
			<tr>
				<td><%=pi.getId() %></td>
				<td><%=pi.getProcessDefinitionId()%></td>
				<td><%=GetData.getNameById(var.toString()) %></td>
				<td><%=GetData.getNameById(task.getAssignee()) %></td>
				<td><%=pi.findActiveActivityNames() %></td>
				<td><%=pi.getState() %></td>
				<td><a href="view.jsp?id=<%=pi.getId() %>">流程跟踪</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
</body>
</html>

