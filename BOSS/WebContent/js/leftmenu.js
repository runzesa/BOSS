var activeMenu = null;
var activeItem = null;
function AlicnMenu(){
    var value = null;
    var children = [];
    this.bindData = function(data){
        value = data;
    };
    this.draw = function(parentObj){
        for (var i = 0; i < value.length; i++) {
            var nodeElement = window.document.createElement("div");
            nodeElement.id = "menu_" + value[i].id;
            nodeElement.className = "menu";
            var statelink = window.document.createElement("a");
            statelink.id = "statelink_" + value[i].id;
            setStatueImg(value[i], statelink, true)
            var namelink = window.document.createElement("a");
            namelink.id = "menu" + value[i].id;
            namelink.className = "linkItem";
            if (value[i].children.length != 0) {
                statelink.href = namelink.href = 'javascript:menuClick("' + value[i].id + '",1)';
            }
            else {
                if (value[i].url && value[i].url != "#" && value[i].url != "") 
                    namelink.href = value[i].url;
                /*在右边显示或者新弹出页面*/
                if (value[i].target && value[i].target == "rightFrame" && value[i].target != "") 
                    namelink.target = "rightFrame";
                if (value[i].target && value[i].target == "_blank" && value[i].target != "") 
                    namelink.target = "_blank";
            }
            namelink.innerHTML = value[i].name;
            nodeElement.appendChild(statelink);
            nodeElement.appendChild(namelink);
            if (value[i].statusIcon) {
                var floatImg = window.document.createElement("img");
                floatImg.src = value[i].statusIcon;
                floatImg.alt = '新';
                floatImg.align = "absmiddle";
                nodeElement.appendChild(floatImg);
            }
            parentObj.appendChild(nodeElement);
            if (value[i].children.length != 0) {
                drawChildren(value[i], parentObj);
            }
        }
    };
    this.setActivedItem = function(nodeId){
        //document.write(document.all.tree1.innerHTML)
        if (document.getElementById("statelink_" + nodeId) != null) {
            var namelink = document.getElementById("statelink_" + nodeId);
            if (namelink.parentNode.className == "menu") {//当前为menu
                namelink.parentNode.className = "indexmenu";
                return;
            }
            namelink.parentNode.className = "selectItem2";
            if (namelink.parentNode.parentNode.className == "itembox") {
                var nodeId = namelink.parentNode.parentNode.id.replace("children_", "")
                setStateImg(nodeId, "collapse")
                namelink.parentNode.parentNode.style.display = "block";
                activeMenu = namelink.parentNode.parentNode;
            }
            if (namelink.parentNode.parentNode.parentNode.className == "itembox") {
                namelink.parentNode.parentNode.parentNode.style.display = "block";
                var nodeId = namelink.parentNode.parentNode.parentNode.id.replace("children_", "")
                setStateImg(nodeId, "collapse")
                activeMenu = namelink.parentNode.parentNode.parentNode;
                getObj("menu_" + nodeId).className = "activedmenu";//arrow
            }
        }
    }
}

function getObj(str){
    return document.getElementById(str);
}

function drawChildren(value, nodeElement, rootname){
    var childrenElement = null;
    childrenElement = window.document.createElement("div");
    childrenElement.id = "children_" + value.id;
    childrenElement.className = "itembox";
    for (var i = 0; i < value.children.length; i++) {
        var childElement = window.document.createElement("div");
        var statelink = window.document.createElement("a");
        statelink.id = "statelink_" + value.children[i].id;
        childElement.className = "item2";
        //加入onclick事件,當點擊鏈接後變更鏈接的背景並更改其餘的鏈接背景為默認
        childElement.onclick=function(){
        	var _divs = document.getElementsByTagName("div");
        	if(event.srcElement.tagName=="A" && event.srcElement.href.indexOf("javascript")!=0){
        		for(var j=0;j<_divs.length;j++){
        			_divs[j].style.backgroundColor="";
        			if(_divs[j].firstChild.tagName=="A"){
        				if(_divs[j].firstChild.href.indexOf("javascript")!=0)
        					_divs[j].style.borderWidth="0px";
        			}
        		}
        		event.srcElement.parentElement.style.backgroundColor="#FFFFFF";
        		event.srcElement.parentElement.style.borderWidth="1px";
				event.srcElement.parentElement.style.borderRightWidth="0px";
        		event.srcElement.parentElement.style.borderStyle="solid";
        		event.srcElement.parentElement.style.borderColor="#6c92ad";
        	}
        }
        var namelink = window.document.createElement("a");
        namelink.id = "namelink_" + value.children[i].id;
        if (value.children[i].children.length > 0) {
            statelink.href = namelink.href = 'javascript:menuClick("' + value.children[i].id + '",2)';
        	//statelink.href = namelink.href = 'javascript:alert(1)';
        }else {
            if (value.children[i].url && value.children[i].url != "#" && value.children[i].url != "") 
                namelink.href = value.children[i].url;
            /*在右边显示或者新弹出页面*/
            if (value.children[i].target && value.children[i].target == "rightFrame" && value.children[i].target != "")
            	namelink.target = "rightFrame";
            if (value.children[i].target && value.children[i].target == "_blank" && value.children[i].target != "") 
                namelink.target = "_blank";
        }
        setStatueImg(value.children[i], statelink, false)
        namelink.innerHTML = value.children[i].name;
        childElement.appendChild(statelink);
        childElement.appendChild(namelink);
        childrenElement.appendChild(childElement);
        if (value.children[i].children.length > 0) {
            drawChildren(value.children[i], childrenElement, value.name);
        }
        /*tip仅供非一级菜单*/
        if (document.all && value.children[i].tips) {
            tipsDiv = window.document.createElement("div");
            tipsDiv.innerHTML = "<div><div class='left'>" + value.children[i].tips + "<\/div><div class='right'><img src='images/icon/close.gif' alt='' style='cursor:pointer;' onclick='this.parentNode.parentNode.parentNode.className=\"hidebox\"'/><\/div>";
            tipsDiv.className = "myaliMenuTips";
            childElement.appendChild(tipsDiv);
        }
        if (document.all && value.children[i].statusIcon) {
            var floatImg = window.document.createElement("img");
            floatImg.src = value.children[i].statusIcon;
            floatImg.alt = '新';
            floatImg.align = "absmiddle";
            childElement.appendChild(floatImg);
        }
    }
    childrenElement.style.display = "none";
    nodeElement.appendChild(childrenElement);
}

