<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PC栏目管理</title>
<%@include file="../jspheader/index_header.jsp" %>
<script src="index.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var url="<%=request.getQueryString()%>";

-->
</script>
</head>

<body class="right_date_body" onload="pageLoad()">
<div id="message_box"></div>
<div class="right_date_top">
<div>
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">PC栏目管理</a></h1>
	<div id="opendiv">当前位置：</div> 
	<div class="right_date_top_nav">
	<ul>
		<li style="display:block;" class="new"><a href="javascript:insertNewLink()" target="_self">新增</a></li>
		<li style="display:block;" class="del"><a href="javascript:isDelete('form1')" target="_self">删除</a></li>
	<!--	<li style="display:block;" class="pager"><a href="#" target="_self">分页</a></li>		-->
		<li style="display:block;" class="export"><a href="#">导出</a>
			<ul>
			<li class="print"><a href="javascript:Print()">打印</a></li>
			<li class="excel"><a href="javascript:exportReport('excel')">导出到Excel</a></li>
			<li class="word"><a href="javascript:exportReport('word')">导出到Word</a></li>
			<li class="pdf"><a href="javascript:exportReport('pdf')">导出到PDF</a></li>
			</ul>
		</li>
		<li style="display:block;" class="back"><a href="javascript:goBack()" target="_self">返回</a></li>
	</ul>
	</div>
	<div style="display: block;" class="search_div">
		<div id="select_boxstyle">
			<select name="searchfield" id="searchfield">
				
			</select>
		</div>
		<div class="input_boxstyle">
			<input id="searchvalue" name="searchvalue" type="text" onfocus="setday(this)" />
		</div>
		<div class="search">
			<span class="pic"></span>
			<a href="#" title="查询" class="info" onclick="searchSelect1()"></a></div>
			<div class="search_ad" onclick="show();"><a href="#" title="高级查询"></a>
				<div id="show" style="width:0;">
					<ul>
					<li class="adcx"><a href="#" onclick="openAdsearch()">高级查询</a></li>
					<li class="fhcx"><a href="#" onclick="openMixsearch()">复合查询</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="loading" id="loading">
	<div class="loading_indicator"><img
			src="../images/icon/icon_loading.gif" width="16" height="16"/><span
			id="loading_msg">数据加载中，Loading...</span></div>
	</div>
	
<div id="right_date" class="right_date">
<div>
	<form method="post" action="" name="form1" id="form1">
	<table  width="100%" border="0" cellpadding="0" cellspacing="0" id="listtable">
		<thead>
			<tr>
							<th>id</th>
			<th>资源ID</th>
			<th>栏目图片</th>
			<th>跳转目标类型</th>
			<th>跳转地址</th>
			<th>显示顺序</th>
			<th>是否使用</th>
			<th>系统类型</th>
			<th>栏目名称</th>
			<th>展示位置</th>
			<th>资源类型</th>
			<th>创建时间</th>
			<th>创建人</th>
			<th>修改时间</th>
			<th>修改人</th>

			</tr>
		</thead>
		<tbody id="selectdata"></tbody>
	</table>
	</form>
</div>
</div>

<div class="right_date_bottom">
	<div style="float:right;rpadding:0 0 8 0;width:75px;" id="pagergo">
		<input id="pageGoNo" name="pageGoNo" type="text" style="width:20px;margin:3 0 0 0"
			onfocus="hilite(this);" onblur="delite(this);" />&nbsp;&nbsp;
		<a href="#" onclick="pageGoTo()"><img src="../images/icon/go1.gif" style="margin:-3px;" title="跳转" /></a>
	</div>
	<div class="pagebar" id="pageBar" align="right" style="float:right;"></div>
</div>
</body>
</html>

