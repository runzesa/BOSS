<%@page import="org.jbpm.pvm.internal.model.ExecutionImpl"%>
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.jbpm.api.*,java.util.*,org.jbpm.api.task.*,com.workflow.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>�����б�</title>
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
	//�����û�����ȡ������,listΪ����,��¼��������
	//ts.findPersonalTasks((String)session.getAttribute("userName"));
	List<Task> taskList = ts.findPersonalTasks((String)session.getAttribute("userId"));
	//��תlist��Ԫ�ص�˳��,����¼��ĵ���ǰ
	Collections.reverse(taskList);
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980007");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980071");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980093");
//	pe.getExecutionService().deleteProcessInstanceCascade("workflow_join.1980115");
%>
<body class="right_date_body" scroll="auto">
<div id="message_box"></div>
<div class="gzl_date_top">
    <div><h1>��������</h1></div>
</div>
<div class="gzl_date">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>������</th>
				<th>���̱��</th>
				<th>������</th>
          		<th>��ǰ��������</th>
          		<th>�ύʱ��</th>
          		<th>����</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Task task:taskList){
				//������
				Object var = ts.getVariable(task.getId(),"init_user");
		%>
			<tr>
				<td><%=task.getId() %></td>
				<td><%=task.getExecutionId() %></td>
				<td><%=GetData.getNameById(var+"") %></td>
				<td><%=task.getName() %></td>
				<td><%=ChangeDatetime.showDatetime(task.getCreateTime()) %></td>
				<% 
					//��תҳ��
					String defaultForm = "../error404.jsp";
					FlowInfo fs = new FlowInfo();
					defaultForm = fs.getDefaultForm(task);
				%>
				<td><a href='../<%=defaultForm %>?actiontype=update&id=<%=ts.getVariable(task.getId(),"formid") %>&taskid=<%=task.getId() %>'>����</a></td>
			</tr>
		<%	}%>
		</tbody>
	</table>
</div>
</body>
</html>

