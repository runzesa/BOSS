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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">ҽѧ����Ա����</a></h1>
    	<div id="opendiv">��ǰλ�ã�</div>
		<div class="right_date_top_nav">
			<ul>
			<li style="display: block;" class="new"><a id="new" href="javascript:newData()">����</a></li>
			<li style="display: block;" class="edit"><a id="update" href="javascript:editData()">�༭</a></li>
			<li style="display: block;" class="del"><a id="delete" href="javascript:messageBox.confirm('�����Ҫɾ��������?',deleteData)">ɾ��</a></li>
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
	<form name="contactform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">�˺ţ���</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="account"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��������</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="name"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">email����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="email"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�绰����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="phone_no"  fieldMaxLength="30"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���룺��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="password"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�������룺��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="old_password"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ͷ�񣺣�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="head_img" name="head_img" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=head_imgshow&valueinput=head_img','fileupload','428','246')"></input><span id="head_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�Ա𣺣�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="sex" name="sex">
	<option value="0">δ֪</option>
	<option value="1">��</option>
	<option value="2">Ů</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���֤ͼ�񣺣�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="idcard_img" name="idcard_img" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=idcard_imgshow&valueinput=idcard_img','fileupload','428','246')"></input><span id="idcard_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���֤�ţ���</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="id_card_no"  fieldMaxLength="20"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���գ���</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="birthday" id="birthday"  fieldMaxLength="200" fieldStyle="date"/><span><img src="../images/icon/data.png" id="birthdaydate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "birthday",
		ifFormat       :    "%Y-%m-%d",
		button         :    "birthdaydate",
		singleClick    :    false
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��ɫ����</div></td>
		<td align="left">&nbsp;&nbsp;<select id="role" name="role">
	<option value="9">��ר��</option>
	<option value="3">ҽѧ��ʦ</option>
	<option value="5">ҽѧ����Ա</option>
	<option value="6">ȫ��ҽ��</option>
	<option value="2">��֤ҽ��</option>
	<option value="1">δ��֤ҽ��</option>
	<option value="0">��ͨ�û�</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ע��ʱ�䣺��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="register_time" id="register_time"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="register_timedate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "register_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "register_timedate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��֤�������</div></td>
		<td align="left">&nbsp;&nbsp;<select id="is_identify" name="is_identify">
	<option value="0">��</option>
	<option value="1">�����</option>
	<option value="2">����֤</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">״̬��</div></td>
		<td align="left">&nbsp;&nbsp;<select id="status" name="status">
	<option value="0">����</option>
	<option value="-1">��ɾ��</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�޸�ʱ�䣺��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="modify_time" id="modify_time"  fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="modify_timedate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "modify_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "modify_timedate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ֵ����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="point"  notNull="true" fieldMaxLength="200" fieldStyle="float"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ѧ��ֵ����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="credit"  notNull="true" fieldMaxLength="10" fieldStyle="float"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��֤ͼƬ����</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="cert_img" name="cert_img" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=cert_imgshow&valueinput=cert_img','fileupload','428','246')"></input><span id="cert_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��������</div></td>
		<td align="left">&nbsp;&nbsp;<select id="area" name="area">
	</select>
&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

