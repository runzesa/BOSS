<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>饼图模版</title>
<%@include file="../../../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/highcharts2.0.4.src.js"></script>
<script type="text/javascript" src="../js/chartModule.js"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/modules/exporting.src.js"></script>
<script type="text/javascript">
	var chartData;
	
	function initChart(){
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					margin: [50,200,60,60]
				},
				title: {
					text: getQueryString('title'),
					style: {
						margin: '15px 0 0 0',
						color: '#666'
					}
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
								if(Highcharts.numberFormat(this.percentage,1) > 5) 
									return this.point.name;
							},
							color: 'white',
							style: {
								font: '13px Trebuchet MS, Verdana, sans-serif'
							}
						}
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: 'auto',
						bottom: 'auto',
						right: '55px',
						top: '50px'
					},
					backgroundColor:'#FFFFFF',
					shadow:true
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
<body style="background-color:#ebebeb" onload="initChart_Pie()">
	<div id="container" style="width: 100%; height: 100%; margin: 0 auto"></div>
</body>
</html>
