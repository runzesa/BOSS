<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Pragma" content="no-cache" />
<title>LiuRunze����ƽ̨</title>
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
		alert('�Բ���,ϵͳ�ѳ�ʱ��');
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
	if(titleval=='��ҳ' || titleval==""){
		var session = true;
		var openw = "session=window.showModalDialog('personalsettings/leftcustom.jsp',window,'dialogHeight:400px; dialogWidth:510px; status:no');sessionCheck(session);";
		document.write('<img src="images/default/fresh/zdy.gif" alt="�û��Զ���" onclick="'+openw+'" style="position:absolute;top:10px;right:10px;cursor:pointer;"/>');
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
<!--						<span>�ճ�����</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li>-->
<!--                        	<a href="#" class="dropdown-toggle">-->
<!--                            	<i class=""></i>-->
<!--                                <span>��������</span>                            -->
<!--                            </a>-->
<!--                         	<ul class="submenu">-->
<!--                               	<li><a href="#"><i class="icon-double-angle-right"></i>ϵͳ����</a></li>-->
<!--								<li><a href="#"><i class="icon-double-angle-right"></i>ƽ̨����</a></li>-->
<!--                            </ul>-->
<!--                        </li>-->
<!--					  </ul>				-->
<!--                    </li>-->
<!---->
<!--                    <li>-->
<!--					  <a href="#" class="dropdown-toggle" id="test">-->
<!--						<i class="icon-file-expand"></i>-->
<!--						<span>ϵͳ����</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>ϵͳ����</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>ƽ̨����</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>�¹ʷ���</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>�Զ����ѯ</a></li>-->
<!--					  </ul>				-->
<!--                    </li>-->
<!--                    -->
<!--			        <li>-->
<!--					  <a href="#" class="dropdown-toggle">-->
<!--						<i class="icon-file-expand"></i>-->
<!--						<span>GP������ʾ</span>-->
<!--                      </a>	-->
<!--                      <ul class="submenu">-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>��������</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>���2</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>ͳ����</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>��������</a></li>-->
<!--                        <li><a href="#"><i class="icon-double-angle-right"></i>�ļ��ϴ�����</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>��ý���ı���</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>������</a></li>-->
<!--						<li><a href="#"><i class="icon-double-angle-right"></i>��������</a></li>-->
<!--				  	  </ul>				-->
<!--                   </li>-->
<!--	</ul>-->
<!--</div>   -->
</div>
</body>
</html>