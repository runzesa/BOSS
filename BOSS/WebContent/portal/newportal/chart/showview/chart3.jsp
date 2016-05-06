<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>线图模板</title>
<%@include file="../../../../jspheader/jquery_header.jsp" %>
<script type="text/javascript" src="../js/highcharts2.0.4.src.js"></script>
<script type="text/javascript" src="../js/chartModule.js"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/modules/exporting.src.js"></script>
<script type="text/javascript">
	var dataGroup,dataValue;
	
	function initChart(){
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					defaultSeriesType: 'line',
					margin: [50,170,60,60]
				},
				title: {
					text: getQueryString('title'),
					style: {
						margin: '15px 0 0 0',
						color: '#666'
					}
				},
				subtitle: {
					text: ''//,//二级文字说明
					//style: {
					//	margin: '0 100px 0 0' // center it
					//}
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
				plotOptions:{
					line:{
						dataLabels:{
							enabled: true
						},
						enableMouseTracking: true,
						allowPointSelect: true
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: 'auto',
						right: '55px',
						top: '50px',
						bottom: 'auto'
					},
					backgroundColor:'#FFFFFF',
					shadow:true
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
