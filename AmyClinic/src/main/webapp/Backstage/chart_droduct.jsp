<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/exporting.js"></script>
  <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts-3d.js"></script>

</head>
<body>

  <div id="container" style="min-width:700px;height:400px"></div>
  <div id='t'></div><hr>
  <div class ='element'></div>
<script type="text/javascript">
$(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/HotProdServlet",{'action':'熱門產品'},function(data){	
    	var row=' ';var t1,t2,t3,t4,t5;
    	var name=[];
    	var counts=[];//個
    	var htodata=[];
    	$.each(data, function(k, a){
    			row +=a.id+'名'+a.name+'，賣出:'+a.q+'個'+a.year+'年'+'<br>';
    			name.push(a.name);
    			counts.push(a.q);		
    	});
    	$(function(){//百分比運算
    		var sum=counts[0]+counts[1]+counts[2]+counts[3]+counts[4];
    		t1=((counts[0]/sum)*100).toFixed(1);
    		t2=((counts[1]/sum)*100).toFixed(1);
    		t3=((counts[2]/sum)*100).toFixed(1);
    		t4=((counts[3]/sum)*100).toFixed(1);
    		t5=((counts[4]/sum)*100+0.1).toFixed(1);
    		for(var i=0;htodata.length<=4;i++){
    			htodata[i]= name[i] + ", " +counts[i];	
    		}
    	})
    	$('#t').html(row);
    	var newHTML = [];
    	newHTML.push(counts.length+'個:'+name+'<br>');	
    	newHTML.push('百分比運算：'+counts+'='+t1+'，'+t2+'，'+t3+'，'+t4+'，'+t5+'='+(parseInt(t1)+parseInt(t2)+parseInt(t3)+parseInt(t4)+parseInt(t5))+'<br>');
    	newHTML.push(htodata.length+'htodata:'+htodata[0]+'<br>');	
    	$(".element").html(newHTML.join(""));
 //製圖------------------------------------------------------------------------------   	
    	$(function () {
    	    $('#container').highcharts({
    	        chart: {
    	            type: 'pie',
    	            options3d: {
    	                enabled: true,
    	                alpha: 45,
    	                beta: 0
    	            }
    	        },
    	        title: { text: 'TOP 5商品銷售' },
    	        tooltip: { pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' },
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
// 							htodata[0],htodata[1],htodata[2],htodata[3],htodata[4]
//     				{  name: '超導恆潤飽水面膜',   y: 12.8,  sliced: true,    selected: true },   
//     					['超導恆潤飽水面膜',   12.8],
//     	                ['DHC 純欖護唇膏',   45.0],
//     	                ['蘆薈潤澤乳霜',       26.8],
//     	                ['庶務客日本 現貨 雪肌粹洗面乳',    8.5],
//     	                ['親柔芙爽身蜜粉',     6.2],
//     	                ['科士威~浪漫香水身體乳液',   0.7]
						['Top1：'+name[0],   parseInt(t1)],
    	                ['Top2：'+name[1],   parseInt(t2)],
    	                ['Top3：'+name[2],       parseInt(t3)],
    	                ['Top4：'+name[3],    parseInt(t4)],
    	                ['Top5：'+name[4],     parseInt(t5)]
    	            ]
    	        }]
    	    });
    	});				
    })// $.getJSON line:13
});//$(function () line:10
</script>


</body>
</html>