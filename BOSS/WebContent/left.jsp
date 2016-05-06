<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Pragma" content="no-cache" />
<title>LiuRunze开发平台</title>
<style type="text/css"></style>
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<%@include file="jspheader/jquery_header.jsp" %>
 		<link rel="stylesheet" href="css/login/ace-left.css" />
		<script src="js/ace.min.js"></script>
<script src="js/login.js" type="text/javascript"></script>
<script src="js/leftmenu.js" type="text/javascript"></script>
<script src="js/connectionpool_jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	var userId = '<%=session.getAttribute("userId")%>';
	document.oncontextmenu = function(){return false;};
	if(userId == 'null'){
		alert('对不起,系统已超时。');
		parent.location.replace('login.jsp');
	}
	var titleval = XMLHttp_Jquery.decodeData(getQueryString('titlename'));
	var roots = new Object();
	roots.menu = [];
	var leftMT = new Array();
</script>	
</head>

<body onload="initLeftPage()" class="left_body" style="overflow-x:hidden;overflow-y:auto; position:relative;">
<script type="text/javascript">
	if(titleval=='首页' || titleval==""){
		var session = true;
		var openw = "session=window.showModalDialog('personalsettings/leftcustom.jsp',window,'dialogHeight:400px; dialogWidth:510px; status:no');sessionCheck(session);";
		document.write('<img src="images/default/fresh/zdy.gif" alt="用户自定义" onclick="'+openw+'" style="position:absolute;top:10px;right:10px;cursor:pointer;"/>');
	}
	function sessionCheck(s){
		if(s == false) {
			parent.location.replace('login.jsp');
		}
	}
</script>
<div id="leftmenu">			
<div id="tree1"></div>
<!--<div id="sidebar">-->
<!--	<ul class="nav nav-list" id="tree1">-->
<!--	<li>-->
<!--					  <a href="#" class="dropdown-toggle">-->
<!--						<i class="icon-file-expand"></i>-->
<!--						<span>日常工作</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li>-->
<!--                        	<a href="#" class="dropdown-toggle">-->
<!--                            	<i class=""></i>-->
<!--                                <span>流程申请</span>                            -->
<!--                            </a>-->
<!--                         	<ul class="submenu">-->
<!--                               	<li><a href="#"><i class="icon-double-angle-right"></i>系统管理</a></li>-->
<!--								<li><a href="#"><i class="icon-double-angle-right"></i>平台管理</a></li>-->
<!--                            </ul>-->
<!--                        </li>-->
<!--					  </ul>				-->
<!--                    </li>-->
<!---->
<!--                    <li>-->
<!--					  <a href="#" class="dropdown-toggle" id="test">-->
<!--						<i class="icon-file-expand"></i>-->
<!--						<span>系统管理</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>系统管理</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>平台管理</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>事故分析</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>自定义查询</a></li>-->
<!--					  </ul>				-->
<!--                    </li>-->
<!--                    -->
<!--			        <li>-->
<!--					  <a href="#" class="dropdown-toggle">-->
<!--						<i class="icon-file-expand"></i>-->
<!--						<span>GP功能演示</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>基本操作</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>组件2</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>统计行</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>弹出窗口</a></li>-->
<!--                        <li><a href="#"><i class="icon-double-angle-right"></i>文件上传下载</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>多媒体文本框</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>下拉框</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>特殊链接</a></li>-->
<!--				  	  </ul>				-->
<!--                   </li>-->
<!--	</ul>-->
<!--</div>   -->
</div>
</body>
</html>