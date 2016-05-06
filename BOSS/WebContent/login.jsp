<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-CN" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="images/default/fresh/favicon.ico" rel="Shortcut Icon" />
<title>LiuRunze V2.3</title>
<link href="css/login/style_b.css" rel="stylesheet" type="text/css" id="style" />
<script src="js/tools.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<script type="text/javascript">
	document.oncontextmenu = function(){return false;}
	loginstyle();
	var info = '<%=request.getAttribute("info")%>';
</script>
</head>

<body class="login_body_bg" scroll="no" onload="pageLoad()" onkeydown="enterDown(event)">
<div class="login_bg">
    <div class="login_top_link">
    	<a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(location.href);">设为首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    	<a href="javascript:window.external.AddFavorite(location.href, document.title);">加入收藏</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    	选择页面风格：<a style="cursor:hand;" onclick="setSkinColor('style_b')"><img src="images/login/blue.gif" /></a>&nbsp;&nbsp;
		<a style="cursor:hand;" onclick="setSkinColor('style_o')"><img src="images/login/orange.gif" /></a>
    </div>
    <form name="loginform" method="post">
    	<div class="login">
         	用户名：<input name="username" type="text" class="input" maxlength="50"/><br/><br/>
         	密　码：<input name="password" type="password"  class="input" /><br/><br/>
         	验证码：<input name="rand" type="text" class="input" style="width:60px;margin:-15px 0 0 8px;" />
         	<script>
				setTimeout(function(){document.getElementsByName("username")[0].focus();}, 0); 
         		document.write("<img id='validate' style='border:0;margin:5px 0 0 0px;' onclick='freshimg()' src='util/validataimage.do?rand="+Math.random()*10000+"'>"+
                 		"<a href='#' onclick='freshimg()' style='font-family:verdana,sans-serif;font-size:12px;color:#666;margin:0 0 0 5px;'>看不清,换一张</a>");
         	</script>
         	<span><input id="remember" name="remember" type="checkbox" value="" />&nbsp;记住用户名</span>
         	<div class="login_button_div">
					<div class="button1"><a href="#" onclick="formSubmit();" class="info"></a></div>
					<div class="button2"><a href="#" onclick="window.location.reload();" class="info1"></a></div>			                                        
			</div>
   	  </div>
    </form>
</div>
</body>
</html>
