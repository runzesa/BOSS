<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@page import="org.jbpm.api.*,java.util.*,org.jbpm.api.model.*" %>
<%@page import="org.jbpm.api.history.HistoryActivityInstance"%>
<%@page import="org.jbpm.api.history.HistoryTask"%>
<%@page import="org.jbpm.api.history.HistoryProcessInstance"%>
<%@page import="org.jbpm.pvm.internal.env.EnvironmentFactory"%>
<%@page import="org.jbpm.pvm.internal.env.EnvironmentImpl"%>
<%@page import="org.jbpm.pvm.internal.history.model.HistoryTaskImpl"%>
<%@page import="com.workflow.util.ChangeDatetime"%>
<%@page import="com.workflow.util.GetData"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<title>流程跟踪</title>
	<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
	<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
	
<%
	ProcessEngine pe = Configuration.getProcessEngine();
	HistoryService hs = pe.getHistoryService();

	//流程id,并解析出模块
	String id = request.getParameter("id");
	String srcName = id.split("\\.")[0];

	//流程对应的模块的链接
	String formpage = "../"+srcName+"/insert.jsp?actiontype=update&id="+hs.getVariable(id,"formid");
	
	//显示完成的信息..因为活动里没有存只能从流程id里找
	HistoryProcessInstance hpi = hs.createHistoryProcessInstanceQuery().processInstanceId(id).list().get(0);
	
	//取出流程历史活动列表
	List<HistoryActivityInstance> haiList = hs.createHistoryActivityInstanceQuery().processInstanceId(id).list();
%>
	
</head>
<body class="right_date_body" scroll="auto">
<div class="gzl_date_top">
    <div><h1>流程跟踪</h1></div>
	<div class="right_date_top_nav">
		<ul>
			<li style="display: block;" class="new">
				<a id="new" href="javascript:void(0)" onclick="window.location='<%=formpage %>'">查看历史表单</a>
			</li>
		</ul>
	</div>
</div>
<div class="gzl_date">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>状态</th>
      		<th>开始时间</th>
      		<th>结束时间</th>
      		<th>持续时间</th>
      		<th>任务受理人</th>
		</tr>
	</thead>
	<tbody>
	<%
	for(HistoryActivityInstance hai:haiList){
		//通过活动找到任务最后取用户名
		String u="";
		//先找到同样流程id的任务,再找同样链接的任务,找到唯一对应的任务
		List<HistoryTask> htlist = hs.createHistoryTaskQuery().executionId(hai.getExecutionId()).outcome(hai.getTransitionNames().get(0)).list();
		if(htlist!=null && htlist.size()>0){
			HistoryTask ht2 = htlist.get(0);
			u = GetData.getNameById(ht2.getAssignee());
		}else{
			u = "系统自动流转";
		}
		%>
		<tr>
			<td><%=hai.getActivityName()%></td>
			<td><%=ChangeDatetime.showDatetime(hai.getStartTime()) %></td>
			<td>&nbsp;<%=ChangeDatetime.showDatetime(hai.getEndTime()) %></td>
			<td>&nbsp;<%=ChangeDatetime.getDuration(hai.getDuration())%></td>
			<td>&nbsp;<%=u %></td>
		</tr>
	<%
	}
	//最后手动画出来完成节点
	%>
	<tr>
		<td><%=hpi.getEndActivityName() %></td>
		<td><%=ChangeDatetime.showDatetime(hpi.getEndTime()) %> </td>
		<td>&nbsp;<%=ChangeDatetime.showDatetime(hpi.getEndTime()) %></td>
		<td>&nbsp;少于1分钟</td>
		<td>&nbsp;</td>
	</tr>
	</tbody>
</table>
<div style="position:relative;">
<img src="../process/<%=srcName %>.png" style="position:absolute;left:0px;top:0px;" />
<div id="plocation" style="display:none;position:absolute;border:2px solid red;"></div>
</div>
</div>
</body>
</html>