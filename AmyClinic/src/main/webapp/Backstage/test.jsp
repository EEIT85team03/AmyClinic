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

<script type="text/javascript">
$(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/HotProdServlet",{'action':'熱門產品'},function(data){	
    	var row=' ';
//     	var id=[];//排行
//     	var year=[];
//     	var name=[];
//     	var q=[];//個
    	$.each(data, function(k, a){
    			row +=a.id+'名'+a.name+'，賣出:'+a.q+'個'+a.year+'年'+'<br>';
//     			var yaerAry=a.a;
//     			var monthAry=a.b;
//     			var nameAry=a.c;
//     			var countsAry=a.d;
    			//陣列的 distinct : 取得陣列中不重複的元素值，輸出成新陣列 (有用到 jQuery)
    			
    	});$('#t').html(row);
    		
//     	for (var i = 0; i < year.length; i++) {
//     		$('#t').html(year[i]);
//     		Alert(year[i]);
//     		} // 輸出
	})
});
</script>