function setStatueImg(value, statelink, flag){//flag代表叶子节点是否出现leaf.gif
    if (value.children.length > 0) {
        statelink.innerHTML = "<img src='images/icon/expand.gif' border=0 align='absmiddle' style='cursor:hand'>";
        return;
    }
    else {
        statelink.innerHTML = "<img src='images/icon/leaf.gif' border=0 align='absmiddle' style='cursor:hand'>";
        return;
    }
}

function menuClick(nodeId, flag){

    if (flag == 1) {//click menu
        if (getObj("children_" + nodeId).style.display == "none") {
            getObj("children_" + nodeId).style.display = "block";
            setStateImg(nodeId, "collapse")
            if (activeMenu != null) {
                activeMenu.style.display = "none";
                setStateImg((activeMenu.id).replace("children_", ""), "expand")
                getObj("menu_" + (activeMenu.id).replace("children_", "")).className = "menu";//arrow
            }
            getObj("menu_" + nodeId).className = "activedmenu";//arrow
            activeMenu = getObj("children_" + nodeId);
            return;
        }
        else {
            getObj("children_" + nodeId).style.display = "none";
            setStateImg(nodeId, "expand");
            getObj("menu_" + nodeId).className = "menu";//arrow
            activeMenu = null;
            return;
        }
    }
    if (flag == 2) {
        if (getObj("children_" + nodeId).style.display == "none") {
            getObj("children_" + nodeId).style.display = "block";
            getObj("statelink_" + nodeId).innerHTML = "<img src='images/icon/collapse.gif' border=0 align='absmiddle' style='cursor:hand'>";
            if (activeItem != null) {
                activeItem.style.display = "none";
                setStateImg((activeItem.id).replace("children_", ""), "expand");
            }
            activeItem = getObj("children_" + nodeId);
            return;
            activeItem.className = "item";
            //activeItem=document.getElementById("namelink_"+nodeId);
            //document.getElementById("namelink_"+nodeId).className="selectItem";
        }
        else {
            document.getElementById("children_" + nodeId).style.display = "none";
            document.getElementById("statelink_" + nodeId).innerHTML = "<img src='images/icon/expand.gif' border=0 align='absmiddle' style='cursor:hand'>";
            activeItem = null;
            return;
            activeItem.className="item2";
            //activeItem=document.getElementById("namelink_"+nodeId);
            //document.getElementById("namelink_"+nodeId).className="selectItem";
        }
    }


}

function setStateImg(nodeId, state){
    //alert(nodeId)
    if (document.getElementById("statelink_" + nodeId)) {
    }
    else 
        return;
    var statelink = document.getElementById("statelink_" + nodeId);
    if (state == "collapse") {
        if (statelink.parentNode.className == "menu") 
            statelink.parentNode.className = "activedmenu"
        statelink.innerHTML = "<img src='images/icon/collapse.gif' border=0 align='absmiddle' style='cursor:hand'>";
        return;
    }
    if (state == "expand") {
        statelink.innerHTML = "<img src='images/icon/expand.gif' border=0 align='absmiddle' style='cursor:hand'>";
        return;
    }
    return;
}

function treeInit(){
    //菜单控件初始化
    var menu = null;
    var parent1 = document.getElementById("tree1");
    menu = new AlicnMenu();
    menu.bindData(roots.menu);
    menu.draw(parent1);
    //设置当前高亮菜单
	try {
    	menuClick(0, 1);
	} catch (e) {}
    menu.setActivedItem("1");
    //菜单高度自适应
    if (document.getElementById("leftmenu") && document.getElementById("content") && document.getElementById("content").offsetHeight) {
        if (document.getElementById("content").offsetHeight > document.getElementById("leftmenu").offsetHeight + 150) {
            if (document.all) {
                document.getElementById("leftmenu").style.height = document.getElementById("content").offsetHeight;
            }
            else {
                document.getElementById("leftmenu").setAttribute("style", "height:" + document.getElementById("content").offsetHeight + "px")
            }
        }
    }
}
