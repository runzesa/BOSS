<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>App��Ŀ����</title>
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
	<h1><a href="#" onmousemove="showTip();" onmouseout="closeTip();">App��Ŀ����</a></h1>
	<div id="opendiv">��ǰλ�ã�App��Ŀ����</div> 
	<div class="right_date_top_nav">
	<ul>
	<!--	<li style="display:block;" class="pager"><a href="#" target="_self">��ҳ</a></li>		-->
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
				
			</select>
		</div>
		<div class="input_boxstyle">
			<input id="searchvalue" name="searchvalue" type="text" onfocus="setday(this)" />
		</div>
		<div class="search">
		<span class="pic"></span>
		<a href="#" title="��ѯ" class="info" onclick="searchSelect1()"></a></div>
		<div class="search_ad" onclick="show();"><a href="#" title="�߼���ѯ"></a>
			<div id="show">
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
							<th>id</th>
			<th>��ԴID</th>
			<th>��ĿͼƬ</th>
			<th>��תĿ������</th>
			<th>��ת��ַ</th>
			<th>��ʾ˳��</th>
			<th>�Ƿ�ʹ��</th>
			<th>ϵͳ����</th>
			<th>��Ŀ����</th>
			<th>չʾλ��</th>
			<th>��Դ����</th>
			<th>����ʱ��</th>
			<th>������</th>
			<th>�޸�ʱ��</th>
			<th>�޸���</th>

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
