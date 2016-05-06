<%@ page contentType="text/html; charset=gbk"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>提示信息</title>
<style>
a:link{color:#ff0000; text-decoration:none;}
a:visited{color:#ff0000; text-decoration:none;}
a:hover{color:#ff0000; text-decoration:underline;}
.logo{
	font-family: "Verdana", "Arial", "Helvetica", "sans-serif";
	font-size: 26px;
	font-style: italic;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	padding-left: 30px;
}
.bottd{
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: e6e6e6;
	background-color: #3584D1;
	font-family: "宋体";
	font-size: 12px;
	font-weight: normal;
	color: #FFFFFF;
	text-decoration: none;
}
#pic{
width: 100%;
FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#8DCEFF, EndColorStr=#DAEFFF);  
border: 1px solid #6699CC;
}
#pic1{
width: 100%;
FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#44A3DB, EndColorStr=#3482CD);  
border: 1px solid #6699CC;
}
#pic2{
width: 100%;
FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#DEECF7);  
border: 1px solid #6699CC;
}

#xsnazzy h1, #xsnazzy h2, #xsnazzy p {margin:0 10px; letter-spacing:1px;}
#xsnazzy h1 {
	font-size:16px;
	color:#000;
	font-family: "宋体";
	font-style: normal;
	font-weight: bold;
	margin-bottom: 10px;
	padding-top: 6px;
}
#xsnazzy h2 {font-size:2em;color:#06a; border:0;}
#xsnazzy p {
	padding-bottom:0.5em;
	font-family: "宋体";
	font-size: 14px;
	font-style: normal;
	font-weight: bold;
	color: #666666;
	text-decoration: none;
	line-height: 25px;
}
#xsnazzy h2 {padding-top:0.5em;}
#xsnazzy {background: transparent; margin:1em;}

.xtop, .xbottom {display:block; background:transparent; font-size:1px;}
.xb1, .xb2, .xb3, .xb4 {display:block; overflow:hidden;}
.xb1, .xb2, .xb3 {height:1px;}
.xb2, .xb3, .xb4 {background:#fff; border-left:1px solid #08c; border-right:1px solid #08c;}
.xb1 {margin:0 5px; background:#08c;}
.xb2 {margin:0 3px; border-width:0 2px;}
.xb3 {margin:0 2px;}
.xb4 {height:2px; margin:0 1px;}

.xboxcontent {display:block; background:#fff; border:0 solid #08c; border-width:0 1px;}

</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no">
<table width="1024" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="80" id="pic1" class="logo"></td>
  </tr>
  <tr> 
    <td height="6" id="pic2"></td>
  </tr>
  <tr> 
    <td id="pic"> <table width="350" height="250" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		  <div id="xsnazzy">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="xboxcontent">
                <h1>提示信息</h1>
                <p>&nbsp;&nbsp;&nbsp;对不起，系统已超时！<br>
                  &nbsp;&nbsp;&nbsp;请您重新<font color="#FF0000"><a href="login.jsp">登录</a>！</font></p>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>
		  </td>
        </tr>
      </table> </td>
  </tr>
    <tr> 
    <td height="3" bgcolor="BFCED9" ></td>
  </tr>
  <tr>
    <td height="25" class="bottd"></td>
  </tr>
</table>
</body>
</html>


