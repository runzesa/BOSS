<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>LiuRunze</title>
<link href="css/Gp_blue.css" rel="stylesheet" type="text/css">
<SCRIPT src="js/menu.js" type=text/javascript></SCRIPT>
</head>

<body class="right-body" scroll="no">
<script language="javascript">
	function bianhuan(sign){
		if(sign==1){
     		document.getElementById("photo1").src="images/blue/Tags2.jpg";
	 		document.getElementById("photo2").src="images/blue/Tags1-1.jpg";
	 		document.getElementById("photo3").src="images/blue/Tags3-1.jpg";
	 		document.getElementById("kuangjia").src="portal/portal1js.jsp";
	 	}else if(sign==2){
	 		document.getElementById("photo1").src="images/blue/Tags2-1.jpg";
			document.getElementById("photo2").src="images/blue/Tags1.jpg";
			document.getElementById("photo3").src="images/blue/Tags3-1.jpg";
			document.getElementById("kuangjia").src="portal/portal2js.jsp";
		}else if(sign==3){
			document.getElementById("photo1").src="images/blue/Tags2-1.jpg";
	 		document.getElementById("photo2").src="images/blue/Tags1-1.jpg";
	 		document.getElementById("photo3").src="images/blue/Tags3.jpg";
	 		document.getElementById("kuangjia").src="calendar/calendar.jsp";
		}
   }
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="right_td">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" class="right_titlebg">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="125">
							<img id="photo1" src="images/blue/Tags2.jpg" width="120" height="25" onClick="bianhuan(1)"/></td>
						<td width="125" valign="top">
							<img id="photo2" src="images/blue/Tags1-1.jpg" width="120" height="25" onClick="bianhuan(2)"/></td>
						<td width="125">
							<img id="photo3" src="images/blue/Tags3-1.jpg" width="120" height="25" onClick="bianhuan(3)"/></td>	
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td width="80" class="F">
						<div align="center"><a href="#"
							onclick="MM_openBrWindow('portal/portal1addtag.jsp','','width=436,height=324,left='+(screen.width-436)/2+',top='+(screen.height-324)/2)">标签管理</a></div>
						</td>

					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="50" valign="top" class="right_td_iframe"><iframe
					frameborder="0" id="kuangjia" name="kuangjia" width="100%"
					height="410" src="portal/portal1.jsp" /></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
