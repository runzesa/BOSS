<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>菜单管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="../css/style.css" rel=stylesheet type=text/css />
<%@include file="../../jspheader/jquery_header.jsp" %>
	<script type="text/javascript" src="../../js/jquery.jstree.js"></script>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle2.css"/>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle.css"/>
	<script language="JavaScript">
	</script>
	<script type="text/javascript">
		var usrs=window.location.search;//获取？号后的值
		var stcstr=new Array();//定义数组保存获取的URL信息
		var stkey=new Array();
		var st=new Array();
		var stc;
		if(usrs.indexOf("?")!=-1){
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
			if(stc.indexOf("&")!=-1){//处理多个参数
				stcstr=stc.split("&");  
				for(var i=0; i<stcstr.length; i++){
					stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));//截取=号前的字串
					st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);//截取=号后的字串
				}
			}else{
				stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
				stkey[0]=stc.substring(0,stc.lastIndexOf("="));//截取=号前的字串
				st[0]=stc.substring(stc.indexOf("=")+1,stc.length);//截取=号后的字串
			}
		}
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
					"<content><name>根目录</name></content>" +
					"</item>" +
				"</root>",
			"ajax" : {
				"url" : "select.do",
				"data" : function (n) {
					return {
						pid : n.attr ? n.attr("id") : 0,
						rand : new Date().getTime()
				}}
			},
			"xsl" : "nest"
		},
		"core" : { "animation" : 100 } ,
		"plugins" : [ "themes", "xml_data" ],
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
				
				var itemId = $(event.target).parents('li').attr('id');
				var itemName = $(event.target).parents('li').attr('item_name');
				if(itemId!="0" && itemId!="spe" && itemId!="def" && itemName && itemName!=""){//跳转到ok页面
					var url = "../module2/module2treeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
					url += "&id="+itemId+"&name="+encodeURI(encodeURI(itemName));
					window.location.href = url;
				}
			} 
		}
	})
	.bind('loaded.jstree open_node.jstree', function(node , callback , skip_animation) {//绑定树的事件:初始化和打开节点
		var nodes = $('#tree').find("li");
		nodes.each(function(){
			var li = $(this);
			//初始展开根部门,并替换掉根部门图片
			if(li.attr("type")=="root"){
				var icon = $($(li.find("a")[0]).find("ins")[0]);//有checkbox就取第1个ins否则去第0个ins
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
</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="loadTree()">
<form method="post" action="leftdelete.do" name="form1">
<div class="cdgl_div">
	<div class="bmgl_left" id="tree">
		<!--script language="JavaScript">
			var data={};
			data["-1_1"] = "text: /根目录; XMLData: select.do?pid=0&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
			Using("System.Web.UI.WebControls.MzTreeView");
		</script-->
	</div>
</div>
</form>
</body>
</html>

