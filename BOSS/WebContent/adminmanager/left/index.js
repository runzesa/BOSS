var index_data = "";//顺序
var subtype="";//提交类型:更新/新增

var selectId = null;

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
		"plugins" : [ "themes", "xml_data", "checkbox", "crrm" ],
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
			var itemId = $(event.target).parents('li').attr('id');
			update(itemId);
			changebk(event.target);
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

/**
 * ok删除
 */
function del(){ 
	var vals="";
    $(".jstree-checked").each(function(i, element){
    	vals = vals + $(element).attr("id") + ",";  //jQuery代码获得以空格隔开的checkbox被选中的项的ID串
    });
	document.forms[0].action = document.forms[0].action+"?depts="+vals;
	document.forms[0].submit();
} 

/**
 * ok点击菜单后右侧显示对应菜单数据
 * @param pid 菜单id
 */
function update(pid){
	subtype="update";
	//非根节点
	if(pid!=null && pid!=undefined && pid!="0"){
		XMLHttp_Jquery.sendReq('GET', "../left/leftupdateselect.do?leftid="+pid, '', function(xmlObject){
			//alert(xmlObject.responseText)
			var xml = xmlObject.responseXML;
			var bean = xml.getElementsByTagName("bean");
			if(bean.length==1){
				addData(bean[0]);
			}
		});
	}else{
		addData0();
	}
}

/**
 * ok把菜单数据放到右侧页面
 * @param bean 数据库取到的数据集
 */
function addData(bean){
	document.getElementById("tr1").style.display="none";
	document.getElementById("tr0").style.display="none";
	document.getElementById("tr2").style.display="";
	document.getElementById("tr3").style.display="";
	document.getElementById("tr4").style.display="";
	document.getElementById("tr5").style.display="";
	document.getElementById("bottom").style.display="";
	
	var id = bean.getAttribute("id");
	var name = bean.getAttribute("name");
	var rownum = bean.getAttribute("rownum");
	var urlname = bean.getAttribute("urlname");
	var url = bean.getAttribute("url");
	var target = bean.getAttribute("target");
	var leftid = bean.getAttribute("leftid");
	var index = bean.getAttribute("index");
	index_data = index;
	
	document.getElementById("id").value=id;
	document.getElementById("name").value=name;
	if(index==null || index=="" || index==undefined)
		document.getElementById("index_x").value=rownum;
	else
		document.getElementById("index_x").value=index;
		
	document.getElementById("index_x").disabled=false;
	document.getElementById("sel").disabled=false;
	document.getElementById("target").disabled=false;
	document.getElementById("name").disabled=false;
	
	document.getElementById("rownum").value=rownum;
	document.getElementById("urlName").value=urlname;
	document.getElementById("url").value=url;
	var sels = document.getElementById("target");
	for(var i=0;i<sels.options.length;i++){
		if(sels.options[i].value==target)
			sels.options[i].selected="selected";
	}
	if(rownum!=null && rownum.split(".").length<3)
		document.getElementById("add2").onclick=returnFunction(id);
	else
		document.getElementById("add2").onclick=returnFunction(undefined);
}

/**
 * ok点击根节点,显示根节点的默认数据
 */
function addData0(){
	document.getElementById("tr1").style.display="none";
	document.getElementById("tr0").style.display="none";
	document.getElementById("tr2").style.display="";
	document.getElementById("tr3").style.display="";
	document.getElementById("tr4").style.display="";
	document.getElementById("tr5").style.display="";
	document.getElementById("bottom").style.display="none";
	
	document.getElementById("id").value=0;
	document.getElementById("name").value="根节点";
	document.getElementById("name").disabled=true;
	document.getElementById("index_x").value="00";
	document.getElementById("index_x").disabled=true;
	document.getElementById("rownum").value="00";
	document.getElementById("sel").disabled=true;
	document.getElementById("urlName").value="";
	document.getElementById("url").value="";
	
	document.getElementById("target").disabled=true;
	
	document.getElementById("add2").onclick=returnFunction(0);
}

/**
 * ok返回方法,新增
 * @param id
 * @return
 */
function returnFunction(id){
	return function(){
		newleft(id);
	}
}

/**
 * ok新增菜单
 * @param pid 父菜单id
 */
function newleft(pid){
	subtype="new";
	if(pid!=null && pid!=undefined){
		XMLHttp_Jquery.sendReq('GET', "../left/leftinsertselect.do?parentid="+pid, '', addInsertSelectData);
	}else{
		alert("请先选择菜单！最大只支持三级菜单！");
	}
}

/**
 * ok清空表单.把读取到得数据放到表单里
 * @param xmlObject ajax请求到的数据
 */
