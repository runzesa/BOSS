<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.dataanalysis.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>���ݷ���</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<script type="text/javascript">
function del(){
	var bool = confirm("ȷ��ɾ����\nɾ��ѡ�����ɾ�������涨���������ģ�飡");
	if(bool){
		document.form1.submit();
	}
}
</script>
<base target="_self" />
</head>
<%
	int flag = 0;
	ArrayList mylist = (ArrayList) request.getAttribute("dataAList");
	Iterator it = mylist.iterator();
%>
<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
      <ul>
      <%if(mylist.size()<=5){//ֻ���S�������傀�˻`%>
      <li class="new"><a href="datainsertselect.do?act=tab">���</a></li>
      <%} %>
      <li class="del"><a href="#" onclick="del()">ɾ��</a></li>
      </ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post"	action="datadelete.do?<%=request.getAttribute("query") %>&act=tab"	name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center">ѡ��</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">����</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
				<td><div align="center">�༭</div></td>
			</tr>
			<tr bgcolor="FFFFFF" >
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="0" />
				  </div></td>
				<td><div align="center">
					<a href="select.do?tabid=0">��ҳ</a>
				</div></td>
				<td><div align="center"><a href="#">�༭</a>
			    </div></td>
			</tr>
			<%
				
				while (it.hasNext()) {
					DataASelectActionBean bean = (DataASelectActionBean)it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#FFFFFF" >
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getId() %>" />
				  </div></td>
				<td><div align="center">
					<a href="select.do?tabid=<%=bean.getId() %>"><%=bean.getName()%></a>
				</div></td>
				<td><div align="center"><a href="dataupdateselect.do?updateid=<%=bean.getId() %>&act=tab">�༭</a>
			    </div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#F2F9FD">
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getId() %>" />
				  </div></td>
				<td><div align="center">
					<a href="select.do?tabid=<%=bean.getId() %>"><%=bean.getName()%></a>
				</div></td>
				<td><div align="center"><a href="dataupdateselect.do?updateid=<%=bean.getId() %>&act=tab">�༭</a>
			    </div></td>
			</tr>
			<%
					flag = 1;
					}
				}
			%>
		</table>
</form>
</div>
<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>
</body>

</html>

