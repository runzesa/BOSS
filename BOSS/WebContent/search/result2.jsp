<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查询列表</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>

<%
	String  a = (String)request.getAttribute("myshow");
	String [] b = a.split(",");
%>

</head>

<body class="right_date_body" scroll=auto>
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
		<li class="new"><a href="javascript:void(0)">查询列表</a></li>
		<li class="new"><a href="Excel.do">导出到Excel</a></li>
		<li class="new"><a href="javascript:history.go(-1)">返回</a></li>
	</ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
	<table width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
		<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
			<td height="25" align="center" colspan="51">
				<%=request.getAttribute("searchName")%>
				<%request.setAttribute("searchName",request.getAttribute("searchName"));%>
			</td>
		</tr>
		<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
			<%for(int i=0;i<b.length;i++){%>
				<td height="25" align="center"><%=b[i]%></td>
			<%}%>
		</tr>
		<%
			List mylist = (List)request.getAttribute("mylist");
			String bgk;
			for(int j=0;j<mylist.size();j++){
            if(j%2==0){
            	bgk="bgcolor=\"#FFFFFF\"";
            }else{
            	bgk="bgcolor=\"#F2F9FD\"";
            }
		%>
		<tr style="height:20px" <%=bgk %>> 
		<%
			String [] c = (String [])mylist.get(j);
			for(int k=0;k<c.length;k++){
		%>
				<td><div align="center"><%=c[k]%></div></td>
		<%	}%>
		</tr>
		<%	}%>
            <%=request.getAttribute("countstring")%>
	</table>
</div>
<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>

    </body>
</html>