function addInsertSelectData(xmlObject){
	var xml = xmlObject.responseXML;
	var root = xml.getElementsByTagName("root");
	if(root.length==1){
		root = root[0];
		
		var parentId = root.getAttribute("parentId");
		var parentName = root.getAttribute("parentName");
		var rownum = root.getAttribute("rownum");
		var index = root.getAttribute("index");
		index_data = index;
		
		document.getElementById("parent").value = parentId;
		document.getElementById("parentName").innerHTML = "&nbsp;"+parentName;
		document.getElementById("index_x").value = index;
		document.getElementById("rownum").value = rownum;
		
		document.getElementById("tr1").style.display="";
		document.getElementById("bottom").style.display="";
		
		document.getElementById("index_x").disabled=false;
		document.getElementById("sel").disabled=false;
		document.getElementById("target").disabled=false;
		document.getElementById("name").disabled=false;
	
		document.getElementById("name").value="";
		document.getElementById("urlName").value="";
		document.getElementById("url").value="";
		document.getElementById("target").options[0].selected="selected";
	}
}

/**
 * ok点击提交,验证顺序是否正确
 */
function sub(){
	var index = document.getElementById("index_x").value;
	var reg = /^\d{1,2}$/;
	var index2 = index_data;
	if(reg.test(index)){
		if(index<10 && index.length<2){
			index = "0"+index;
		}
		var rownum = document.getElementById("rownum").value;
		rownum = rownum.substr(0,rownum.lastIndexOf(index2))+index;
		XMLHttp_Jquery.sendReq('GET', 'checkIndex.do?rownum='+rownum, '', req);
	}else{
		alert("菜单顺序输入错误！");
    }
}

/**
 * ok根据若菜单顺序正确则保存
 * @param xmlObject 是否菜单顺序正确
 */
function req(xmlObject){
	var index = document.getElementById("index_x").value;
	var reg = /^\d{1,2}$/;
	var index2 = index_data;
	if(index<10 && index.length<2){
		index = "0"+index;
	}
	var rownum = document.getElementById("rownum").value;
	rownum = rownum.substr(0,rownum.lastIndexOf(index2))+index;
	var bool = false;
	if(xmlObject.responseText=="false" && index!=index2){
		alert("已存在当前序号,请重新填写！");
		document.getElementById("index_x").focus();
		return;
	}else{
		bool=true;
	}
	if(bool){
		if(subtype=="update"){
			document.getElementById("rownum").value=rownum;
			
			var v_id = document.getElementById("id").value;
			var v_name = document.getElementById("name").value;
			v_name=encodeURI(v_name);
			var v_rowNum = document.getElementById("rownum").value;
			var v_url = document.getElementById("url").value;
			var v_target = document.getElementById("target").value;
			var dataStr = "id="+v_id+"&name="+ v_name+"&rownum="+v_rowNum+"&url="+v_url+"&target="+v_target;
			XMLHttp_Jquery.sendReq('GET', 'leftupdate.do?'+dataStr, '', function(xmlObject){
				var root = xmlObject.responseXML.getElementsByTagName("root");
				if(root.length==1 && root[0].getAttribute("bool")=="true"){
					alert("保存成功！");
					updateTree();
				}
			});
    	}else{
    		
			var name = document.getElementById("name").value;
			var parent = document.getElementById("parent").value;
			var rowNum = document.getElementById("rownum").value;
			var url = document.getElementById("url").value;
			var target = document.getElementById("target").value;
			name=encodeURI(name);
			
	    	var sendData = "name="+name+"&parent="+parent+"&rownum="+rowNum+"&url="+url+"&target="+target;
	    	
			XMLHttp_Jquery.sendReq('GET', 'leftinsert.do?'+sendData, '', function(xmlObject){
				var root = xmlObject.responseXML.getElementsByTagName("root");
				if(root.length==1 && root[0].getAttribute("bool")=="true"){
					alert("保存成功！");
					updateTree2(root[0].getAttribute("id"));
				}
			});
    	}
	}
}

/**
 * ok更新后刷新树的更新的节点
 */
function updateTree(){
	var v_id = document.getElementById("id").value;
	if(v_id==null || v_id=="")
		return;
	var v_name = document.getElementById("name").value;
	$("#tree").jstree('set_text', "#"+v_id , v_name );
}

/**
 * ok新增后将新增的节点添加到树
 * 此处有bug,若有节点A,B,C;B节点下有b1和b2,
 * 		点开B节点,此时再点击A节点往A节点下添加子节点,子节点会挂在B节点下,即便B已经合住,新增的节点依旧会挂在B节点下,但实际数据无误,刷新界面即可正常
 * @param id 节点的id
 */
function updateTree2(id){
	var v_parent = document.getElementById("parent").value;
	var v_name = document.getElementById("name").value;
	
	$("#tree").jstree("create","#"+v_parent,"last",{"data":v_name, attr:{"id": id}},false,true);
}

/**
 * ok点击节点更改背景色
 * @param bk font元素
 */
function changebk(bk){
	var v_id = $(bk).parents('li').attr('id');
	if(selectId==null || selectId!=v_id){
		$(bk).css("background","#000080").css("color","#ffffff");
		$("#"+selectId).children("a").css("background","#ffffff").css("color","#000080");
		
		selectId = v_id;
	}
}


