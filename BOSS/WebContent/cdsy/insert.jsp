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
<script type="text/javascript" src="../FCKeditor/fckeditor.js"></script>

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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">������ҵ</a></h1>
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
	<form name="cdsyform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">���ߣ�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="user_id" name="user_id">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����״̬��</div></td>
		<td align="left">&nbsp;&nbsp;<select id="operate_state" name="operate_state">
	<option value="3">�ѷ���</option>
	<option value="2">������</option>
	<option value="1">�ݸ�</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����״̬��</div></td>
		<td align="left">&nbsp;&nbsp;<select id="open_state" name="open_state">
	<option value="1">����</option>
	<option value="0">δ����</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">������</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="score"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���ͣ�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="type" name="type">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ѧ��ѧ�֣�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="academic"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�����ˣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="create_user"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�޸�ʱ�䣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="modify_time"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�޸��ˣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="modify_user"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ѧ�ƣ�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="department" name="department">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���⣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="title"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�������ߣ�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="audior_name"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ʱ�䣺</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="create_time" id="create_time"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="create_timedate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "create_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "create_timedate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">��Դ��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="source"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ժҪ��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="info"  notNull="true" fieldMaxLength="2000"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">�ؼ��֣�</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="key_word"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">���ݣ�</div></td>
		<td align="left">&nbsp;&nbsp;
<textarea id="content" name="content" ></textarea>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ͼƬ��ʾ��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="img_url" name="img_url" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=img_urlshow&valueinput=img_url','fileupload','428','246')"></input><span id="img_urlshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">UCG���ͣ�</div></td>
		<td align="left">&nbsp;&nbsp;<select id="ucg" name="ucg">
	<option value="1">�û�ԭ��</option>
	<option value="2">ƽ̨����</option>
	<option value="3">����ת��</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">ѧ������״̬��</div></td>
		<td align="left">&nbsp;&nbsp;<select id="apply_state" name="apply_state">
	<option value="0">δ����</option>
	<option value="1">�����</option>
	<option value="2">������</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">RANK���ࣺ</div></td>
		<td align="left">&nbsp;&nbsp;<select id="rank_type" name="rank_type">
	<option value="1">����</option>
	<option value="2">��ҵ</option>
	<option value="3">���</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">����ͼƬ��</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="cover_img" name="cover_img" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=cover_imgshow&valueinput=cover_img','fileupload','428','246')"></input><span id="cover_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">������</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="attachment_id" name="attachment_id" /><input type="button" value="�ϴ��ļ�" onclick="openwindow('../util/upload.jsp?nameinput=attachment_idshow&valueinput=attachment_id','fileupload','428','246')"></input><span id="attachment_idshow"></span>&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

