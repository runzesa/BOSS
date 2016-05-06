<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>线图模板</title>
<%@include file="../../../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/highcharts.3.0.4.src.js" charset="gbk"></script>
<script type="text/javascript" src="../js/chartModule.js" charset="gbk"></script>
<script type="text/javascript">
	var dataGroup,dataValue;
	
	function initChart(){
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					defaultSeriesType: 'line',
					margin: [20, 85, 20, 30]
				},
				title: {
					text: null,//getQueryString('title'),
					style: {
						margin: '1px 10px 0 0' // center it
					}
				},
				subtitle: {
					text: ''//,//二级文字说明
				},
				xAxis: {
					categories: dataGroup,
					title: {
						text: ''
					}
				},
				yAxis: {
					title: {
						text: ''//侧面文字说明
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				tooltip: {
					formatter: function() {
			                return '<b>'+ this.x +'</b><br/>'+
							this.series.name +': '+ this.y +' ';
					}
				},
				legend: {
					layout: 'vertical',
	                align: 'right',
	                verticalAlign: 'top',
					style: {
						left: '0px',
						right: '1px',
						top: '10px',
						bottom: '50px'
					}
				},
				plotOptions:{
					line:{
						dataLabels:{
							enabled: true,
							style: {
								font: '13px Trebuchet MS, Verdana, sans-serif'
							}
						},
						enableMouseTracking: false,
						allowPointSelect: false
					}
				},
				series: dataValue
			});
		});
	}
</script>
</head>
<body style="background-color:#ebebeb"onload="initChart_Line()">
	<!-- 3. Add the container -->
	<div id="container" style="width: 100%; height: 100%; margin: 0 auto;"></div>
</body>
</html>
