<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>���ݱ༭</title>
<%@include file="../jspheader/insert_header.jsp" %>
<link rel="stylesheet" type="text/css" media="all"
href="../css/aqua/theme.css" title="theme" />
<script type="text/javascript" src="../css/calendar.js"></script>
<script type="text/javascript" src="../css/calendar-cn.js"></script>
<script type="text/javascript" src="../css/calendar-setup.js"></script>

<script src="insert.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var actiontype="<%=request.getParameter("actiontype")%>";
var ID="<%=request.getParameter("ID")%>";

var url = "<%=request.getQueryString()%>";
url = decodeURI(url);
-->
</script>

</head>
<body class="right_date_body" onload="pageLoad()">
<div id="message_box"></div>
<div class="right_date_top">
    <div>
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">��������</a></h1>
    	<div id="opendiv">��ǰλ�ã�</div>
		<div class="right_date_top_nav">
			<ul>
			<li style="display: none;" class="new"><a id="new" href="javascript:newData()">����</a></li>
			<li style="display: block;" class="edit"><a id="update" href="javascript:editData()">�༭</a></li>
			<li style="display: none;" class="del"><a id="delete" href="javascript:messageBox.confirm('�����Ҫɾ��������?',deleteData)">ɾ��</a></li>
			<li style="display: block;" class="undo"><a id="undo" href="javascript:undo()">����</a></li>
			<li style="display: block;" class="save"><a id="save" href="javascript:saveData()">����</a></li>   
			<li style="display: block;" class="export"><a id="export" href="#">����</a>
				<ul>
					<li class="print"><a href="javascript:insertPrint()">��ӡԤ��</a></li>
				</ul>
			</li>
			<li style="display: block;" class="back"><a id="back" href="javascript:finalResult()" target="_self">����</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="right_insert">
<div>
	<form name="medical_rform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="ID" />	<tr>
		<td  class="insert_td_bg"><div align="right">������</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="NAME"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�Ա�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="SEX" name="SEX">
	<option value="1">��</option>
	<option value="2">Ů</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���䣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="AGE"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�������ƣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="DISEASE"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">֢״������</div></td>
		<td align="left">&nbsp;&nbsp;<textarea id="DISCRIBE" cols=100 rows=10 notNull="true"></textarea>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ͼƬ��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="case_imgs" name="case_imgs" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=case_imgsshow&valueinput=case_imgs','fileupload','428','246')"></input><span id="case_imgsshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�ֿƣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="SECTION"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�����ˣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="CREATE_USER_ID"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ʱ�䣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="CREATE_TIME" id="CREATE_TIME"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="CREATE_TIMEdate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "CREATE_TIME",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "CREATE_TIMEdate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��ת״̬��</div></td>
		<td align="left">&nbsp;&nbsp;<select id="STATE" name="STATE">
	<option value="1"> ���ύ</option>
	<option value="2">��ת��</option>
	<option value="3">������</option>
	<option value="4">�ѽ��</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ҽ����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="RECIEVE_USER_ID"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���ʱ�䣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="SOLVE_TIME" id="SOLVE_TIME"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="SOLVE_TIMEdate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "SOLVE_TIME",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "SOLVE_TIMEdate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��Ͻ����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="SOLVE_CONTENT"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">Խ����</div></td>
		<td align="left">&nbsp;&nbsp;<select id="is_jump_ask" name="is_jump_ask">
	<option value="0">��</option>
	<option value="1">��</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

