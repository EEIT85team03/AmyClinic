<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>-AMY-testJSON</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/Backstage/js/jquery.js"></script>
</head>
<body >
<div id='t'></div>	<hr>
<div id ='d'></div>
<script type="text/javascript">
$(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(data){	
    	var row=' ';
    	var year=[];
    	var month=[];
    	var name=[];//科
    	var counts=[];//次
    	$.each(data, function(k, a){
    			row +=a.a+'年'+a.b+'月'+a.c+'科'+a.d+'次'+'<br>';
    			var yaerAry=a.a;
    			var monthAry=a.b;
    			var nameAry=a.c;
    			var countsAry=a.d;
    			//陣列的 distinct : 取得陣列中不重複的元素值，輸出成新陣列 (有用到 jQuery)
    			
    	});$('#t').html(row);
    		$('#d').html(yaer);
//     	for (var i = 0; i < year.length; i++) {
//     		$('#t').html(year[i]);
//     		Alert(year[i]);
//     		} // 輸出
	})
});
</script>
</body>
</html>