<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.genius.search.search.History" %>
<%@ page import="com.genius.search.search.TypeForm" %>
<%@ page import="java.util.Iterator" %>
<%@page import="com.genius.search.search.actionbean.TypeFromActionBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.genius.search.search.actionbean.HistoryActionBean"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�Զ����ѯ</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312" />

<%@include file="../jspheader/index_header.jsp" %>
<script src="../css/search-xtree.js"></script>
<link type="text/css" rel="stylesheet" href="../css/xtree.css" />
<%
String spower=session.getAttribute("roleId")+"";
%>
<script type="text/javascript">
function mysearch(id){
	<%
		if("0".equals(spower)){
	%>
	if(document.form1.actiontype2[0].checked){
		this.window.location='result.do?action=listex&id='+id;
	}else if(document.form1.actiontype2[1].checked){
		this.window.location='historyaction.do?action=updateshow&id='+id;
	}else if(document.form1.actiontype2[2].checked){
		if(confirm('�˲�����ɾ��������ѯ��\n\nȷ��Ҫִ�д��������')){
			this.window.location='historyaction.do?action=delete&id='+id;
		}
	}
	<%
		}else{
	%>
	this.window.location='result.do?action=listex&id='+id;
	<%
		}
	%>
}
function noPower(){
	alert("��û��Ȩ�ޣ�");
}
</script>
</head>
<body class="right_date_body" scroll=auto>

<form action="" name="form1">
<div class="right_date_top">
<div>
	<h1><a href="#">�Զ����ѯ</a></h1>
<!--	<div class="right_date_top_nav">-->
<!--		<ul>-->
<!--			<li class="new"><a href="javascript:void()" onclick="return validate(document.forms[0]);">��ѯ</a></li>-->
<!--			<li class="back"><a href="javascript:history.go(-1)">����</a></li>-->
<!--		</ul>-->
<!--	</div>-->
	<%
	if("0".equals(spower)){
	%>
	<div class="right_date_top_nav">
		<ul>
			<li class="new"><a href="builderaction.do">��</a></li>
			<li class="new"><a href="HistoryAction.do?action=addshow">����</a></li>
			<li style="width:175px;">
				<input type="radio" value="0" checked="checked" name="actiontype2" style="width:15px;border:none;"/>
				��ѯ
	       		<input type="radio" value="1" name="actiontype2" style="border:none;width:15px;"/>
	       		�޸�
	       		<input type="radio" value="2" name="actiontype2" style="border:none;width:15px;"/>
				ɾ��
	       	</li>
			<li class="new"><a href="tl_select.do">���ݱ����</a></li>
			<li class="new"><a href="tf_select.do">�ֶι���</a></li>
			<li class="new"><a href="st_select.do">��ѯ���͹���</a></li>
		</ul>
	</div>
	<%	} %>
</div>
</div>


<div style="padding-left: 15px;margin-top: 40px;">
	<script language="JavaScript">
		if (document.getElementById) {
			var item0 = new WebFXTree('/');
			item0.setBehavior('classic');
<%--  ��̬������״�˵� --%>		  
<%
		TypeFromActionBean user =null;
		TypeForm searchtype = new TypeForm();
		Iterator iteRel = searchtype.list().iterator();
		while(iteRel.hasNext()){	
			//System.out.println(user.getClass());
			user = (TypeFromActionBean)iteRel.next() ;
			out.println("var item" + user.getSearchId()
					+ " = new WebFXTreeItem('" + user.getSearchName() 
					+ "','#');" );
			out.println("item" + user.getSearchParentId() + ".add(" + "item" 
					+ user.getSearchId() + ")" );
		}
		HistoryActionBean user1 = null;
		History sh = new History();
		if("0".equals(spower)){
			iteRel = sh.list().iterator();
		}else{
			iteRel = sh.list(spower).iterator();
		}
		while(iteRel.hasNext()){	 
			user1 = (HistoryActionBean)iteRel.next() ;
			if("0".equals(spower) || user1.getSqlPower().equals(spower)){
				out.println("var items" + user1.getId()
						+ " = new WebFXTreeItem('" + user1.getSearchName()+ "','javascript:mysearch("+user1.getId()+")');" );
			}else{
				out.println("var items" + user1.getId()
						+ " = new WebFXTreeItem('" + user1.getSearchName()+ "','javascript:noPower()');" );
			}
			out.println("item" + user1.getSearchType() + ".add(" + "items" 
					+ user1.getId() + ")" );
		}
%>	
<%-- �������ɶ�̬�˵�  --%>			
			document.write(item0);
		}		  
		  </script>
</div>
</form>
</body>
</html>