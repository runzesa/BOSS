<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>�˵�����</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="../css/style.css" rel=stylesheet type=text/css />
<%@include file="../../jspheader/jquery_header.jsp" %>
	<script type="text/javascript" src="../../js/jquery.jstree.js"></script>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle2.css"/>
	<link type="text/css" rel="stylesheet" href="../../css/jstree/!treestyle.css"/>
	<script language="JavaScript">
	</script>
	<script type="text/javascript">
		var usrs=window.location.search;//��ȡ���ź��ֵ
		var stcstr=new Array();//�������鱣���ȡ��URL��Ϣ
		var stkey=new Array();
		var st=new Array();
		var stc;
		if(usrs.indexOf("?")!=-1){
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//��ȡ?�ŵ��ִ�
			if(stc.indexOf("&")!=-1){//����������
				stcstr=stc.split("&");  
				for(var i=0; i<stcstr.length; i++){
					stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));//��ȡ=��ǰ���ִ�
					st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);//��ȡ=�ź���ִ�
				}
			}else{
				stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//��ȡ?�ŵ��ִ�
				stkey[0]=stc.substring(0,stc.lastIndexOf("="));//��ȡ=��ǰ���ִ�
				st[0]=stc.substring(stc.indexOf("=")+1,stc.length);//��ȡ=�ź���ִ�
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
	//����ͼƬĿ¼
	$.jstree._themes = "../../images/jstree/";
	
	$("#tree").jstree({
		"xml_data" : {
			"data" : ""+
				"<root>" +
					"<item id='0' state='closed' type='root'>" +
					"<content><name>��Ŀ¼</name></content>" +
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
	.bind('click.jstree', function(event) {//�����¼�:���
		var eventNodeName = event.target.nodeName; 
		if (eventNodeName == 'INS') { 
			return; 
		} else if (eventNodeName == 'A') { 
			var $subject = $(event.target).parent(); 
			if ($subject.find('ul').length > 0) {//֦�ڵ�
			} else { //Ҷ�ڵ�
				
				var itemId = $(event.target).parents('li').attr('id');
				var itemName = $(event.target).parents('li').attr('item_name');
				if(itemId!="0" && itemId!="spe" && itemId!="def" && itemName && itemName!=""){//��ת��okҳ��
					var url = "../module2/module2treeok.jsp?formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
					url += "&id="+itemId+"&name="+encodeURI(encodeURI(itemName));
					window.location.href = url;
				}
			} 
		}
	})
	.bind('loaded.jstree open_node.jstree', function(node , callback , skip_animation) {//�������¼�:��ʼ���ʹ򿪽ڵ�
		var nodes = $('#tree').find("li");
		nodes.each(function(){
			var li = $(this);
			//��ʼչ��������,���滻��������ͼƬ
			if(li.attr("type")=="root"){
				var icon = $($(li.find("a")[0]).find("ins")[0]);//��checkbox��ȡ��1��ins����ȥ��0��ins
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
</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="loadTree()">
<form method="post" action="leftdelete.do" name="form1">
<div class="cdgl_div">
	<div class="bmgl_left" id="tree">
		<!--script language="JavaScript">
			var data={};
			data["-1_1"] = "text: /��Ŀ¼; XMLData: select.do?pid=0&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
			Using("System.Web.UI.WebControls.MzTreeView");
		</script-->
	</div>
</div>
</form>
</body>
</html>

