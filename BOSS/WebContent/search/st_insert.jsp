<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>


<%@page import="com.genius.search.searchtype.actionbean.InsertActionBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.genius.search.searchtype.actionbean.SearchparentidActionBean"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ݱ༭</title>
<style type="text/css"></style>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<link rel="stylesheet" type="text/css" media="all" href="../adminmanager/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="stylesheet" type="text/css" media="all" href="../adminmanager/css/skins/aqua/theme.css" title="Aqua" />
<script language="JavaScript">
<!--
var act = "<%=request.getParameter("acttype") %>";
function submit(){
	if(act=="insert" || act==""){
		document.form1.action="st_insertnew.do";
		document.form1.submit();
	}else if(act=="update"){
		var id = "<%=request.getParameter("id") %>";
		document.form1.action="st_insertedit.do?id="+id;
		document.form1.submit();
	}
}
-->
</script>
</head>
<%
InsertActionBean bean = (InsertActionBean)request.getAttribute("bean");
%>
<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="insert.do" name="form1">
<input type="hidden" name="id" id="id" value="<%=request.getAttribute("updateid") %>"/>
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">����¼��</div></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">��������:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="searchname" value="<%=bean==null?"":bean.getSearchname() %>"/></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">��������:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="searchparentid" style="width:150px">
			<% 
			ArrayList list = (ArrayList)request.getAttribute("typeList");
			String id = request.getAttribute("updateid")+"";
			for(Object obj: list){
				SearchparentidActionBean typeBean = (SearchparentidActionBean)obj;
				
				String sel = "";
				if(bean!=null && bean.getSearchparentid().equals(typeBean.getSearchid()))
					sel = "selected='selected'";
				if(!id.equals(typeBean.getSearchid()))
					out.println("<option value='"+typeBean.getSearchid()+"' "+sel+">"+typeBean.getSearchname()+"</option>");
			}
			%>
		</select>
		</td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="submit()"><img border="0" src="../adminmanager/images/button_b_bc.gif" width="77" height="21" /></a> 
	<a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../adminmanager/images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>
</html>
