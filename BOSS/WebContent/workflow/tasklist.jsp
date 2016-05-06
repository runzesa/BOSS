<%@page import="org.jbpm.pvm.internal.model.ExecutionImpl"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*,org.jbpm.api.task.*,com.workflow.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>任务列表</title>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script language="JavaScript">

</script>
</head>
<%
	ProcessEngine pe = Configuration.getProcessEngine();
	TaskService ts = pe.getTaskService();
//	ts.deleteTask("460003");
	//根据用户名获取其任务,list为正序,新录入的在最后
	//ts.findPersonalTasks((String)session.getAttribute("userName"));
	List<Task> taskList = ts.findPersonalTasks((String)session.getAttribute("userId"));
	//反转list中元素的顺序,让新录入的到最前
	Collections.reverse(taskList);
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980007");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980071");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980093");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980115");
%>
<body class="right_date_body" scroll="auto">
<div id="message_box"></div>
<div class="gzl_date_top">
    <div><h1>待办流程</h1></div>
</div>
<div class="gzl_date">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>任务编号</th>
				<th>流程编号</th>
				<th>发起人</th>
          		<th>当前任务名称</th>
          		<th>提交时间</th>
          		<th>处理</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Task task:taskList){
				//发起人
				Object var = ts.getVariable(task.getId(),"init_user");
		%>
			<tr>
				<td><%=task.getId() %></td>
				<td><%=task.getExecutionId() %></td>
				<td><%=GetData.getNameById(var+"") %></td>
				<td><%=task.getName() %></td>
				<td><%=ChangeDatetime.showDatetime(task.getCreateTime()) %></td>
				<% 
					//跳转页面
					String defaultForm = "../error404.jsp";
					FlowInfo fs = new FlowInfo();
					defaultForm = fs.getDefaultForm(task);
				%>
				<td><a href='../<%=defaultForm %>?actiontype=update&id=<%=ts.getVariable(task.getId(),"formid") %>&taskid=<%=task.getId() %>'>处理</a></td>
			</tr>
		<%	}%>
		</tbody>
	</table>
</div>
</body>
</html>

