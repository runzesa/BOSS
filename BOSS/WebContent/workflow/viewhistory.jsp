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
	<title>���̸���</title>
	<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
	<link href="../css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
	
<%
	ProcessEngine pe = Configuration.getProcessEngine();
	HistoryService hs = pe.getHistoryService();

	//����id,��������ģ��
	String id = request.getParameter("id");
	String srcName = id.split("\\.")[0];

	//���̶�Ӧ��ģ�������
	String formpage = "../"+srcName+"/insert.jsp?actiontype=update&id="+hs.getVariable(id,"formid");
	
	//��ʾ��ɵ���Ϣ..��Ϊ���û�д�ֻ�ܴ�����id����
	HistoryProcessInstance hpi = hs.createHistoryProcessInstanceQuery().processInstanceId(id).list().get(0);
	
	//ȡ��������ʷ��б�
	List<HistoryActivityInstance> haiList = hs.createHistoryActivityInstanceQuery().processInstanceId(id).list();
%>
	
</head>
<body class="right_date_body" scroll="auto">
<div class="gzl_date_top">
    <div><h1>���̸���</h1></div>
	<div class="right_date_top_nav">
		<ul>
			<li style="display: block;" class="new">
				<a id="new" href="javascript:void(0)" onclick="window.location='<%=formpage %>'">�鿴��ʷ��</a>
			</li>
		</ul>
	</div>
</div>
<div class="gzl_date">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>״̬</th>
      		<th>��ʼʱ��</th>
      		<th>����ʱ��</th>
      		<th>����ʱ��</th>
      		<th>����������</th>
		</tr>
	</thead>
	<tbody>
	<%
	for(HistoryActivityInstance hai:haiList){
		//ͨ����ҵ��������ȡ�û���
		String u="";
		//���ҵ�ͬ������id������,����ͬ�����ӵ�����,�ҵ�Ψһ��Ӧ������
		List<HistoryTask> htlist = hs.createHistoryTaskQuery().executionId(hai.getExecutionId()).outcome(hai.getTransitionNames().get(0)).list();
		if(htlist!=null && htlist.size()>0){
			HistoryTask ht2 = htlist.get(0);
			u = GetData.getNameById(ht2.getAssignee());
		}else{
			u = "ϵͳ�Զ���ת";
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
	//����ֶ���������ɽڵ�
	%>
	<tr>
		<td><%=hpi.getEndActivityName() %></td>
		<td><%=ChangeDatetime.showDatetime(hpi.getEndTime()) %> </td>
		<td>&nbsp;<%=ChangeDatetime.showDatetime(hpi.getEndTime()) %></td>
		<td>&nbsp;����1����</td>
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