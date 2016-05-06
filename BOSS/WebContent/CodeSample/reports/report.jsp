<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="java.util.*,com.genius.CodeSample.reports.*" %>
<%@ page import="com.genius.CodeSample.reports.actionbean.*" %>
<%
    request.setCharacterEncoding("gbk");
    response.setCharacterEncoding("gbk");
    
    String strFromDate = request.getParameter("fromdate");
    String strToDate = request.getParameter("todate");
    String strTypes = request.getParameter("type");
    String sumToParent = request.getParameter("sumtoparent");
    String strAdds = request.getParameter("add");
    
    java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.text.SimpleDateFormat df2 = new java.text.SimpleDateFormat("yyyy年MM月dd日");
    Date fromDate = df.parse(strFromDate);
    Date toDate = df.parse(strToDate);
    
    ReportDetail serivce = new ReportDetail();
    ArrayList selladd = serivce.getSelladd(strAdds);
    Iterator selltype = serivce.getSellType(strTypes).iterator();
    
    int[] sums = new int[selladd.size()];
    List table = null;
    try {
      table = serivce.report(strFromDate, strToDate, strTypes, strAdds, sumToParent != null && sumToParent.length() > 0);
    } catch (Exception e) {
      e.printStackTrace();
      out.println("<script type=\"text/javascript\">alert('错误的调用!');</script>");
      return;
    }   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>地区销售统计表</title>
  <link rel="stylesheet" type="text/css" href="css/style.css"/>
  <script type="text/javascript" src="js/mootools.js"/>
  <script type="text/javascript" src="js/tablestyle.js"></script>
  <script type="text/javascript" src="js/jschart.js"></script>
</head>
<body>
  <div>
    <table class="data" width="100%">
      <caption style="text-align: center;font-size:18px;"><%=df2.format(fromDate)%>到<%=df2.format(toDate)%>地区销售统计表</caption>
      <thead>
        <tr class="title">
          <td align="center" nowrap="nowrap">
            <strong>销售类型</strong>
          </td>
        <%for(int i = 0; i < selladd.size(); i++) {
        	SelladdBean selladdBean = (SelladdBean)selladd.get(i);
        %>
          <td align="center" nowrap="nowrap">
            <strong><%=selladdBean.getSelladd()%></strong>
          </td>
        <%}%>
          <td align="center" nowrap="nowrap">
            <strong>小计</strong>
          </td>
        </tr>
      </thead>
      
      <tbody>
        <%for(int i = 0; i < table.size(); i++) { 
        	int[] row = (int[])table.get(i); 
        	int rowSum = 0;
            String selltypeName = ((SelltypeBean)selltype.next()).getSelltype();
        %>
        <tr class="chart">
          <td align="left" title="<%=selltypeName%>">
            <strong><%=selltypeName%></strong>
          </td>
        <%for(int j = 1; j < row.length; j++) {
        	rowSum += row[j];
        	sums[j-1] += row[j];
        %>
          <td align="right" nowrap="nowrap" title="<%=((SelladdBean)selladd.get(j-1)).getSelladd()%>/<%=selltypeName%>">
              <%=row[j]%>
          </td>
        <%}%>
          <td align="right" nowrap="nowrap" title="<%=selltypeName%>">
            <strong><%=rowSum%></strong>
          </td>
        </tr>
        <%}%>
      </tbody>
      
      <tfoot>
        <tr class="chart">
          <td align="center" nowrap="nowrap" title="合计">
            <strong>合计</strong>
          </td>
        <%{int rowSum = 0;%>
        <%for(int i = 0; i < sums.length; i++) {rowSum += sums[i];%>
          <td align="right" nowrap="nowrap" >
            <strong><%=sums[i]%></strong>
          </td>
        <%}%>
          <td align="right" nowrap="nowrap">
            <strong><%=rowSum%></strong>
          </td>
        <%}%>
        </tr>
      </tfoot>
    </table>

    <div id="myChart" style="border: solid 1px #000000;width: 99%;padding: 5px;">选择数据绘制统计图</div>
    <p></p>
    <div id="myChart2" style="border: solid 1px #000000;width: 99%;padding: 5px;">选择数据绘制统计图</div>
  </div>
</body>

<script language="javascript" type="text/javascript">
window.addEvent('domready', function() {

  $each($$('tr.chart'), function(row) {
    row.addEvent('click', function() {
      var items = this.getElements('td');
      
      $('myChart').innerHTML = '';
      var chartData = "";
      for (var i = 1; i < items.length-1; i++) {
        var titles = $$('tr.title td');
        if (i > 1) chartData += ';';
        chartData += titles[i].innerText.replace(' ', '')+ ';' + items[i].innerText.replace(' ', '');
      }

      var chart = Chart;
      chart.init("myChart");
      chart.type = "column";
      chart.debug = false;
      chart.showLegend = true;
      chart.showValues = true;
      chart.title = items[0].innerText+'地区销售统计表';
      chart.setData(chartData);
      chart.render();
    });
  });
  
  $each($$('tr.chart'), function(row) {
    var items = row.getElements('td');
    
    for (var idx = 1; idx < items.length; idx++) {
      items[idx].addEvent("click", function() {
        var column = 1 + arguments[0];
        
        var chartData = "";
        var rows = $$('tr.chart');
        for (var i = 0; i < rows.length-1; i++) {
          var t = rows[i].getElement(':nth-child('+column+')');
          if (i > 0) chartData += ';';
          chartData += rows[i].getElement('td').innerText.replace(' ', '') + ';' + t.innerText.replace(' ', '');
        }

        $('myChart2').innerHTML = '';
        var chart = Chart;
        chart.init("myChart2");
        chart.type = "column";
        chart.debug = false;
        chart.showLegend = true;
        chart.showValues = true;
        chart.title = $$('tr.title td')[arguments[0]].innerText+'地区销售统计表';
        chart.setData(chartData);
        chart.render();
        
      }.pass(idx));
    }
  });
  
});
</script>

</html>
