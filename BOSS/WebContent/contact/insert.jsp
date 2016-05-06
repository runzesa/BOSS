<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">医学联络员管理</a></h1>
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
	<form name="contactform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">账号：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="account"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">姓名：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="name"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">email：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="email"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">电话：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="phone_no"  fieldMaxLength="30"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">密码：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="password"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">曾用密码：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="old_password"  fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">头像：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="head_img" name="head_img" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=head_imgshow&valueinput=head_img','fileupload','428','246')"></input><span id="head_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">性别：：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="sex" name="sex">
	<option value="0">未知</option>
	<option value="1">男</option>
	<option value="2">女</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">身份证图像：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="idcard_img" name="idcard_img" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=idcard_imgshow&valueinput=idcard_img','fileupload','428','246')"></input><span id="idcard_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">身份证号：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="id_card_no"  fieldMaxLength="20"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">生日：：</div></td>
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
		<td  class="insert_td_bg"><div align="right">角色：：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="role" name="role">
	<option value="9">大专家</option>
	<option value="3">医学导师</option>
	<option value="5">医学联络员</option>
	<option value="6">全科医生</option>
	<option value="2">认证医生</option>
	<option value="1">未认证医生</option>
	<option value="0">普通用户</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">注册时间：：</div></td>
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
		<td  class="insert_td_bg"><div align="right">认证情况：：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="is_identify" name="is_identify">
	<option value="0">否</option>
	<option value="1">审核中</option>
	<option value="2">已认证</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">状态：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="status" name="status">
	<option value="0">正常</option>
	<option value="-1">已删除</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">修改时间：：</div></td>
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
		<td  class="insert_td_bg"><div align="right">积分值：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="point"  notNull="true" fieldMaxLength="200" fieldStyle="float"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">学分值：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="credit"  notNull="true" fieldMaxLength="10" fieldStyle="float"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">认证图片：：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="cert_img" name="cert_img" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=cert_imgshow&valueinput=cert_img','fileupload','428','246')"></input><span id="cert_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">地区：：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="area" name="area">
	</select>
&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

