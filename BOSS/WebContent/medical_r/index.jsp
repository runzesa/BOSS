<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>��������</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">��������</a></h1>
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
				<option value="NAME">����</option><option value="SEX">�Ա�</option><option value="AGE">����</option><option value="DISEASE">����</option><option value="DISCRIBE">��������</option><option value="SECTION">�ֿ�</option><option value="CREATE_USER_ID">������</option><option value="CREATE_TIME">����ʱ��</option><option value="STATE">״̬</option><option value="RECIEVE_USER_ID">����ҽ��</option><option value="SOLVE_TIME">���ʱ��</option><option value="is_jump_ask">Խ����ѯ</option>
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
			<th><a href="#" onclick="sort('NAME')">����<span id="NAMEsort" /></a></th>
			<th><a href="#" onclick="sort('SEX')">�Ա�<span id="SEXsort" /></a></th>
			<th><a href="#" onclick="sort('AGE')">����<span id="AGEsort" /></a></th>
			<th><a href="#" onclick="sort('DISEASE')">����<span id="DISEASEsort" /></a></th>
			<th><a href="#" onclick="sort('DISCRIBE')">��������<span id="DISCRIBEsort" /></a></th>
			<th><a href="#" onclick="sort('SECTION')">�ֿ�<span id="SECTIONsort" /></a></th>
			<th><a href="#" onclick="sort('CREATE_USER_ID')">������<span id="CREATE_USER_IDsort" /></a></th>
			<th><a href="#" onclick="sort('CREATE_TIME')">����ʱ��<span id="CREATE_TIMEsort" /></a></th>
			<th><a href="#" onclick="sort('STATE')">״̬<span id="STATEsort" /></a></th>
			<th><a href="#" onclick="sort('RECIEVE_USER_ID')">����ҽ��<span id="RECIEVE_USER_IDsort" /></a></th>
			<th><a href="#" onclick="sort('SOLVE_TIME')">���ʱ��<span id="SOLVE_TIMEsort" /></a></th>
			<th><a href="#" onclick="sort('is_jump_ask')">Խ����ѯ<span id="is_jump_asksort" /></a></th>

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

