<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<%@include file="../../jspheader/jquery_header.jsp"%>
<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="moduleinsert.js"></script>
<script language="JavaScript">

</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="moduleinsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
                <td height="24" colspan="11" bgcolor="#DFEBF0">
                	<div align="center">数据录入</div>
                </td>
     		</tr>
            <tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" id="name"/></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块地址:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="link" id="link"  onkeydown="changeModel();" onkeyup="changeModel2()"/></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">是否可见:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<select name="is_open" id="is_open">
							<option value="0" selected="selected">是</option>
							<option value="1">否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">设置为门户模块:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<select name="portal" id="portal" onchange="getPortalOptions()">
							<option value="0">是</option>
							<option value="1" selected="selected">否	</option>
					</select>		
				</td>
			</tr>
			
			
			<!---------------------------------- s t a r t --------------------------------------------------->
			
			<tr id="tr0" style="display:none">
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块类型:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;
					<input type="radio" name="showtype" value="1" onclick="data()" checked="checked"/>数据
					<input type="radio" name="showtype" value="2" onclick="chart()"/>图表
					<input type="radio" name="showtype" value="3" onclick="page()"/>页面
				</td>
			</tr>
			<tr id="tr1" style="display:none">
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">图表类型:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;
					<input type="radio" name="showtype2" value="1" checked="checked" onclick="changeChart(this.value)"/>饼图
					<input type="radio" name="showtype2" value="2" onclick="changeChart(this.value)"/>柱形图
					<input type="radio" name="showtype2" value="3" onclick="changeChart(this.value)"/>折线图
				</td>
			</tr>
			<tr id="tr2" style="display:none">
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">显示行数:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<select id=rows name=rows>
						<option value="4">4</option>
						<option value="5" selected="selected">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
					</select>行
				</td>
			</tr>
			<tr id="tr3" style="display:none">
				<td width="150" height="25" bgcolor="#FFFFFF">
					<div align="right">模块字段:&nbsp;</div>
					<input type="hidden" name="field" id="field"/>
				</td>
				<td bgcolor="#FFFFFF" id="fields">
				</td>
				<td id="fieldshiden" style="display: none;"></td>
			</tr>
			
			<tr id="tr4" style="display:none">
				<td width="150" height="25" bgcolor="#FFFFFF">
					<div align="right">链接对应地址:&nbsp;</div>
				</td>
				<td bgcolor="#FFFFFF">
					&nbsp;<input type="text" id="urlx2" name="urlx2" style="width:350px"/>
				</td>
			</tr>
			
			<!----------------------------------- e n d -------------------------------------------------->
			
   		</table>
	</form>
</div>
<p align="center"> 
	<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
	<a href="#" onclick="javascript:history.go(-1);return false;"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>

</html>

