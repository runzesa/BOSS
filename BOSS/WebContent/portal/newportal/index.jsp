<%@page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/demo_default.css" />
<%@include file="../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../../js/connectionpool.js"></script>
<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="index.js"></script>
<script type="text/javascript">
document.oncontextmenu = function(){return false;};
var userId = '<%=session.getAttribute("userId")%>';
if(userId == 'null'){
	alert('对不起,系统已超时。');
	parent.location.replace('login.jsp');
}
	
function getQueryString(name){
	var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");
	if(reg.test(location.href)) 
		return unescape(RegExp.$2.replace(/\+/g, " ")); 
	return ""; 
}
var menuQueryId = getQueryString('menuid');
</script>
<style type="text/css">
	.mask{
		width:100%;
		height:100%;
		top:0; 
		left:0;
		right:0;
		bottom:0;
		position:absolute;
		background-color:#888;
		filter: Alpha(Opacity=30);
		z-index:5;
		display:none;
	}
	.showview{
		position:absolute;
		top:expression(document.body.clientHeight/8);
		left:expression(document.body.clientWidth/8);
		width:expression(document.body.clientWidth*3/4);
		bottom:expression(document.body.clientHeight/8);
		filter: Alpha(Opacity=100);
		z-index:10;
		display:none;
	}
</style>
</head>

<body style="overflow-y:auto;" onload="pageLoad();">
<!-- 
<div id="menu42">
	<ul id="menubutton"></ul>
</div>
-->
<div class="mask"></div>
<div class="showview" id="showview">
	<div style="text-align:right;" style="width:100%;">
		<div id="showviewdata"><img	src="../../images/icon/icon_loading.gif" width="16" height="16"/><span
			id="loading_msg">数据加载中，Loading...</span></div>
	</div>
</div>

<div class="content">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td style="padding:5px 0 0 1px;width:50%;vertical-align: top;">
       <table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="title_l" style="width:20%;">
                        <div style="padding:8px 0 0 15px;">
                       	    <a href="#" id="title_1"></a>
                        </div>
                        </td>
						<td class="title_c" style="width:70%;"><div></div></td>
						<td class="title_r" id="button_1" style="width:10%;index-z:100px;">
                        <div style="float:left;margin:9px 0 0 -500px;">
       <!--                  	<img src="img/ico_close.gif" onclick="showView(1)" width="13" height="13" />	 -->
                        </div>
                        </td>
					 </tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						 <td class="center_l">&nbsp;</td>
						 <td class="center_c"><div id="content_1"></div></td>
						 <td class="center_r">&nbsp;</td>
					 </tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="bottom_l">&nbsp;</td>
						<td class="bottom_c">&nbsp;</td>
						<td class="bottom_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
       </table>
       
      <!-- 3 -->
      <table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="title_l" style="width:20%;">
                        <div style="padding:9px 0 0 15px;">
                        	<a href="#" id="title_3"></a>
                        </div>
                        </td>
                        <td class="title_c" style="width:70%;"><div></div></td>
						<td class="title_r" id="button_3" style="width:10%;index-z:100px;">
                        <div style="float:left;margin:9px 0 0 -500px;">
     <!--                    	<img src="img/ico_close.gif" onclick="showView(3)" width="13" height="13" />	 -->
                        </div>
                        </td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="center_l">&nbsp;</td>
						<td class="center_c"><div id="content_3"></div></td>
						<td class="center_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="bottom_l">&nbsp;</td>
						<td class="bottom_c">&nbsp;</td>
						<td class="bottom_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
       </table>
    </td>

    <td style="padding:5px 0 0 0;vertical-align: top">
       <table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="title_l" style="width:20%;">
                        <div style="padding:9px 0 0 15px;">
                        	<a href="#" id="title_2"></a>
                        </div></td>
						<td class="title_c" style="width:70%;"><div></div></td>
						<td class="title_r" id="button_2" style="width:10%;index-z:100px;">
                        <div style="float:left;margin:9px 0 0 -500px;">
        <!--              	<img src="img/ico_close.gif" onclick="showView(2)" width="13" height="13" />	 -->   
                        </div>
                        </td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="center_l">&nbsp;</td>
						<td class="center_c"><div id="content_2"></div></td>
						<td class="center_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="bottom_l">&nbsp;</td>
						<td class="bottom_c">&nbsp;</td>
						<td class="bottom_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
       </table>
       
       <!-- 4 -->
       <table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="title_l" style="width:20%;">
                        <div style="padding:9px 0 0 15px;">
                        	<a href="#" id="title_4"></a>
                        </div>
                        </td>
						<td class="title_c" style="width:70%;"><div></div></td>
						<td class="title_r" id="button_4" style="width:10%;index-z:100px;">
                        <div style="float:left;margin:9px 0 0 -500px;">
       <!--             	<img src="img/ico_close.gif" onclick="showView(4)" width="13" height="13" />   -->     
                        </div>
                        </td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="center_l">&nbsp;</td>
						<td class="center_c"><div id="content_4"></div></td>
						<td class="center_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
          <tr>
             <td>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
						<td class="bottom_l">&nbsp;</td>
						<td class="bottom_c">&nbsp;</td>
						<td class="bottom_r">&nbsp;</td>
					</tr>
                 </table>
             </td>
          </tr>
       </table>
       
    </td>
</tr>
</table>
</div>
</body>
</html>
