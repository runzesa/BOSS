<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>�������</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool.js"></script>
<script type="text/javascript" src="insert.js"></script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="datainsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
    <td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">����¼��</div></td>
  </tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">����:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" id="name" name="name"/></td>
	</tr>
	<tr id="moudlename">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">ģ������:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="modelname2" value="" disabled="disabled"/>
		<input type="hidden" name="modelname" id="modelname"/>
		<input type=button value="ѡ��" 
		onclick="window.open('../module/moduletree.jsp?formname=form1&nameinput=modelname2&idinput=modelname','moduletree','scrollbars=yes,status=yes,width=350,height=500'); "/></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">ģ������:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype" value="1" onclick="data()" checked="checked"/>����
			<input type="radio" name="showtype" value="2" onclick="chart()"/>ͼ��
			<input type="radio" name="showtype" value="3" onclick="page()"/>ҳ��
		</td>
	</tr>
	<tr id=chart style="display:none">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">ͼ������:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;
			<input type="radio" name="showtype2" value="1" checked="checked" onclick="changeChart(this.value)"/>��ͼ
			<input type="radio" name="showtype2" value="2" onclick="changeChart(this.value)"/>����ͼ
			<input type="radio" name="showtype2" value="3" onclick="changeChart(this.value)"/>����ͼ
		</td>
	</tr>
	<tr id="row">
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">��ʾ����:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select id=rows name=rows>
			<option value=5>4</option>
			<option value=5>5</option>
			<option value=6>6</option>
			<option value=7>7</option>
			<option value=8>8</option>
	</select>��
		</td>
	</tr>
	<tr id="fieldtr">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">ģ���ֶ�:&nbsp;</div>
			<input type="hidden" name="field" id="field"/>
			<input type="hidden" name="tabid" id="tabid" value="<%=request.getParameter("tabid") %>"/>
		</td>
		<td bgcolor="#FFFFFF" id="fields">
		</td>
		<td id="fieldshiden" style="display: none;"></td>
	</tr>
	<tr id="urltd" style="display:none">
		<td width="150" height="25" bgcolor="#FFFFFF">
			<div align="right">ҳ���ַ:&nbsp;</div>
		</td>
		<td bgcolor="#FFFFFF">
			&nbsp;<input type="text" id="urlx" name="urlx" style="width:350px"/>
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

