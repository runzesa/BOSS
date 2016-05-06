<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>病历管理</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">病历管理</a></h1>
	<div id="opendiv">当前位置：</div> 
	<div class="right_date_top_nav">
	<ul>
		<li style="display:none;" class="new"><a href="javascript:insertNewLink()" target="_self">新增</a></li>
		<li style="display:none;" class="del"><a href="javascript:isDelete('form1')" target="_self">删除</a></li>
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
				<option value="NAME">姓名</option><option value="SEX">性别</option><option value="AGE">年龄</option><option value="DISEASE">疾病</option><option value="DISCRIBE">疾病描述</option><option value="SECTION">分科</option><option value="CREATE_USER_ID">创建人</option><option value="CREATE_TIME">创建时间</option><option value="STATE">状态</option><option value="RECIEVE_USER_ID">接收医生</option><option value="SOLVE_TIME">解答时间</option><option value="is_jump_ask">越级咨询</option>
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
							<th><input type="checkbox" onclick="CheckAll()" name="chkall" />id</th>
			<th><a href="#" onclick="sort('NAME')">姓名<span id="NAMEsort" /></a></th>
			<th><a href="#" onclick="sort('SEX')">性别<span id="SEXsort" /></a></th>
			<th><a href="#" onclick="sort('AGE')">年龄<span id="AGEsort" /></a></th>
			<th><a href="#" onclick="sort('DISEASE')">疾病<span id="DISEASEsort" /></a></th>
			<th><a href="#" onclick="sort('DISCRIBE')">疾病描述<span id="DISCRIBEsort" /></a></th>
			<th><a href="#" onclick="sort('SECTION')">分科<span id="SECTIONsort" /></a></th>
			<th><a href="#" onclick="sort('CREATE_USER_ID')">创建人<span id="CREATE_USER_IDsort" /></a></th>
			<th><a href="#" onclick="sort('CREATE_TIME')">创建时间<span id="CREATE_TIMEsort" /></a></th>
			<th><a href="#" onclick="sort('STATE')">状态<span id="STATEsort" /></a></th>
			<th><a href="#" onclick="sort('RECIEVE_USER_ID')">接收医生<span id="RECIEVE_USER_IDsort" /></a></th>
			<th><a href="#" onclick="sort('SOLVE_TIME')">解答时间<span id="SOLVE_TIMEsort" /></a></th>
			<th><a href="#" onclick="sort('is_jump_ask')">越级咨询<span id="is_jump_asksort" /></a></th>

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

