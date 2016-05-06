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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">传道授业</a></h1>
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
	<form name="cdsyform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">作者：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="user_id" name="user_id">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">操作状态：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="operate_state" name="operate_state">
	<option value="3">已发布</option>
	<option value="2">待发布</option>
	<option value="1">草稿</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">公开状态：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="open_state" name="open_state">
	<option value="1">公开</option>
	<option value="0">未公开</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">分数：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="score"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">类型：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="type" name="type">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">学术学分：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="academic"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">创建人：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="create_user"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">修改时间：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="modify_time"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">修改人：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="modify_user"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">学科：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="department" name="department">
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">标题：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="title"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">联合作者：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="audior_name"  notNull="true" fieldMaxLength="50"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">创建时间：</div></td>
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
		<td  class="insert_td_bg"><div align="right">来源：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="source"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">摘要：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="info"  notNull="true" fieldMaxLength="2000"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">关键字：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="key_word"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">内容：</div></td>
		<td align="left">&nbsp;&nbsp;
<textarea id="content" name="content" ></textarea>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">图片显示：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="img_url" name="img_url" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=img_urlshow&valueinput=img_url','fileupload','428','246')"></input><span id="img_urlshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">UCG类型：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="ucg" name="ucg">
	<option value="1">用户原创</option>
	<option value="2">平台发布</option>
	<option value="3">外网转载</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">学分申请状态：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="apply_state" name="apply_state">
	<option value="0">未申请</option>
	<option value="1">审核中</option>
	<option value="2">已申请</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">RANK分类：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="rank_type" name="rank_type">
	<option value="1">传道</option>
	<option value="2">授业</option>
	<option value="3">解惑</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">封面图片：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="cover_img" name="cover_img" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=cover_imgshow&valueinput=cover_img','fileupload','428','246')"></input><span id="cover_imgshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">附件：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="attachment_id" name="attachment_id" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=attachment_idshow&valueinput=attachment_id','fileupload','428','246')"></input><span id="attachment_idshow"></span>&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

