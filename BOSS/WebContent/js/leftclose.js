// �ر��������
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
		obj.title="�ر��������";
	}else{
		parent.main.cols="0,*";
		displayBar=true;
		obj.src="images/icon/leftopen.gif";
		obj.title="���������";
	}
}