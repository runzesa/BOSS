<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>柱图模板</title>
<%@include file="../../../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/highcharts.3.0.4.src.js" charset="gbk"></script>
<script type="text/javascript" src="../js/chartModule.js" charset="gbk"></script>
<script type="text/javascript">
	var dataTitle,dataValue;
	
	function initChart(){
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					defaultSeriesType: 'column',
					margin: [20, 85, 20, 30]
				},
				title: {
					text: null,//getQueryString('title'),
					style: {
						margin: '1px 10px 0 0' // center it
					}
				},
				subtitle: {
					text: ''//二级文字说明
				},
				xAxis: {
					categories: dataGroup
				},
				yAxis: {
					min: 0,
					title: {
						text: ''//侧面文字说明
					}
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0,
						dataLabels: {
							enabled: true,
							style: {
								font: '13px Trebuchet MS, Verdana, sans-serif'
							}
						},
						enableMouseTracking: false,
						allowPointSelect: false
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
				tooltip: {
					formatter: function() {
						return '<b>' + this.x +'</b><br/>'+
							this.series.name +': '+ this.y +' ';
					}
				},
			    series: dataValue
			});
		});
	}
</script>
</head>
<body style="background-color:#ebebeb" onload="initChart_Line()">
	<div id="container" style="width: 100%; height: 100%; margin: 0 auto;"></div>
</body>
</html>
