<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="java.util.*,com.genius.CodeSample.reports.*" %>
<%@ page import="com.genius.CodeSample.reports.actionbean.*" %>
<%
    request.setCharacterEncoding("gbk");
    response.setCharacterEncoding("gbk");
    
    ReportDetail service = new ReportDetail();
    ArrayList selladd = service.selectSelladd();
    ArrayList selltype = service.selectSelltype();
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>地区销售统计表</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/mootools.js"></script>
    <script type="text/javascript" src="js/tablestyle.js"></script>
    
    <link rel="stylesheet" type="text/css" href="js/calendar/calendar-blue2.css"/>
    <script type="text/javascript" src="js/calendar/calendar.js"></script>
    <script type="text/javascript" src="js/calendar/calendar-cn.js"></script>
    <script type="text/javascript" src="js/calendar/calendar-setup.js"></script>	
	<script type="text/javascript" src="index.js"></script>
	
<style>
.ctree2 div {
	height:16px;
	background-repeat:no-repeat;
	cursor:default;
	padding-left:20px;
}
.ctree2 .l1,.l2,.l3,.l4,.l5,.l6,.l7 {background-image:url('images/file.png');}
.ctree2 .end {background-image:url('file.png');}
.ctree2 .l1 {margin-left:0px;}
.ctree2 .l2 {margin-left:16px;display:none;}
.ctree2 .l3 {margin-left:32px;display:none;}
.ctree2 .l4 {margin-left:48px;display:none;}
.ctree2 .l5 {margin-left:64px;display:none;}
.ctree2 .l6 {margin-left:80px;display:none;}
.ctree2 .l7 {margin-left:96px;display:none;}
.ctree2 input {margin:-2px;margin-right:0px;}
.inline div{display:inline;}
input {border: none;}
</style>
</head>

<body>
  <div>
    <form action="report.jsp" method="post" onsubmit="return isValid();">
      <table class="edit" width="100%">
        <thead>
            <tr>
                <td align="center" colspan="2" style="font-size:200%;">
                  <strong>销售统计表</strong>
                </td>
            </tr>
        </thead>
        <tbody>
          <tr>
            <td align="center" width="80">开始日期</td>
            <td align="left">
              <input type="text" id="fromdate" name="fromdate" value="" style="width:100px;" />
              <img align="absmiddle" src="images/calendar.gif" id="jzsjdate" style="cursor: pointer;" onMouseOver="this.style.background='red';" onMouseOut="this.style.background=''" />
              <script type="text/javascript">
                  Calendar.setup({
                      inputField     :    "fromdate",
                      ifFormat       :    "%Y-%m-%d",
                      showsTime      :    false,
                      button         :    "jzsjdate",
                      singleClick    :    true,
                      step           :    1
                  });
              </script>
              <input type="button" value="昨日" onclick="javascript:date4();" />
              <input type="button" value="今日" onclick="javascript:date5();" />
              <input type="button" value="上周" onclick="javascript:date0();" />
              <input type="button" value="本周" onclick="javascript:date1();" />
              <input type="button" value="上月" onclick="javascript:date2();" />
              <input type="button" value="本月" onclick="javascript:date3();" />
            </td>
          </tr>
          <tr>
            <td align="center" width="80">结束日期</td>
            <td align="left">
              <input type="text" id="todate" name="todate" value="" style="width:100px;" />
              <img align="absmiddle" src="images/calendar.gif" id="jzsjdate2" style="cursor: pointer;" onMouseOver="this.style.background='red';" onMouseOut="this.style.background=''" />
              <script type="text/javascript">
                  Calendar.setup({
                      inputField     :    "todate",
                      ifFormat       :    "%Y-%m-%d",
                      showsTime      :    false,
                      button         :    "jzsjdate2",
                      singleClick    :    true,
                      step           :    1
                  });
              </script>
            </td>
          </tr>
 
          <tr>
            <td align="center" valign="top" width="80">销售地区</td>
            <td align="left">
              <div style="margin: auto auto 10px auto">
                <label><input type="checkbox" onclick="checkBox('#addlist .l1',this.checked);" />全选</label>
              </div>
              <input type="hidden" id="add" name="add" value="" /><div id="addlist" class="ctree2"
                onclick="javascript:treeClick(this)">
                <%for ( int i = 0; i < selladd.size(); i++ ) {
                	SelladdBean selladdBean = (SelladdBean)selladd.get(i);
                %>
                <div class="l1" val="<%=selladdBean.getId()%>"><input type="checkbox"><%=selladdBean.getSelladd()%></div>
                <%}%>
              </div>
            </td>
          </tr>
          <tr>
            <td align="center" valign="top" width="80">销售类型</td>
            <td align="left">
              <div style="margin: auto auto 10px auto">
                <label><input type="checkbox" onclick="checkBox('#typelist .l1',this.checked);" />全选</label>
              </div>
              <input type="hidden" id="type" name="type" value="" /><div id="typelist" class="ctree2"
				onclick="javascript:treeClick(this)">
                <%for ( int i = 0; i < selltype.size(); i++ ) {
                	SelltypeBean selltypeBean = (SelltypeBean)selltype.get(i);
                %>
                <div class="l1" val="<%=selltypeBean.getId()%>"><input type="checkbox"><%=selltypeBean.getSelltype()%></div>
                <%}%>
              </div>
            </td>
          </tr>
        </tbody>
        
        <tfoot>
            <tr>
                <td align="center" colspan="2">
                  <input type="submit" value="生成报表" />
                  <input type="reset" value="重新填写" />
                </td>
            </tr>
        </tfoot>
      </table>
    </form>
  </div>
</body>
</html>
