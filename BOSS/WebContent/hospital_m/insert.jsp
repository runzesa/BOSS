<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
<%@include file="../jspheader/insert_header.jsp" %>

<script src="insert.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var actiontype="<%=request.getParameter("actiontype")%>";
var id="<%=request.getParameter("id")%>";

var url = "<%=request.getQueryString()%>";
url = decodeURI(url);
-->
</script>

</head>
<body class="right_date_body" onload="pageLoad()">
<div id="message_box"></div>
<div class="right_date_top">
    <div>
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">医院管理</a></h1>
    	<div id="opendiv">当前位置：</div>
		<div class="right_date_top_nav">
			<ul>
			<li style="display: block;" class="new"><a id="new" href="javascript:newData()">新增</a></li>
			<li style="display: block;" class="edit"><a id="update" href="javascript:editData()">编辑</a></li>
			<li style="display: block;" class="del"><a id="delete" href="javascript:messageBox.confirm('您真的要删除数据吗?',deleteData)">删除</a></li>
			<li style="display: block;" class="undo"><a id="undo" href="javascript:undo()">撤销</a></li>
			<li style="display: block;" class="save"><a id="save" href="javascript:saveData()">保存</a></li>   
			<li style="display: block;" class="export"><a id="export" href="#">导出</a>
				<ul>
					<li class="print"><a href="javascript:insertPrint()">打印预览</a></li>
				</ul>
			</li>
			<li style="display: block;" class="back"><a id="back" href="javascript:finalResult()" target="_self">返回</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="right_insert">
<div>
	<form name="hospital_mform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">名称：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="name"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">别名：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="alias"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">介绍：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="content"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">地址：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="address"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">省：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="province"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">市：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="city"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">等级：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="level"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">联系电话：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="phone"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

