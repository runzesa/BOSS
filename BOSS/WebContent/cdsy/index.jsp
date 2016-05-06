<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>传道授业</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">传道授业</a></h1>
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
				<option value="title">标题</option><option value="user_id">作者</option><option value="type">资料类型</option><option value="department">学科</option><option value="operate_state">操作状态</option><option value="open_state">公开状态</option><option value="score">分数</option><option value="academic">学术学分</option><option value="apply_state">学分申请状态</option><option value="create_user">发布人</option><option value="create_time">发布时间</option><option value="audior_name">联合作者</option><option value="source">来源</option><option value="key_word">关键字</option><option value="ucg">UCG类型</option>
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
							<th><input type="checkbox" onclick="CheckAll()" name="chkall" />选择</th>
			<th>标题<span id="titlesort" /></th>
			<th><a href="#" onclick="sort('user_id')">作者<span id="user_idsort" /></a></th>
			<th><a href="#" onclick="sort('type')">资料类型<span id="typesort" /></a></th>
			<th><a href="#" onclick="sort('department')">学科<span id="departmentsort" /></a></th>
			<th><a href="#" onclick="sort('operate_state')">操作状态<span id="operate_statesort" /></a></th>
			<th><a href="#" onclick="sort('open_state')">公开状态<span id="open_statesort" /></a></th>
			<th><a href="#" onclick="sort('score')">分数<span id="scoresort" /></a></th>
			<th><a href="#" onclick="sort('academic')">学术学分<span id="academicsort" /></a></th>
			<th><a href="#" onclick="sort('apply_state')">学分申请状态<span id="apply_statesort" /></a></th>
			<th><a href="#" onclick="sort('create_user')">发布人<span id="create_usersort" /></a></th>
			<th><a href="#" onclick="sort('create_time')">发布时间<span id="create_timesort" /></a></th>
			<th><a href="#" onclick="sort('audior_name')">联合作者<span id="audior_namesort" /></a></th>
			<th><a href="#" onclick="sort('source')">来源<span id="sourcesort" /></a></th>
			<th><a href="#" onclick="sort('key_word')">关键字<span id="key_wordsort" /></a></th>
			<th><a href="#" onclick="sort('ucg')">UCG类型<span id="ucgsort" /></a></th>

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

