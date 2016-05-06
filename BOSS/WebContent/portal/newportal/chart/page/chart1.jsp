<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>饼图模版</title>
<%@include file="../../../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/highcharts.3.0.4.src.js" charset="gbk"></script>
<script type="text/javascript" src="../js/chartModule.js" charset="gbk"></script>
<script type="text/javascript">
	var chartData;
	
	function initChart(){
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					margin: [0,0,0,0],
				                align: 'center'
				},
				title: {
					text: null//getQueryString('title')
				},
				plotArea: {
					shadow: null,
					borderWidth: null,
					backgroundColor: null
				},
				tooltip: {
					formatter: function() {
						return '<b>' + this.point.name +'</b>: '+ this.y +'</br>' +
							Highcharts.numberFormat(this.percentage,1) + ' %';
					}
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						dataLabels: {
							enabled: true,
							formatter: function() {
								if(Highcharts.numberFormat(this.percentage,1) > 10) 
									return this.point.name;
							},
							style: {
								font: '13px Trebuchet MS, Verdana, sans-serif'
							}
						},
						enableMouseTracking: false
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: document.body.clientWidth*3/5 ,
						bottom: 'auto',
						right: 'auto',
						top: '15px'
					}
				},
			        series: [{
					type: 'pie',
					name: 'Browser share',
					data: chartData
				}]
			});
		});
	}
</script>
</head>
<body style="background-color:#ebebeb" onLoad="initChart_Pie()">
	<div id="container" style="width: 100%; height: 100%; margin: 0 auto"></div>
</body>
</html>
