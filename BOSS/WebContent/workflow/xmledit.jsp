<%@ page contentType="text/html; charset=GBK"%>  
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />

<title>流程管理</title>
<link href="workflow.css" rel="stylesheet" type="text/css" />
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/jquery-1.4.1.js" type="text/javascript"></script>
<style type="text/css">
.right_date{width:100%;height:99%;padding:2px 2px 2px 2px;background-color:#FFFFFF;border:1px solid #6c92ad;}
</style>
<script language="JavaScript">
	xmlName = '';
	function pageLoad(){
		xmlName = location.href.substring(location.href.indexOf('=')+1);
		XMLHttp.sendReq('POST','xmledit.do?name='+xmlName,'',resultXml);
	}
	function resultXml(xmlObject){
		var xmlDoc = xmlObject.responseXML;
		var nodeList = $('#nodelist');
		//add start node
		$(xmlDoc).find('process > start').each(function(){
			var optValue = $(this).attr('name');
			var nodeOption = $('<option value=\''+optValue+'\' >'+optValue+'(Start)</option>');
			nodeList.append(nodeOption);
		});
		//add task node
		$(xmlDoc).find('process > task').each(function(){
			var optValue = $(this).attr('name');
			var nodeOption = $('<option value=\''+optValue+'\' >'+optValue+'(Task)</option>');
			nodeList.append(nodeOption);
		});
		//add end node
		$(xmlDoc).find('process > end').each(function(){
			var optValue = $(this).attr('name');
			var nodeOption = $('<option value=\''+optValue+'\'>'+optValue+'(End)</option>');
			nodeList.append(nodeOption);
		});
		$('#nodelist').dblclick(function(){
			var selectNode;
			var nodeName = $('#nodelist').get(0).value;
			$(xmlDoc).find('process > *').each(function(){
				if($(this).attr('name')==nodeName){
					selectNode = $(this);
				}
			});
			showNodeInfo(selectNode);
			showNextNode(selectNode);
			showSaveButton();
		});
	}
	
	function showNodeInfo(selectNode){
		var nodeInfo = $('#nodeinfo');
		nodeInfo.empty();
		nodeInfo.append('<input type="hidden" id="currentname" value="'+selectNode.attr('name')+'" />');
		var nName = $('<span>名&nbsp;&nbsp;称:&nbsp;<input type="text" id="nname" value="'+selectNode.attr('name')+'" /></span><br />');
		nodeInfo.append(nName);
		if(selectNode.attr('assignee')!=null){
			var nAssignee = $('<span>参与者:&nbsp;<input type="text" id="nassignee" value="'+selectNode.attr('assignee')+'" /></span><br />');
			nodeInfo.append(nAssignee);
		}
	}
	function showNextNode(selectNode){
		var nextNode = $('#nextnode');
		nextNode.empty();
		if(selectNode.children().length != 0) {
			nextNode.append('<span>后续节点:</span><br/>');
			nextNode.append('<select style="width:220px;" id="nextselect" size="5"></select>');
			$(selectNode).find('transition').each(function(){
				var option = $('<option>' + $(this).attr('to') + '</option>');
				nextNode.children('#nextselect').append(option);
			});
		}
	}
	function showSaveButton(){
		var saveButton = $('#savebutton');
		saveButton.empty();
		saveButton.append('<input type="button" value="保存" onclick="saveNode()" style="margin:10px 0 0 90px;"/>');
	}
	function saveNode(){
		var name = $('#nname').attr('value');
		var cname = $('#currentname').attr('value');
		var assignee ='N/A';
		if($('#nassignee').length!=0)
			var assignee = $('#nassignee').attr('value');
		XMLHttp.sendReq('POST','savenode.do','xml='+xmlName+'&cname='+cname+'&name='+name+'&assignee='+assignee,saveResult);
	}
	function saveResult(xmlObject){
		xmlDoc = xmlObject.responseXML;
		if($(xmlDoc).find('returnResult > result').attr('return')=="success")
			alert("保存成功");
		window.location.reload();
	}
</script>
</head>

<body onload="pageLoad()">
<div id="message_box"></div>
<div class="right_date">
<div style="width:560px;margin:20px 0 0 0;">
	<div style="float:left;width:200px;">
		<select id="nodelist" size="12" style="width:160px;"></select>
	</div>
	<div style="float:left;width:280px;">
		<div id="nodeinfo" style="height:55px;"></div>
		<div id="nextnode" style="height:100px;"></div>
		<div id="savebutton"></div>
	</div>
</div>
</div>
</body>
</html>
