<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门列表</title>
<%@include file="../../jspheader/jquery_header.jsp" %>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.jstree.js"></script>
<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle2.css"/>
<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle.css"/>
<script language="JavaScript">
window.resizeTo(400,750); 
</script>
<script type="text/javascript">
	var usrs=window.location.search;
	var stcstr=new Array();
	var stkey=new Array();
	var st=new Array();
	var stc;
	if(usrs.indexOf("?")!=-1){
		stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);
		if(stc.indexOf("&")!=-1){
			stcstr=stc.split("&");
			for(var i=0; i<stcstr.length; i++){
				stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));
				st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);
			}
		}else{
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);
			stkey[0]=stc.substring(0,stc.lastIndexOf("="));
			st[0]=stc.substring(stc.indexOf("=")+1,stc.length);
		}
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
				"url" : "select.do",
				"data" : function (n) {
					return {
						pid : n.attr ? n.attr("id") : 0,
						act : 0,
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
		if (eventNodeName == 'INS') { 
			return; 
		} else if (eventNodeName == 'A') { 
			var $subject = $(event.target).parent(); 
			if ($subject.find('ul').length > 0) {//枝节点
			} else { //叶节点
			} 
		}
	})
	.bind('loaded.jstree open_node.jstree', function(node , callback , skip_animation) {//绑定树的事件:初始化和打开节点
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
function subf(){
	var vals="";
	$(".jstree-checked").each(function(i, element){
		vals = vals + $(element).attr("id") + ",";//jQuery代码获得以空格隔开的checkbox被选中的项的ID串
	});
	
	document.getElementById("department").value=vals;
	var formName;
	var nameInput;
	var idInput;
	for(var i=0;i<stkey.length;i++){
		if(stkey[i]=="formname"){
			formName=st[i];
		}else if(stkey[i]=="nameinput"){
			nameInput=st[i];
		}else if(stkey[i]=="idinput"){
			idInput=st[i];
		}
	}
	document.forms[0].action=document.forms[0].action+"?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
	document.forms[0].submit();
}
</script>

<base target="_self" />
</head>
<body class="right_date_body" scroll="auto" onload="loadTree();">
<form method="post" action="departmentstreeok.jsp" name="form1">
	<div class="bmgl_div">
		<div id="tree" class="open_left">
		</div>
	</div>
	<center>
		<input type="hidden" id="department" name="department" value=""/>
		<input type="button" name="submit" onclick="subf()" value="&nbsp;确&nbsp;定&nbsp;"/>
		<input type="reset" name="reset" value="&nbsp;重&nbsp;置&nbsp;"/>
	</center>	
</form>
</body>
</html>

