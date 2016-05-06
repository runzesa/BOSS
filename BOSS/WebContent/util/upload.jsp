<%@ page contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%
	String nameInput = request.getParameter("nameinput");
	String valueInput = request.getParameter("valueinput");
%>
<title>文件上传</title>
<link rel="stylesheet" type="text/css" href="../css/dhtmlXVault.css" />
<script language="JavaScript" type="text/javascript" src="../js/dhtmlXVault.js"></script>
<script language="JavaScript" type="text/javascript">
   var vault = null;
    function doOnLoad() {
            preLoadImages();
            vault = new dhtmlXVaultObject();
            vault.setServerHandlers("UploadHandler.jsp?nameinput=<%=nameInput%>&valueinput=<%=valueInput%>", "GetInfoHandler.jsp", "GetIdHandler.jsp");
            vault.create("vault1");
	}

	function preLoadImages(){
		var imSrcAr = new Array("btn_add.gif","btn_clean.gif","btn_upload.gif","ico_file.png","ico_image.png","ico_sound.png","ico_video.png","ico_zip.png","pb_back.gif","pb_demoUload.gif","pb_empty.gif");
		var imAr = new Array(0);
		for(var i=0;i<imSrcAr.length;i++){
			imAr[imAr.length] = new Image();
			imAr[imAr.length-1].src = "../images/upload/"+imSrcAr[i];
		}
	}
</script>

<style>
	body {font-size:12px;margin: 2px;padding: 0;}
	.{font-family:arial; font-size:12px;}
	h1 {cursor:hand;font-size: 16px; margin-left: 10px; line-height: 10px}
	xmp {color:green;font-size: 12px; margin: 0px; font-family: courier; background-color: #e6e6fa; padding: 2px}
	.hdr{background-color:lightgrey; margin-bottom:10px; padding-left:10px;}
	</style>

</head> 
<body onload="doOnLoad()">
	<div style="color:#ff0000;font-size:12px;"></div>
	<div id="vault1"></div>
</body>
</html>
