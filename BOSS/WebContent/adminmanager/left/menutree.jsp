<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.left.LeftMenuExt"%>
<%@ page import="com.genius.adminmanager.left.actionbean.LeftMenuBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户列表</title>
<link href="../css/style.css" rel=stylesheet type=text/css>
<link href="../css/xtree.css" rel=stylesheet type=text/css>
<script src="../css/xtree.js" type="text/javascript"></script>
<script src="../css/xtree_multi.js" type="text/javascript"></script>

<%
	String id = request.getParameter("topid");
	String roleId = request.getParameter("roleId");
	String success = request.getParameter("success");
%>

<script language="JavaScript">
<!--
var allmodule = "";
function sub(){
	var vals="";
	var vals2="";
	var us=document.forms[0].leftmenu;
	for (var i=0;i<us.length;i++){
		if(us[i].checked){
			vals += us[i].value+",";
		}else{
			vals2 += us[i].value+",";
		}
	}
	document.getElementById("modules").value=vals;
	document.getElementById("modules2").value=vals2;
	document.form1.action=document.forms[0].action+"?act=role_left&topid=<%=id%>&roleId=<%=roleId%>";
	document.form1.submit();
}

function unselect(){
	var us=document.forms[0].leftmenu;
	for (var i=0;i<us.length;i++){
		if(event.srcElement.checked){
			if(us[i].id==event.srcElement.value){
				//三级菜单
				for (var j=0;j<us.length;j++){
					if(us[j].id==us[i].value)
						us[j].checked=true;
				}
				us[i].checked=true;
			}
		}else{
			if(us[i].id==event.srcElement.value){
				for (var j=0;j<us.length;j++){
					if(us[j].id==us[i].value)
						us[j].checked=false;
				}
				us[i].checked=false;
			}
		}
	}
}
function callParentMethod(name,type,id){
	window.parent.getMoodule(name,type,id);
}

function success(){
	var ret = "<%=success%>";
	if('1' == ret){
		alert("保存成功！");
	}
}
-->
</script>
<base target="_self">
</head>

<body class="right_date_body" onload="success()">
	<form method="post" action="updateroleinfo.do" name="form1">
		<div class="bmgl_div">
			<table width="93%">
				<tr>
					<td>
			<div class="open_left">
	<%
	if(id!=null && !id.equals("")){
	%>
<!-- 开始生成动态菜单  -->
<script language="JavaScript">
	if (document.getElementById) {
		var item0 = new WebFXTree('/子菜单列表','#');
		item0.setBehavior('classic');
	<%
	LeftMenuExt leftMenu = new LeftMenuExt();
	
	List<LeftMenuBean> list = leftMenu.getTitle_left(id,roleId);
	Iterator<?> it=list.iterator();
	String checked="";
	String jsmethod="";
	while(it.hasNext()){
		LeftMenuBean bean = (LeftMenuBean)it.next() ;
		
		checked="";
		if(bean.getRole()!=null){
			checked="checked=checked";
		}
		
		String url = bean.getUrl();
		String urls[] = null;
		if(url==null)
			urls = new String[]{""};
		else
			urls = url.split("\\.");
			
		if(urls.length==2&& urls[0].equals("def")){
			jsmethod="callParentMethod(\""+bean.getName()+"\","+urls[1]+")";
		}else{
			jsmethod="callParentMethod(\""+bean.getName()+"\",\"spe\")";
		}
		
		List<LeftMenuBean> list2=leftMenu.getTitle_left2(bean.getId(),roleId);
		
		if(list2==null || list2.size()==0){
			jsmethod="";
		}
			
		out.println("var item" + bean.getId() 
			+ " = new WebFXTreeItem('<input type=\\'checkbox\\' name=leftmenu "+checked+" value=\\'"+bean.getId()
			+"\\' id=\\'"+bean.getId()+"\\' onclick=\\'unselect()\\'><a href=\\'javascript:void(0)\\' onclick=\\'"+jsmethod+"\\'>"+ bean.getName() 
			+ "</a>','');");
		out.println("item" + bean.getParent() + ".add(" + "item" + bean.getId() + ");" );
		
		
		
		Iterator<?> it2=list2.iterator();
		while(it2.hasNext()){
			LeftMenuBean bean2 = (LeftMenuBean)it2.next() ;
			checked="";
			if(bean2.getRole()!=null){
				checked="checked=checked";
			}
			
			String url2 = bean2.getUrl();
			String urls2[] = url2.split("\\.");
			if(urls2.length==2&& urls2[0].equals("def")){
				jsmethod="callParentMethod(\""+bean2.getName()+"\","+urls2[1]+")";
			}else{
				jsmethod="callParentMethod(\""+bean2.getName()+"\",\"spe\")";
			}
			
			List<LeftMenuBean> list3=leftMenu.getTitle_left2(bean2.getId(),roleId);
			
			if(list3!=null && list3.size()>0){
				jsmethod="";
			}
			out.println("var item" + bean2.getId() 
				+ " = new WebFXTreeItem('<input type=\\'checkbox\\' name=leftmenu "+checked+" value=\\'"+bean2.getId()
				+"\\' id=\\'"+bean.getId()+"\\' onclick=\\'unselect()\\'><a href=\\'javascript:void(0)\\' onclick=\\'"+jsmethod+"\\'>"+ bean2.getName() 
				+ "</a>','');" );
			
			out.println("item" + bean2.getParent() + ".add(item" + bean2.getId() + ");" );
			
			Iterator<?> it3=list3.iterator();
			while(it3.hasNext()){
				LeftMenuBean bean3 = (LeftMenuBean)it3.next() ;
				checked="";
				if(bean3.getRole()!=null){
					checked="checked=checked";
				}
				jsmethod="";
				String url3 = bean3.getUrl();
				String urls3[] = url3.split("\\.");
				if(urls3.length==2&& urls3[0].equals("def")){
					jsmethod="callParentMethod(\""+bean3.getName()+"\","+urls3[1]+")";
				}else{
					jsmethod="callParentMethod(\""+bean3.getName()+"\",\"spe\")";
				}
				out.println("var item" + bean3.getId() 
					+ " = new WebFXTreeItem('<input type=\\'checkbox\\' name=leftmenu "+checked+" value=\\'"+bean3.getId()
					+"\\' id=\\'"+bean2.getId()+"\\' onclick=\\'unselect()\\'><a href=\\'javascript:void(0)\\' onclick=\\'"+jsmethod+"\\'>"+ bean3.getName() 
					+ "</a>','');" );
				
				out.println("item" + bean3.getParent() + ".add(item" + bean3.getId() + ");" );
			}
		}
	}
	%>	
		document.write(item0);
		
		var vals="";
		var us=document.forms[0].leftmenu;
		for (var i=0;us!=undefined && us!=null && i<us.length;i++){
			if(us[i].checked){
				vals += us[i].value+",";
			}
		}
		allmodule=vals;
		
	}
</script>
<%
	}else{
		out.print("请选择标签页！");
	}
%>
			</div>
					</td>
				</tr>
				<tr>
					<td>

<%if(id!=null && !id.equals("")){ %>					
	<center>
		<input type="button" onclick="sub()" value="&nbsp;确&nbsp;定&nbsp;"/>
		<input type="reset" name="reset" value="&nbsp;重&nbsp;置&nbsp;"/>
		<input type="hidden" name="modules" id="modules" value=""/>
		<input type="hidden" name="modules2" id="modules2" value=""/>
	</center>
<%} %>
					
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
