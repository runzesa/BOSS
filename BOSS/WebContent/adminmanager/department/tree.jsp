<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>���Ź���</title>
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
		alert("�����ɹ���");
	}else{
		alert("����ʧ�ܣ�");
	}
	if(result=='null'){
	
	}else if(result="true"){
		alert("ɾ���ɹ���");
	}else{
		alert("ɾ��ʧ�ܣ�");
	}
</script>
<script type="text/javascript">
function loadTree(){
	//����ͼƬĿ¼
	$.jstree._themes = "../../images/jstree/";
	$("#tree").jstree({
		"xml_data" : {
			"data" : ""+
			"<root>" +
				"<item id='0' state='closed' type='root'>" +
				"<content><name>������</name></content>" +
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
	.bind('click.jstree', function(event) {//�����¼�:���
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
	.bind('loaded.jstree open_node.jstree', function(event) {//�������¼�:��ʼ���ʹ򿪽ڵ�
		var nodes = $('#tree').find("li");
		nodes.each(function(){
			var li = $(this);
			//��ʼչ��������,���滻��������ͼƬ
			if(li.attr("type")=="root"){
				var icon = $($(li.find("a")[0]).find("ins")[1]);//��checkbox��ȡ��1��ins����ȥ��0��ins
				icon.removeClass("jstree-icon").addClass("jstree-root");
				if(nodes.length==1){
					$("#tree").jstree("open_node", li);
				}
			}
			//ע���Ĳ���Ϊ��ɫ
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
		<li class="del"><a href="#" onclick="del()">ɾ��</a></li>
	</ul>
</div>
</div>
<form method="post" action="departmentdelete.do" name="form1">
<div class="cdgl_div">
	<div id="tree" class="bmgl_left">
<!--		<script language="JavaScript">-->
<!--			var data={};-->
<!--			data["-1_1"] = "text: /������; XMLData: ../department/select.do?pid=0;url: ../userinfo/select.do";-->
<!--		</script>-->
<!--*start*-->

<!--*end*-->
	</div>
</div>
</form>
</body>

</html>

