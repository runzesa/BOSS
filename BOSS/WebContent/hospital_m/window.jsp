<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医院管理</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">医院管理</a></h1>
	<div id="opendiv">当前位置：医院管理</div> 
	<div class="right_date_top_nav">
	<ul>
	<!--	<li style="display:block;" class="pager"><a href="#" target="_self">分页</a></li>		-->
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	</div>
	<div style="display: block;" class="search_div">
		<div id="select_boxstyle">
			<select name="searchfield" id="searchfield">
				<option value="name">名称</option><option value="alias">别名</option><option value="address">地址</option><option value="level">等级</option><option value="phone">联系方式</option>
			</select>
		</div>
		<div class="input_boxstyle">
			<input id="searchvalue" name="searchvalue" type="text" onfocus="setday(this)" />
		</div>
		<div class="search">
		<span class="pic"></span>
		<a href="#" title="查询" class="info" onclick="searchSelect1()"></a></div>
		<div class="search_ad" onclick="show();"><a href="#" title="高级查询"></a>
			<div id="show">
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
							<th><input type="checkbox" onclick="CheckAll()" name="chkall" />id</th>
			<th><a href="#" onclick="sort('name')">名称<span id="namesort" /></a></th>
			<th><a href="#" onclick="sort('alias')">别名<span id="aliassort" /></a></th>
			<th><a href="#" onclick="sort('address')">地址<span id="addresssort" /></a></th>
			<th><a href="#" onclick="sort('level')">等级<span id="levelsort" /></a></th>
			<th><a href="#" onclick="sort('phone')">联系方式<span id="phonesort" /></a></th>

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

