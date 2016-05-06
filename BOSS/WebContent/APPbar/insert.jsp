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
		<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">App栏目管理</a></h1>
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
	<form name="APPbarform" action="">
		<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="0">
			<input type="hidden" id="id" />	<tr>
		<td  class="insert_td_bg"><div align="right">资源ID：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="resource_id"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">栏目图片：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="hidden" id="img_url" name="img_url" /><input type="button" value="上传文件" onclick="openwindow('../util/upload.jsp?nameinput=img_urlshow&valueinput=img_url','fileupload','428','246')"></input><span id="img_urlshow"></span>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">目标跳转类型：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="dest_type" name="dest_type">
	<option value="1">测试数据1</option>
	<option value="2">测试数据2</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">跳转地址：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="reource_param"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">显示排序：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="resource_order"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">正常使用：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="is_delete" name="is_delete">
	<option value="0">否</option>
	<option value="1">正常</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">系统类型：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="show_type" name="show_type">
	<option value="1">APP</option>
	<option value="2">PC</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">栏目名称：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="resource_name"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">展示位置：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="show_position" name="show_position">
	<option value="1">首页轮播主图</option>
	<option value="2">首页HIM医生推荐</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">资源类型：</div></td>
		<td align="left">&nbsp;&nbsp;<select id="resource_type" name="resource_type">
	<option value="1">医生</option>
	<option value="2">资料</option>
	<option value="3">话题</option>
	<option value="4">病例</option>
	<option value="5">外部推广网站</option>
	</select>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">创建时间：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="crreate_time" id="crreate_time"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="crreate_timedate" /></span>
<script type="text/javascript">
	Calendar.setup({
		inputField     :    "crreate_time",
		ifFormat       :    "%Y-%m-%d %H:%M:00",
		showsTime      :    true,
		button         :    "crreate_timedate",
		singleClick    :    false,
		step           :    1
 	});
</script>
&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">创建人：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="create_user"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td  class="insert_td_bg"><div align="right">修改时间：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" name="modify_time" id="modify_time"  notNull="true" fieldMaxLength="200" fieldStyle="datetime"/><span><img src="../images/icon/data.png" id="modify_timedate" /></span>
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
		<td  class="insert_td_bg"><div align="right">修改人：</div></td>
		<td align="left">&nbsp;&nbsp;<input type="text" id="modify_user"  notNull="true" fieldMaxLength="200"/>&nbsp;&nbsp;</td>
	</tr>

		</table>
	</form>
</div></div>
</body>
</html>

