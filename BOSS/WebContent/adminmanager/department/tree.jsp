<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>部门管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
<%@include file="../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../../js/jquery.jstree.js"></script>
<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle2.css"/>
<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle.css"/>
<base target="_self"/>
<script type="text/javascript">
	var success = '<%=request.getParameter("success") %>';
	var result = '<%=request.getParameter("result") %>';
	if(success=='null'){
		
	}else if(success="true"){
		alert("操作成功！");
	}else{
		alert("操作失败！");
	}
	if(result=='null'){
	
	}else if(result="true"){
		alert("删除成功！");
	}else{
		alert("删除失败！");
	}
</script>
<script type="text/javascript">
function loadTree(){
	//树的图片目录
	$.jstree._themes = "../../images/jstree/";
	$("#tree").jstree({
		"xml_data" : {
			"data" : ""+
			"<root>" +
				"<item id='0' state='closed' type='root'>" +
				"<content><name>根部门</name></content>" +
				"</item>" +
			"</root>",
			"ajax" : {
				"url" : "../department/select.do",
				"data" : function (n) {
					return {
						pid : n.attr ? n.attr("id") : 0,
						rand : new Date().getTime()
				}}
			},
			"xsl" : "nest"
		},
		"core" : { "animation" : 100 } ,
		"plugins" : [ "themes", "xml_data", "checkbox" ],
		"themes" : {
			"theme" : "classic"
		}
	})
	.bind('click.jstree', function(event) {//绑定树事件:点击
		var eventNodeName = event.target.nodeName;
		if (eventNodeName == 'A') {
			var $subject = $(event.target).parent();
			
			var url = "../userinfo/select.do";
			var itemId = $(event.target).parents('li').attr('id');
			if(itemId==0){
				url += "";
			}else{
				var itemSign = $(event.target).parents('li').attr('sign');
				url += "?sign="+itemSign+"&departmentid="+itemId;
			}
			window.location.href = url;
		}
	})
	.bind('loaded.jstree open_node.jstree', function(event) {//绑定树的事件:初始化和打开节点
		var nodes = $('#tree').find("li");
		nodes.each(function(){
			var li = $(this);
			//初始展开根部门,并替换掉根部门图片
			if(li.attr("type")=="root"){
				var icon = $($(li.find("a")[0]).find("ins")[1]);//有checkbox就取第1个ins否则去第0个ins
				icon.removeClass("jstree-icon").addClass("jstree-root");
				if(nodes.length==1){
					$("#tree").jstree("open_node", li);
				}
			}
			//注销的部门为红色
			if(li.attr("color")!=undefined){
				li.find("a").css("color",li.attr("color"));
			}
		});
	});
}
function del(){ 
	var vals="";
	for(var i in a.nodes){
		if(a.nodes[i].checked)
			vals += a.nodes[i].id.substr(1)+",";
	}
	document.forms[0].action = document.forms[0].action+"?depts="+vals;
	document.forms[0].submit();
} 
</script>
</head>

<body class="right_date_body" onload="loadTree()">
<div class="bmgl_div">
<div class="right_date_top_nav" style="display: none;">
	<ul>
		<li class="del"><a href="#" onclick="del()">删除</a></li>
	</ul>
</div>
</div>
<form method="post" action="departmentdelete.do" name="form1">
<div class="cdgl_div">
	<div id="tree" class="bmgl_left">
<!--		<script language="JavaScript">-->
<!--			var data={};-->
<!--			data["-1_1"] = "text: /根部门; XMLData: ../department/select.do?pid=0;url: ../userinfo/select.do";-->
<!--		</script>-->
<!--*start*-->

<!--*end*-->
	</div>
</div>
</form>
</body>

</html>

