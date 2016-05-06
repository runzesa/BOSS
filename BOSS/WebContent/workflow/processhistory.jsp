<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html; charset=GBK"%>
<%@page import="org.jbpm.api.*,java.util.*" %>    
<%@page import="org.jbpm.pvm.internal.env.EnvironmentFactory"%>
<%@page import="org.jbpm.pvm.internal.env.EnvironmentImpl"%>
<%@page import="org.jbpm.pvm.internal.session.DbSession"%>
<%@page import="org.jbpm.pvm.internal.task.TaskImpl"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.jbpm.api.cmd.Command"%>
<%@page import="org.jbpm.api.history.HistoryActivityInstance"%>
<%@page import="org.jbpm.api.history.HistoryProcessInstance"%>
<%@page import="com.workflow.util.ChangeDatetime"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>流程实例</title>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
</head>
<% 
	//ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	//applicationContext.start();
	//ProcessEngine pe = (ProcessEngine)applicationContext.getBean("processEngine");
	ProcessEngine pe = Configuration.getProcessEngine();
	ExecutionService es = pe.getExecutionService();  
	HistoryService hs = pe.getHistoryService();
	List<HistoryProcessInstance> haiList = hs.createHistoryProcessInstanceQuery().list();
	Collections.reverse(haiList);
//	System.out.println(haiList.get(0).getEndActivityName());
//	System.out.println(haiList.get(0).getProcessInstanceId());//流程id
//	System.out.println(haiList.get(0).getProcessDefinitionId());//流程版本
//	System.out.println(haiList.get(0).getState());
%>
<body class="right_date_body" scroll="auto">
<div id="message_box"></div>
<div class="gzl_date_top">
    <div><h1>已办结流程</h1></div>
</div>
<div class="gzl_date">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>状态</th>
          		<th>流程编号</th>
          		<th>开始时间</th>
          		<th>结束时间</th>
          		<th>持续时间</th>
          		<th>详细</th>
			</tr>
		</thead>
		<tbody>
		<%for(HistoryProcessInstance hai:haiList){
			if(hai.getEndActivityName()!=null){
			%>
			<tr>
				<td><%=hai.getEndActivityName()%></td>
				<td><%=hai.getProcessInstanceId() %></td>
				<td><%=ChangeDatetime.showDatetime(hai.getStartTime()) %></td>
				<td><%=ChangeDatetime.showDatetime(hai.getEndTime()) %></td>
				<td><%=ChangeDatetime.getDuration(hai.getDuration())%></td>
				<td><a href="viewhistory.jsp?id=<%=hai.getProcessInstanceId() %>">详细信息</a></td>
			</tr>
		<%	}
		} %>
		</tbody>
	</table>
</div>
</body>
</html>

