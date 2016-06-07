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
<div class ='element'></div>
<script type="text/javascript">
$(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/HotProdServlet",{'action':'熱門產品'},function(data){	
    	var row=' ';var t1,t2,t3,t4,t5;
    	var name=[];
    	var counts=[];//個
    	var htodata;
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
    		t5=((counts[4]/sum)*100).toFixed(1);
    	})
    	$('#t').html(row);
    	var newHTML = [];
    	newHTML.push(counts.length+'個:'+counts[0]+'<br>');	
    	newHTML.push(t1+'，'+t2+'，'+t3+'，'+t4+'，'+t5+'<br>');
    	$(".element").html(newHTML.join(""));
    })// $.getJSON line:13
});//$(function () line:10
</script>

</body>
</html>