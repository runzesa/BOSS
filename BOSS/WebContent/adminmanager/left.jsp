<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Menu</title>
</head>

<body topmargin="0" leftmargin="0" scroll="auto">
<script src="css/taskmenu.js"></script>
<script>
TaskMenu.setStyle("css/taskmenu.css"); 

window.onload = function()
{
	TaskMenu.setHeadMenuSpecial(true);
	//TaskMenu.setScrollbarEnabled(true);
	//TaskMenu.setAutoBehavior(false);
	item1 = new TaskMenuItem("���Ź���","images/taskmenu/28.png","parent.window.frames[2].location.href='department/tree.jsp'");
	item2 = new TaskMenuItem("�û�����","images/taskmenu/38.png","parent.window.frames[2].location.href='userinfo/select.do'");
	item3 = new TaskMenuItem("ģ�����","images/taskmenu/67.png","parent.window.frames[2].location.href='module/select.do'");
	item4 = new TaskMenuItem("��������","images/taskmenu/72.png","parent.window.frames[2].location.href='operate/select.do'");
    item5 = new TaskMenuItem("��ɫ����","images/taskmenu/37.png","parent.window.frames[2].location.href='role/select.do'");
	item6 = new TaskMenuItem("Ȩ�޹���","images/taskmenu/71.png","parent.window.frames[2].location.href='power/select.do'");
	item7 = new TaskMenuItem("���ݷ���","images/taskmenu/53.png","parent.window.frames[2].location.href='dataanalysis/select.do'");
	item8 = new TaskMenuItem("�˵�����","images/taskmenu/40.png","parent.window.frames[2].location.href='left/index.jsp'");
	item9 = new TaskMenuItem("���ӹ���","images/taskmenu/14.png","parent.window.frames[2].location.href='titlelink/select.do'");
    item10 = new TaskMenuItem("��¼��־","images/taskmenu/30.png","parent.window.frames[2].location.href='loglogin/select.do'");
	item11 = new TaskMenuItem("������־","images/taskmenu/43.png","parent.window.frames[2].location.href='logoperate/select.do'");
	item12 = new TaskMenuItem("�����û�","images/taskmenu/38.png","parent.window.frames[2].location.href='useronline/select.do'");
	item13 = new TaskMenuItem("���̷���","images/taskmenu/67.png","parent.window.frames[2].location.href='../workflow/definitiondeploy.jsp'");
	item14 = new TaskMenuItem("���̶���","images/taskmenu/72.png","parent.window.frames[2].location.href='../workflow/definitionlist.jsp'");

	item15 = new TaskMenuItem("Ȩ�޹���","images/taskmenu/72.png","parent.window.frames[2].location.href='left/selectrole.do'");
	item16 = new TaskMenuItem("��ҳ����","images/taskmenu/30.png","parent.window.frames[2].location.href='dataanalysis/select.do?act=role'");
	item17 = new TaskMenuItem("�Զ����ѯ","images/taskmenu/28.png","parent.window.frames[2].location.href='../search/typelist.jsp'");
	
	taskMenu1 = new TaskMenu("�û�����");
	taskMenu1.add(item2);
	taskMenu1.add(item1);
	taskMenu1.init();
	taskMenu2 = new TaskMenu("��������");
	taskMenu2.add(item3);
	taskMenu2.add(item4);
//	taskMenu2.init();
	taskMenu3 = new TaskMenu("Ȩ������");
	taskMenu3.add(item5);
//	taskMenu3.add(item6);
	taskMenu3.add(item15);
	taskMenu3.add(item16);
	taskMenu3.init();
	taskMenu4 = new TaskMenu("ҳ�����");
	taskMenu4.add(item7);
	taskMenu4.add(item8);
	taskMenu4.add(item9);
//	taskMenu4.init();
	taskMenu6 = new TaskMenu("���̹���");
	taskMenu6.add(item13);
	taskMenu6.add(item14);
//	taskMenu6.init();
	taskMenu7 = new TaskMenu("�Զ����ѯ");
	taskMenu7.add(item17);
	taskMenu7.init();
	taskMenu5 = new TaskMenu("��־����");
	taskMenu5.add(item10);
	taskMenu5.add(item11);
	taskMenu5.add(item12);
	taskMenu5.init();
}
</script>
</body>
</html>
