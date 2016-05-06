<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>菜单管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%@include file="../../jspheader/jquery_header.jsp" %>
	<link href="../css/style.css" rel=stylesheet type=text/css />
	<script src="index.js"></script>
	<script type="text/javascript" src="../../js/jquery.jstree.js"></script>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle2.css"/>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle.css"/>
	<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
	<script language="JavaScript">
	</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="loadTree()">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
		<li class="new"><a href="#" id="add2" onclick="newleft()">新增下级菜单</a></li>
		<li class="del"><a href="#" onclick="del()">删除</a></li>
	</ul>
</div>
</div>
<form method="post" action="leftdelete.do" name="form1">
</form>
<div class="cdgl_div">
<table width="100%" >
<tr>
	<td width="300px" valign="top">
		<div class="bmgl_left" id="tree">
		</div>
	</td>
	<td valign="top">
		<form method="post" action="" name="form2">
			<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
				<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
					<td height="24" colspan="11" bgcolor="#DFEBF0">
						<div align="center">数据录入</div>
						<input type="hidden" name="id" id="id" value="" />
					</td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr0">
					<td colspan="2" height="25" align="center">请先选择菜单！</td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr1" style="display:none">
					<td width="110" height="25"><div align="right">父节点:&nbsp;</div></td>
					<td id="parentName">&nbsp;</td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr2" style="display:none">
					<td height="25" width="110"><div align="right">菜单名称:&nbsp;</div></td>
					<td>&nbsp;<input type="text" name="name" id="name" />
					<input type="hidden" name="parent" id="parent" value="" /></td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr3" style="display:none">
					<td height="25"><div align="right">菜单顺序:&nbsp;</div></td>
					<td>&nbsp;<input type="text" name="index_x" id="index_x" value=""/>
					请输入0-99以内的数字
						<input type="hidden" name="rownum" id="rownum" value=""/>
					</td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr4" style="display:none">
					<td height="25"><div align="right">链接地址:&nbsp;</div></td>
					<td>&nbsp;<input type="text" name="urlName" id="urlName" disabled="disabled" />
					<input type=button value="选择"  id="sel"
						onclick="window.open('../module2/module2tree.jsp?formname=form2&nameinput=urlName&idinput=url','','scrollbars=yes,status=yes,width=350,height=500'); "/>
					<input type="hidden" name="url" id="url" />
					</td>
				</tr>
				<tr bgcolor="#FFFFFF" id="tr5" style="display:none">
					<td height="25"><div align="right">链接方式:&nbsp;</div></td>
					<td>&nbsp;<select name="target" id="target">
							<option value="rightFrame">right</option>
							<option value="_blank">blank</option>
						</select>
					</td>
				</tr>
			</table>
		</form>

		<p align="center" id="bottom" style="display:none">
			<a href="javascript:void(0)" onclick="sub()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
		</p>
	</td>
</tr>
</table>
</div>
</body>
</html>

