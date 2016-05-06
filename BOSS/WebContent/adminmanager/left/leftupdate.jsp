<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.left.actionbean.*"%>
<%
LeftMenuBean bean=(LeftMenuBean)request.getAttribute("leftmenu"); 
if(bean.getId()==null && request.getParameter("parentid")!=null && request.getParameter("parentid").equals("0")){
	bean.setId("0");
	bean.setName("根菜单");
	bean.setRownum("0");
	bean.setUrl("#");
	bean.setTarget("rightFrame");
}
%>
<%@page import="java.util.Enumeration"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool.js"></script>
<script language="JavaScript">
<!--
function submit(){
	var index = document.getElementById("index_x").value;
	var reg = /^\d{1,2}$/;
	var index2 = "<%=request.getAttribute("index") %>";
	if(reg.test(index)){
		if(index<10 && index.length<2){
			index = "0"+index;
		}
		var rownum = document.getElementById("rownum").value;
		rownum = rownum.substr(0,rownum.lastIndexOf(index2))+index
		XMLHttp.sendReq('GET', 'checkIndex.do?rownum='+rownum, '', req);
	}else{
		alert("菜单顺序输入错误！");
    }
}
function req(xmlObject){
	var index = document.getElementById("index_x").value;
	var reg = /^\d{1,2}$/;
	var index2 = "<%=request.getAttribute("index") %>";
	if(index<10 && index.length<2){
		index = "0"+index;
	}
	var rownum = document.getElementById("rownum").value;
	rownum = rownum.substr(0,rownum.lastIndexOf(index2))+index;
	var bool = false;
	if(xmlObject.responseText=="false" && index!=index2){
		alert("已存在当前序号,请重新填写！");
		document.getElementById("index_x").focus();
		return;
	}else{
		bool=true;
	}
	if(bool){
		document.getElementById("rownum").value=rownum;
		document.form1.action="leftupdate.do";
		document.form1.submit();
	}
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<% if(bean.getRownum()!=null && bean.getRownum().split("\\.").length<3){  %>
<div class="bmgl_div">
	<div class="yhgl_div">
		<a style="margin: 0 0 0 20px;" href="leftinsertselect.do?parentid=<%=bean.getId() %>" >添加下级菜单</a>
	</div>
</div>
<%} %>
<div class="bmgl_div">
<form method="post" action="" name="form1">
	<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
		<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
    		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">数据编辑</div></td>
		</tr>
			<input type="hidden" name="id" value="<%=bean.getId()%>" />
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">菜单名称:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" <%if(bean.getId()!=null && bean.getId().equals("0")){out.print("disabled");} %> value="<%=bean.getName() %>" /></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">菜单顺序:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="index_x" id="index_x" <%if(bean.getId()!=null && bean.getId().equals("0")){out.print("disabled");} %> value="<%=request.getAttribute("index")!=null?request.getAttribute("index"):bean.getRownum()%>" />请输入0-99以内的数字
				<input type="hidden" name="rownum" id="rownum" value="<%=bean.getRownum() %>" />
			</td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">链接地址:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="url" <%if(bean.getId()!=null && bean.getId().equals("0")){out.print("disabled");} %> value="<%=bean.getUrl() %>" /></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">链接方式:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<select name="target" style="width:80px;" <%if(bean.getId()!=null && bean.getId().equals("0")){out.print("disabled");} %>>
				<option value="rightFrame" <%if(bean.getTarget().equals("rightFrame")){%>selected="selected"<%}%>>right</option>
				<option value="_blank" <%if(bean.getTarget().equals("_blank")){%>selected="selected"<%}%>>blank</option>
				</select>
			</td>
		</tr>
  </table>
</form>
</div>
<p align="center"> 
  <a href="#"  onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
  <a href="#"  onclick="javascript:history.go(-1)"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>

</body>
</html>

