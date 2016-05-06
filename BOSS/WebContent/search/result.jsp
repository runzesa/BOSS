<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查询列表</title>
<%@include file="../jspheader/index_header.jsp" %>
<%
	String  a = (String)request.getAttribute("myshow");
	String [] b = a.split(",");
%>

</head>

<body class="right_date_body" scroll=auto>
<div class="right_date_top">

<div>
	<h1><a href="#">查询结果</a></h1>
	<div class="right_date_top_nav">
		<ul>
			<li class="export"><a href="Excel.do">导出到Excel</a></li>
			<li class="new"><a href="typelist.jsp">返回</a></li>
		</ul>
	</div>
</div>
</div>

<div class="right_date" id="right_date">
<div>
	<form method="post" action="" name="form1" id="form1">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" id="listtable">
		<thead>
			<tr>
				<th align="center" colspan="51">
					<%=request.getAttribute("searchName")%>
					<%request.setAttribute("searchName",request.getAttribute("searchName"));%>
				</th>
			</tr>
			<tr >
				<%for(int i=0;i<b.length;i++){%>
					<th height="25" align="center"><%=b[i]%></th>
				<%}%>
			</tr>
		</thead>
		
		<tbody id="selectdata">
		<%
			List mylist = (List)request.getAttribute("mylist");
			String bgk;
			for(int j=0;j<mylist.size();j++){
            if(j%2==0){
            	bgk="class=\"row1\"";
            }else{
            	bgk="class=\"row2\"";
            }
		%>
		<tr <%=bgk %>> 
		<%
			String [] c = (String [])mylist.get(j);
			for(int k=0;k<c.length;k++){
		%>
				<td align="center"><%=c[k]%></td>
		<%	}%>
		</tr>
		<%	}%>
		<%=request.getAttribute("countstring")%>
		</tbody>
	</table>
	</form>
</div>
</div>

<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>
</body>
</html>
