<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/exporting.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts-3d.js"></script>
  <script>
  ﻿$(function () {
	    $('#container').highcharts({
	        chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45,
	                beta: 0
	            }
	        },
	        title: {
	            text: 'TOP 5商品銷售'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                depth: 35,
	                dataLabels: {
	                    enabled: true,
	                    format: '{point.name}'
	                }
	            }
	        },
	        series: [{
	            type: 'pie',
	            name: 'Browser share',
	            data: [
// {
//     name: '超導恆潤飽水面膜',
//     y: 12.8,
//     sliced: true,
//     selected: true
// },   
					['超導恆潤飽水面膜',   12.8],
	                ['DHC 純欖護唇膏',   45.0],
	                ['蘆薈潤澤乳霜',       26.8],
	                ['庶務客日本 現貨 雪肌粹洗面乳',    8.5],
	                ['親柔芙爽身蜜粉',     6.2],
	                ['科士威~浪漫香水身體乳液',   0.7]
	            ]
	        }]
	    });
	});				
  </script>
</head>
<body>
  <div id="container" style="min-width:700px;height:400px"></div>
</body>
</html>