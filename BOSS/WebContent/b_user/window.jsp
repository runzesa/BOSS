<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>医生用户管理</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">医生用户管理</a></h1>
	<div id="opendiv">当前位置：医生用户管理</div> 
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
				<option value="name">用户名</option><option value="id_card_no">身份证号</option><option value="phone_no">电话</option><option value="account">账号</option><option value="password">密码</option><option value="old_password">曾用密码</option><option value="role">角色</option><option value="sex">性别</option><option value="job_title">职称</option><option value="hospital">所在医院</option><option value="department">科室</option><option value="society">所属学会</option><option value="section">学科</option><option value="liaisons">医学联络员</option><option value="point">积分</option><option value="credit">学分</option><option value="register_time">注册时间</option><option value="modify_time">修改时间</option><option value="email">email</option><option value="birthday">生日</option><option value="college">毕业院校</option><option value="is_identify">认证情况</option><option value="status">状态</option><option value="area">地区</option>
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
			<th><a href="#" onclick="sort('name')">用户名<span id="namesort" /></a></th>
			<th><a href="#" onclick="sort('id_card_no')">身份证号<span id="id_card_nosort" /></a></th>
			<th><a href="#" onclick="sort('phone_no')">电话<span id="phone_nosort" /></a></th>
			<th><a href="#" onclick="sort('account')">账号<span id="accountsort" /></a></th>
			<th>密码<span id="passwordsort" /></th>
			<th>曾用密码<span id="old_passwordsort" /></th>
			<th><a href="#" onclick="sort('role')">角色<span id="rolesort" /></a></th>
			<th><a href="#" onclick="sort('sex')">性别<span id="sexsort" /></a></th>
			<th><a href="#" onclick="sort('job_title')">职称<span id="job_titlesort" /></a></th>
			<th><a href="#" onclick="sort('hospital')">所在医院<span id="hospitalsort" /></a></th>
			<th><a href="#" onclick="sort('department')">科室<span id="departmentsort" /></a></th>
			<th><a href="#" onclick="sort('society')">所属学会<span id="societysort" /></a></th>
			<th><a href="#" onclick="sort('section')">学科<span id="sectionsort" /></a></th>
			<th><a href="#" onclick="sort('liaisons')">医学联络员<span id="liaisonssort" /></a></th>
			<th><a href="#" onclick="sort('point')">积分<span id="pointsort" /></a></th>
			<th><a href="#" onclick="sort('credit')">学分<span id="creditsort" /></a></th>
			<th><a href="#" onclick="sort('register_time')">注册时间<span id="register_timesort" /></a></th>
			<th><a href="#" onclick="sort('modify_time')">修改时间<span id="modify_timesort" /></a></th>
			<th>email<span id="emailsort" /></th>
			<th><a href="#" onclick="sort('birthday')">生日<span id="birthdaysort" /></a></th>
			<th><a href="#" onclick="sort('college')">毕业院校<span id="collegesort" /></a></th>
			<th><a href="#" onclick="sort('is_identify')">认证情况<span id="is_identifysort" /></a></th>
			<th>状态<span id="statussort" /></th>
			<th><a href="#" onclick="sort('area')">地区<span id="areasort" /></a></th>

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

