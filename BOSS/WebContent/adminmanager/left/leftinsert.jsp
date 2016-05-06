<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据添加</title>
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
	if(xmlObject.responseText=="false"){
		alert("已存在当前序号,请重新填写！");
		document.getElementById("index_x").focus();
		return;
	}else{
		bool=true;
	}
	if(bool){
		document.getElementById("rownum").value=rownum;
		document.form1.action="leftinsert.do";
		document.form1.submit();
	}
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
	<div class="bmgl_div">
		<form method="post" action="" name="form1">
			<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
				<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
					<td height="24" colspan="11" bgcolor="#DFEBF0">
					<div align="center">数据录入</div>
					</td>
				</tr>
				<tr>
					<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">您选择的父菜单是:&nbsp;</div></td>
					<td bgcolor="#FFFFFF">&nbsp;<%=request.getAttribute("parentName") %></td>
				</tr>
				<tr>
					<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">菜单名称:&nbsp;</div></td>
					<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" />
					<input type="hidden" name="parent" value="<%=request.getAttribute("parentId") %>" /></td>
				</tr>
				<tr>
					<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">菜单顺序:&nbsp;</div></td>
					<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="index_x" id="index_x" value="<%=request.getAttribute("index") %>"/>请输入0-99以内的数字
						<input type="hidden" name="rownum" id="rownum" value="<%=request.getAttribute("rownum") %>"/>
					</td>
				</tr>
				<tr>
					<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">链接地址:&nbsp;</div></td>
					<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">链接方式:&nbsp;</div></td>
					<td bgcolor="#FFFFFF">&nbsp;<select name="target">
							<option value="rightFrame">right</option>
							<option value="_blank">blank</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p align="center">
		<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
		<a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
	</p>
</body>
</html>

