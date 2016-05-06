// 关闭左侧区域
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("images/icon/leftclose.gif");
var displayBar=false;
function LeftcloseBar(obj)
{
	if (displayBar)
	{
		parent.main.cols="170,*";
		displayBar=false;
		obj.src="images/icon/leftclose.gif";
		obj.title="关闭左侧区域";
	}else{
		parent.main.cols="0,*";
		displayBar=true;
		obj.src="images/icon/leftopen.gif";
		obj.title="打开左侧区域";
	}
}