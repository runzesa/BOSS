
// 顶部关闭
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("images/blue/topclose-list.gif");
var displayBar=false;
function TopcloseBar(obj)
{
	if (displayBar)
	{
		parent.zt.rows="69,15,*,22";
		displayBar=false;
		obj.src="images/blue/topclose-list.gif";
		obj.title="关闭上侧区域";
	}
	else{
		parent.zt.rows="0,15,*,22";
		displayBar=true;
		obj.src="images/blue/topopen-list.gif";
		obj.title="打开上侧区域";
	}
}

// 关闭左侧区域
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("images/blue/close_list.gif");
var displayBar=false;
function LeftcloseBar(obj)
{
	if (displayBar)
	{
		parent.main1.cols="180,11,*";
		displayBar=false;
		obj.src="images/blue/close_list.gif";
		obj.title="关闭左侧区域";
	}
	else{
		parent.main1.cols="0,11,*";
		displayBar=true;
		obj.src="images/blue/open_list.gif";
		obj.title="打开左侧区域";
	}
}

//左侧菜单收缩
var mh = 25;//最小高度 
var step = 10;//每次变化的px量 
var ms = 10;//每隔多久循环一次 
function toggle(o){ 
  if (!o.tid)o.tid = "_" + Math.random() * 100; 
  if (!window.toggler)window.toggler = {}; 
  if (!window.toggler[o.tid]){ 
    window.toggler[o.tid]={ 
      obj:o, 
      maxHeight:o.offsetHeight, 
      minHeight:mh, 
      timer:null, 
      action:1 
    }; 
  } 
  o.style.height = o.offsetHeight + "px"; 
  if (window.toggler[o.tid].timer)clearTimeout(window.toggler[o.tid].timer); 
  window.toggler[o.tid].action *= -1; 
  window.toggler[o.tid].timer = setTimeout("anim('"+o.tid+"')",ms ); 
} 
function anim(id){ 
  var t = window.toggler[id]; 
  var o = window.toggler[id].obj; 
  if (t.action < 0){ 
    if (o.offsetHeight <= t.minHeight){ 
      clearTimeout(t.timer); 
      return; 
    } 
  } 
  else{ 
    if (o.offsetHeight >= t.maxHeight){ 
      clearTimeout(t.timer); 
      return; 
    } 
  } 
  o.style.height = (parseInt(o.style.height, 10) + t.action * step) + "px"; 
  window.toggler[id].timer = setTimeout("anim('"+id+"')",ms ); 
} 

//top弹出窗口
function MM_openBrWindow(theURL,winName,features) { //v2.0
window.open(theURL,winName,features);
}