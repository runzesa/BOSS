<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.dataanalysis.actionbean.*"%>
<%@page import="java.util.List"%>
<%@page import="com.genius.adminmanager.titlelink.actionbean.TitleLinkInsertBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.genius.adminmanager.titlelink.actionbean.TitleLinkUpdateBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<link rel="stylesheet" type="text/css" media="all" href="../css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="stylesheet" type="text/css" media="all" href="../css/skins/aqua/theme.css" title="Aqua" />
<script type="text/javascript" src="../css/calendar.js"></script>
<script type="text/javascript" src="../css/calendar-cn.js" ></script>
<script type="text/javascript" src="../css/calendar-setup.js"></script>
<script language="JavaScript">
<!--
function submit(){
		document.form1.action="update.do";
		document.form1.submit();
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="update.do" name="form1" >
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
<%
TitleLinkUpdateBean bean = (TitleLinkUpdateBean)request.getAttribute("bean");
%>
                <td height="24" colspan="11" bgcolor="#DFEBF0">
              		<div align="center">数据编辑</div>
	            	<input type="hidden" name="id" value="<%=bean.getId() %>" />
                </td>
              </tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">功能名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" value="<%=bean.getName() %>" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">菜单节点名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF"><table border=0>
		<%
			String[] ids = {};
			if(bean.getLinkids() !=null){
				   ids = bean.getLinkids().split(",");
			}
			List<TitleLinkInsertBean> list = (ArrayList)request.getAttribute("leftlinks");
			int tr = 0;
			int check=0;
			TitleLinkInsertBean bean2 = null;
			for(int i = 0;i < list.size(); i++){
				check=0;
				bean2 = list.get(i);
				if(tr==0){out.print("<tr>");}
				
				for(int j = 0;j<ids.length; j++){
					if(bean2.getId().equals(ids[j])){
						check=1;
						break;
					}
				}
				if(check==1){
					out.print("<td><input type='checkbox'checked='checked' name='links' value='"+bean2.getId()+"'>"+bean2.getName()+"</td>");
				}else{
					out.print("<td><input type='checkbox' name='links' value='"+bean2.getId()+"'>"+bean2.getName()+"</td>");
				}
				tr++;
				if(tr==4){out.print("</tr>");tr=0;}
			}
		%>
		</table></td>
	</tr>
            </table>
          </form>
      </div>
  <p align="center"> 
    <a href="#"  onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
    <a href="#"  onclick="javascript:history.go(-1)"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
  </p>

</body>

</html>

