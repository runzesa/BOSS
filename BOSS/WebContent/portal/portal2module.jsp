<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.genius.portal.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {

			}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>模块列表</title>
<link href="../css/xtree.css" rel=stylesheet type=text/css>
<script src="../css/xtree.js" type="text/javascript"></script>
<script src="../css/xtree_multi.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
body {
	background-color: #ffffff;
}
-->
</style>
<link href="../css/<%=session.getAttribute("style").toString() %>"
	rel="stylesheet" type="text/css">
</head>

<body class="xzmk_body">
<table width="100%" height="41" border="0" cellpadding="0"
	cellspacing="0" bordercolor="#FFFFFF">
	<tr>
		<td width="30%" height="68"></td>
	</tr>
	<tr>
		<td style="padding:0 18px 0 25px;">
		<div id="select1"
			style="overflow-x:hidden;overflow-y:auto;width:100%;height:430px;">
		<form method="post" action="ok.jsp" name="form1"><!-- 开始生成动态菜单  --> <script
			language="JavaScript">
		  if (document.getElementById) {
				var tree0 = new WebFXTree('/模块选择','#');
				tree0.setBehavior('classic');
	<%
	 ArrayList list = new ArrayList();
	 Portal2 module = new Portal2();
	 list = module.windowSelectPortal();
	 for(int i = 0;i<list.size();i++)
	 {
		 portal2Bean bean = new portal2Bean();
		 bean = (portal2Bean)list.get(i);
		 if(bean.getZjds().equals("0"))
		 {			 
			 out.println("var tree"+bean.getId()+"= new WebFXTreeItem('"+ bean.getPortletName() +"','portal2modulewindow.jsp?name="+bean.getPortletName()+"&link="+bean.getPortletLink()+"');"); 

 		 }else{
	         out.println("var tree"+bean.getId()+"= new WebFXTreeItem('"+ bean.getPortletName() +"','');");
		 }
          out.println("tree0.add(" + "tree" + bean.getId() + ");" );
          bean = null;
	  }
	%>	
			document.write(tree0);
		}		  
 </script> <!-- 结束生成动态菜单  --></form>
		</div>
		</td>
	</tr>
</table>
</body>
</html>
