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
	item1 = new TaskMenuItem("部门管理","images/taskmenu/28.png","parent.window.frames[2].location.href='department/tree.jsp'");
	item2 = new TaskMenuItem("用户管理","images/taskmenu/38.png","parent.window.frames[2].location.href='userinfo/select.do'");
	item3 = new TaskMenuItem("模块管理","images/taskmenu/67.png","parent.window.frames[2].location.href='module/select.do'");
	item4 = new TaskMenuItem("操作管理","images/taskmenu/72.png","parent.window.frames[2].location.href='operate/select.do'");
    item5 = new TaskMenuItem("角色管理","images/taskmenu/37.png","parent.window.frames[2].location.href='role/select.do'");
	item6 = new TaskMenuItem("权限管理","images/taskmenu/71.png","parent.window.frames[2].location.href='power/select.do'");
	item7 = new TaskMenuItem("数据分析","images/taskmenu/53.png","parent.window.frames[2].location.href='dataanalysis/select.do'");
	item8 = new TaskMenuItem("菜单管理","images/taskmenu/40.png","parent.window.frames[2].location.href='left/index.jsp'");
	item9 = new TaskMenuItem("链接管理","images/taskmenu/14.png","parent.window.frames[2].location.href='titlelink/select.do'");
    item10 = new TaskMenuItem("登录日志","images/taskmenu/30.png","parent.window.frames[2].location.href='loglogin/select.do'");
	item11 = new TaskMenuItem("操作日志","images/taskmenu/43.png","parent.window.frames[2].location.href='logoperate/select.do'");
	item12 = new TaskMenuItem("在线用户","images/taskmenu/38.png","parent.window.frames[2].location.href='useronline/select.do'");
	item13 = new TaskMenuItem("流程发布","images/taskmenu/67.png","parent.window.frames[2].location.href='../workflow/definitiondeploy.jsp'");
	item14 = new TaskMenuItem("流程定义","images/taskmenu/72.png","parent.window.frames[2].location.href='../workflow/definitionlist.jsp'");

	item15 = new TaskMenuItem("权限管理","images/taskmenu/72.png","parent.window.frames[2].location.href='left/selectrole.do'");
	item16 = new TaskMenuItem("首页数据","images/taskmenu/30.png","parent.window.frames[2].location.href='dataanalysis/select.do?act=role'");
	item17 = new TaskMenuItem("自定义查询","images/taskmenu/28.png","parent.window.frames[2].location.href='../search/typelist.jsp'");
	
	taskMenu1 = new TaskMenu("用户设置");
	taskMenu1.add(item2);
	taskMenu1.add(item1);
	taskMenu1.init();
	taskMenu2 = new TaskMenu("操作设置");
	taskMenu2.add(item3);
	taskMenu2.add(item4);
//	taskMenu2.init();
	taskMenu3 = new TaskMenu("权限设置");
	taskMenu3.add(item5);
//	taskMenu3.add(item6);
	taskMenu3.add(item15);
	taskMenu3.add(item16);
	taskMenu3.init();
	taskMenu4 = new TaskMenu("页面管理");
	taskMenu4.add(item7);
	taskMenu4.add(item8);
	taskMenu4.add(item9);
//	taskMenu4.init();
	taskMenu6 = new TaskMenu("流程管理");
	taskMenu6.add(item13);
	taskMenu6.add(item14);
//	taskMenu6.init();
	taskMenu7 = new TaskMenu("自定义查询");
	taskMenu7.add(item17);
	taskMenu7.init();
	taskMenu5 = new TaskMenu("日志管理");
	taskMenu5.add(item10);
	taskMenu5.add(item11);
	taskMenu5.add(item12);
	taskMenu5.init();
}
</script>
</body>
</html>
