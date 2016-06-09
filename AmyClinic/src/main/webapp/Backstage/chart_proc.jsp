<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

  <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/exporting.js"></script>
  
  
  <script>
  $(function () {
	  var year=[];var month=[];var name=[];//科
		var row=' '; var counts=[];//次
	    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(data){		
	    	$.each(data, function(i, a){
	    		row +='<b>'+a.id+'名'+a.name+'，賣出:'+a.q+'個'+a.year+'年'+'</b><hr>';
	    			if($.inArray(a.a, year) === -1) year.push(a.a);
	     			if($.inArray(a.b, month) === -1) month.push(a.b);
	     			if($.inArray(a.c, name) === -1) name.push(a.c);
	     			counts.push(a.d);
	    	});
	    	$('#t').html(row);
	    	var newHTML = [];
	    	newHTML.push('<b>'+year.length+'個年:'+year+'</b><br>');
	    	newHTML.push('<b>'+month.length+'個月:'+month+'</b><br>');
	    	newHTML.push('<b>'+name.length+'個科:'+name+'</b><br>');
	    	newHTML.push('<b>'+counts.length+'個數:'+counts+'</b><br>');
	    	$(".element").html(newHTML.join(""));
		
		//-----------來源: 雲端資料庫JSON-------------------------年度熱門療程預約比較圖---------------------------<font color="red" style="text-align: center;">熱銷產品</font>
	    $('#container').highcharts({
	        chart: {  type: 'column'  },
	        title: {  text: year+'年度熱門療程預約比較圖'  },
	        subtitle: {  text: '來源: 雲端資料庫JSON'  },
	        xAxis: {
	            categories: 
 	            	[ '1月', '2月', '3月', '4月', '5月', '6月', '7月',  '8月', '9月', '10月', '11月', '12月'  ]
	            	//month
	        },
	        yAxis: {
	            min: 0,
	            title: {  text: '銷量 ($)'  }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.0f} 次</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {  pointPadding: 0.2,  borderWidth: 0  }
	        },
	        series: [{
	            name: name[0],
	            data: 
// 	            	[49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
	            	counts.slice(0,12)
	        }, {
	            name: name[1],
	            data: 
// 	            	[83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
	            	counts.slice(12,24).reverse()
	        }, {
	            name: name[2],
	            data: 
// 	            	[48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
	            	counts.slice(24,36)
	        }, {
	            name: name[3],
	            data: 
// 	            	[42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
	            	counts.slice(36,48).reverse()
	        }]
	    });
	    })// $.getJSON line:13
	});//$(function () line:10
  </script>
</head>
<body>

  <div id="container" style="min-width:700px;height:400px"></div>
  
</body>
</html>