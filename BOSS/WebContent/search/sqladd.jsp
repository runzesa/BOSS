<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.genius.search.search.TypeForm"%>
<%@ page import="com.genius.search.search.RoleForm" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.genius.search.search.actionbean.TypeFromActionBean"%>
<%@page import="com.genius.search.search.actionbean.RoleFormActionBean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String actionType = (String)request.getAttribute("actiontype");
	String editId = "0";
	String searchName="";
	String sqlPower="0";
	String showArray="";
	String sqlContent="";
	String sqlquary="";
	String searchType="";
	String sqlCountShow="";
	String sqlCountContent="";
	if(actionType.equals("add")){}
	else if(actionType.equals("addex")){
		showArray = (String)request.getAttribute("showarray");
		sqlContent = (String)request.getAttribute("sqlcontent");
		sqlquary= (String)request.getAttribute("sqlquary");
	
	}else if(actionType.equals("update")){
		searchName = (String)request.getAttribute("searchname");
		sqlContent = (String)request.getAttribute("sqlcontent");
		showArray = (String)request.getAttribute("showarray");
		sqlPower = (String)request.getAttribute("sqlpower");
		editId = (String)request.getAttribute("editid");
		sqlquary= (String)request.getAttribute("sqlquary");
		searchType=(String)request.getAttribute("searchtype");
		sqlCountShow = (String)request.getAttribute("sqlcountshow");
		sqlCountContent=(String)request.getAttribute("sqlcountcontent");
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>������ѯ</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>

<script language="JavaScript">
function validate(form){
	if(document.forms[0].searchname.value ==""){
		alert("����д��ѯ����!");
		return(false);
	}
	if(document.forms[0].sqlpower.value =="0"){
		alert("��ѡ�����Ȩ��!");
		return(false);
	}
	if(document.forms[0].searchtype.value =="0"){
		alert("��ѡ���ѯ����!");
		return(false);
	}
	if(form.showarray.value==""){
		alert("��ʾ�ֶ����ݣ�");
		return(false);
	}
	if(form.sqlcontent.value==""){
		alert("��д��ѯ���ݣ�");
		return(false);
	}
	<%if("update".equals(actionType)){%>
		document.forms[0].action="HistoryAction.do?action=update";
	<%}else{%>
		document.forms[0].action="HistoryAction.do?action=add";
	<%}%>
	document.forms[0].submit();
	
	return true;
}
</script>
</head>

<body class="right_date_body" >
<div class="bmgl_div">
<form method="post" action="" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">�Զ����ѯ</div></td>
  	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">��ѯ����:&nbsp;</div></td>
		<td>&nbsp;<input type="text" name="searchname" style="width:250px;border: 1px solid #666;" value="<%=searchName%>"/>
			<input type="hidden" name="editid" value="<%=editId%>"/>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">��ѯ����:&nbsp;</div></td>
		<td>&nbsp;<select name="searchtype">
				<option value=0>ѡ���ѯ����</option>
			<%ArrayList al = new ArrayList();
                TypeForm stf =new TypeForm();
				al = stf.list();
				for (int i=0;i<al.size();i++) {
					TypeFromActionBean bean = (TypeFromActionBean)al.get(i);
					String type = "";
					if(searchType.equals(bean.getSearchId()))
						type="selected=\"selected\"";
					
			%>
					<option value="<%=bean.getSearchId()%>" <%=type %>><%=bean.getSearchName()%></option>
			<%	}%>
			</select>
		<!-- <a href="st_select.do">��ѯ���͹���</a>		-->
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">��ҪȨ��:&nbsp;</div></td>
		<td>&nbsp;<select name=sqlpower>
            	<option value=0>ѡ��Ȩ��</option>
          	<%
				ArrayList alr=new ArrayList();
          		RoleForm srf=new RoleForm();
          		alr=srf.roleSelect();
          		for(int i=0;i<alr.size();i++){
          			RoleFormActionBean bean = (RoleFormActionBean)alr.get(i);
					String type = "";
					if(sqlPower.equals(bean.getId()))
						type="selected=\"selected\"";
            %>
				<option value="<%=bean.getId()%>" <%=type %>><%=bean.getRole()%></option> 
			<%	} %>
			</select>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">��ʾ�ֶ�:&nbsp;</div></td>
		<td>&nbsp;<textarea name="showarray" cols="80%" rows="3" cols="100"><%=showArray%></textarea></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">�û�����:&nbsp;</div></td>
		<td>&nbsp;<textarea name="conditionvar" cols="80%" rows="3" cols="100"><%=sqlquary%></textarea></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">��ѯ����:&nbsp;</div></td>
		<td>&nbsp;<textarea name="sqlcontent" rows="5" cols="80%"><%=sqlContent%></textarea></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">ͳ����ʾ:&nbsp;</div></td>
		<td>&nbsp;<textarea name="sqlcountshow" rows="5" cols="80%""><%=sqlCountShow%></textarea></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="150" height="25"><div align="right">ͳ������:&nbsp;</div></td>
		<td>&nbsp;<textarea name="sqlcountcontent" rows="5" cols="80%"><%=sqlCountContent%></textarea></td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="return validate(document.forms[0]);"><img border="0" src="../adminmanager/images/button_b_bc.gif" width="77" height="21" /></a> 
	<a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../adminmanager/images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>
</html>
