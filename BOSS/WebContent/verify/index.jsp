<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ҽ�����</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">ҽ�����</a></h1>
	<div id="opendiv">��ǰλ�ã�</div> 
	<div class="right_date_top_nav">
	<ul>
		<li style="display:none;" class="new"><a href="javascript:insertNewLink()" target="_self">����</a></li>
		<li style="display:none;" class="del"><a href="javascript:isDelete('form1')" target="_self">ɾ��</a></li>
	<!--	<li style="display:block;" class="pager"><a href="#" target="_self">��ҳ</a></li>		-->
		<li style="display:block;" class="export"><a href="#">����</a>
			<ul>
			<li class="print"><a href="javascript:Print()">��ӡ</a></li>
			<li class="excel"><a href="javascript:exportReport('excel')">������Excel</a></li>
			<li class="word"><a href="javascript:exportReport('word')">������Word</a></li>
			<li class="pdf"><a href="javascript:exportReport('pdf')">������PDF</a></li>
			</ul>
		</li>
		<li style="display:block;" class="back"><a href="javascript:goBack()" target="_self">����</a></li>
	</ul>
	</div>
	<div style="display: block;" class="search_div">
		<div id="select_boxstyle">
			<select name="searchfield" id="searchfield">
				<option value="name">�û���</option><option value="id_card_no">���֤��</option><option value="phone_no">�绰</option><option value="account">�˺�</option><option value="role">��ɫ</option><option value="sex">�Ա�</option><option value="job_title">ְ��</option><option value="hospital">����ҽԺ</option><option value="department">����</option><option value="society">����ѧ��</option><option value="section">ѧ��</option><option value="liaisons">ҽѧ����Ա</option><option value="point">����</option><option value="credit">ѧ��</option><option value="register_time">ע��ʱ��</option><option value="email">email</option><option value="birthday">����</option><option value="college">��ҵԺУ</option><option value="is_identify">��֤���</option><option value="area">����</option>
			</select>
		</div>
		<div class="input_boxstyle">
			<input id="searchvalue" name="searchvalue" type="text" onfocus="setday(this)" />
		</div>
		<div class="search">
			<span class="pic"></span>
			<a href="#" title="��ѯ" class="info" onclick="searchSelect1()"></a></div>
			<div class="search_ad" onclick="show();"><a href="#" title="�߼���ѯ"></a>
				<div id="show" style="width:0;">
					<ul>
					<li class="adcx"><a href="#" onclick="openAdsearch()">�߼���ѯ</a></li>
					<li class="fhcx"><a href="#" onclick="openMixsearch()">���ϲ�ѯ</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="loading" id="loading">
	<div class="loading_indicator"><img
			src="../images/icon/icon_loading.gif" width="16" height="16"/><span
			id="loading_msg">���ݼ����У�Loading...</span></div>
	</div>
	
<div id="right_date" class="right_date">
<div>
	<form method="post" action="" name="form1" id="form1">
	<table  width="100%" border="0" cellpadding="0" cellspacing="0" id="listtable">
		<thead>
			<tr>
							<th><input type="checkbox" onclick="CheckAll()" name="chkall" />id</th>
			<th><a href="#" onclick="sort('name')">�û���<span id="namesort" /></a></th>
			<th><a href="#" onclick="sort('id_card_no')">���֤��<span id="id_card_nosort" /></a></th>
			<th><a href="#" onclick="sort('phone_no')">�绰<span id="phone_nosort" /></a></th>
			<th><a href="#" onclick="sort('account')">�˺�<span id="accountsort" /></a></th>
			<th><a href="#" onclick="sort('role')">��ɫ<span id="rolesort" /></a></th>
			<th><a href="#" onclick="sort('sex')">�Ա�<span id="sexsort" /></a></th>
			<th><a href="#" onclick="sort('job_title')">ְ��<span id="job_titlesort" /></a></th>
			<th><a href="#" onclick="sort('hospital')">����ҽԺ<span id="hospitalsort" /></a></th>
			<th><a href="#" onclick="sort('department')">����<span id="departmentsort" /></a></th>
			<th><a href="#" onclick="sort('society')">����ѧ��<span id="societysort" /></a></th>
			<th><a href="#" onclick="sort('section')">ѧ��<span id="sectionsort" /></a></th>
			<th><a href="#" onclick="sort('liaisons')">ҽѧ����Ա<span id="liaisonssort" /></a></th>
			<th><a href="#" onclick="sort('point')">����<span id="pointsort" /></a></th>
			<th><a href="#" onclick="sort('credit')">ѧ��<span id="creditsort" /></a></th>
			<th><a href="#" onclick="sort('register_time')">ע��ʱ��<span id="register_timesort" /></a></th>
			<th>email<span id="emailsort" /></th>
			<th><a href="#" onclick="sort('birthday')">����<span id="birthdaysort" /></a></th>
			<th><a href="#" onclick="sort('college')">��ҵԺУ<span id="collegesort" /></a></th>
			<th><a href="#" onclick="sort('is_identify')">��֤���<span id="is_identifysort" /></a></th>
			<th><a href="#" onclick="sort('area')">����<span id="areasort" /></a></th>

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
		<a href="#" onclick="pageGoTo()"><img src="../images/icon/go1.gif" style="margin:-3px;" title="��ת" /></a>
	</div>
	<div class="pagebar" id="pageBar" align="right" style="float:right;"></div>
</div>
</body>
</html>

