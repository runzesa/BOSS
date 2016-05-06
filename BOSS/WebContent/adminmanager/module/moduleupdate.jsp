<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.module.actionbean.*"%>
<%
	ModuleUpdateActionBean bean = (ModuleUpdateActionBean) request.getAttribute("module");
	
	ModuleDataAUpdateActionBean bean2 = (ModuleDataAUpdateActionBean) request.getAttribute("dataA");
	String showtype = "";
	String fields2 = "";
	String fields = "";
	String fieldsAll = "";
	String dataid = "";
	String rows = "";
	if(bean2!=null){
		showtype = bean2.getShowtype();
		dataid = bean2.getId();
		fields2 = bean2.getFields2();
		fields = bean2.getFields();
		fieldsAll = bean2.getFieldsAll();
		rows = bean2.getRow();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>数据编辑</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<%@include file="../../jspheader/jquery_header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="moduleupdate.js"></script>
<script language="JavaScript">

</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="pageLoad('<%=bean2!=null?bean2.getFields2():""%>');">
<div class="bmgl_div">
<form method="post" action="moduleupdate.do" name="form1" >
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="24" colspan="11" bgcolor="#DFEBF0">
			<div align="center">数据编辑</div>
			
			<input type="hidden" name="id" value="<%=bean.getId() %>"/>
			<input type="hidden" name="dataid" value="<%=dataid %>"/>
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" id="name" value="<%=bean.getName() %>" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块地址:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="link" id="link" value="<%=bean.getLink() %>" onkeydown="changeModel();" onkeyup="changeModel2()"/></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">是否可见:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="is_open" id="is_open">
			<%String isopen = bean.getIs_open();%>
			<option value="0" <%=isopen==null || isopen.equals("null") || isopen.equals("0")?"selected":"" %>>是</option>
			<option value="1" <%=isopen!=null && isopen.equals("1")?"selected":"" %>>否</option>
		</select>
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">设置为门户模块:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="portal" id="portal" onchange="getPortalOptions()">
			<option value="0" <%=bean.getPortal()!=null && bean.getPortal().equals("0")?"selected":"" %>>是</option>
			<option value="1" <%=bean.getPortal()==null || bean.getPortal().equals("1")?"selected":"" %>>否</option>
		</select></td>
	</tr>

	<!----------------------------------- s t a r t ------------------------------------------>
	
	<tr id="tr0" style="display:none">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块类型:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype" value="1" onclick="data()" <%=showtype==null||showtype.equals("")||showtype.equals("1")?"checked=checked":"" %>/>数据
			<input type="radio" name="showtype" value="2" onclick="chart()" <%=showtype!=null&&showtype.startsWith("2")?"checked=checked":"" %>/>图表
			<input type="radio" name="showtype" value="3" onclick="page()"  <%=showtype!=null&&showtype.equals("3")?"checked=checked":"" %>/>页面
		</td>
	</tr>
	<tr id="tr1" style="display:<%=showtype!=null&&showtype.startsWith("2")?"":"none" %>">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">图表类型:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype2" value="1" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("1")?"checked=checked":"" %>/>饼图
			<input type="radio" name="showtype2" value="2" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("2")?"checked=checked":"" %>/>柱形图
			<input type="radio" name="showtype2" value="3" onclick="changeChart(this.value)" <%=showtype!=null&&showtype.split("-").length>1&&showtype.split("-")[1].equals("3")?"checked=checked":"" %>/>折线图
		</td>
	</tr>
	<tr id="tr2" style="display:<%=showtype!=null&&showtype.equals("3")?"none":"" %>">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">显示行数:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select id="rows" name="rows">
				<option value="4" <%=rows!=null && rows.equals("4")?"selected":"" %>>4</option>
				<option value="5" <%=rows==null || rows.equals("") || rows.equals("null") || rows.equals("5")?"selected":"" %>>5</option>
				<option value="6" <%=rows!=null && rows.equals("6")?"selected":"" %>>6</option>
				<option value="7" <%=rows!=null && rows.equals("7")?"selected":"" %>>7</option>
				<option value="8" <%=rows!=null && rows.equals("8")?"selected":"" %>>8</option>
			</select>行
		</td>
	</tr>
	<tr id="tr3" style="display:<%=showtype!=null&&showtype.startsWith("3")?"none":"" %>">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">模块字段:&nbsp;</div>
			<input type="hidden" name="field" id="field"/>
		</td>
		<td bgcolor="#FFFFFF" id="fields"><%=fields %></td>
		<td id="fieldshiden" style="display: none;"><%=fieldsAll %></td>
	</tr>
	<tr id="tr4" style="display:<%=showtype!=null&&showtype.startsWith("3")?"":"none" %>">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">链接对应地址:&nbsp;</div>
		</td>
		<td bgcolor="#FFFFFF">
			&nbsp;<input type="text" id="urlx2" name="urlx2" style="width:350px" value="<%=showtype!=null&&showtype.equals("3")?fields2:"" %>"/>
		</td>
	</tr>
	
	<!------------------------------------- e n d ------------------------------------------>
</table>
</form>
</div>
<p align="center"> 
  <a href="#"  onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
  <a href="#" onclick="history.go(-1);return false;"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>

</html>

