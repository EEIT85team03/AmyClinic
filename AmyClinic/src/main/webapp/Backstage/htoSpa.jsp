<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>-AMY-testJSON</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/Backstage/js/jquery.js"></script>
<script>
</script>
</head>
<body >
<!-- <button>JsonServlet</button> -->
<table border="1px"  class="table table-hover"  id="firstTable">	
		<tr>
			<th width="100px" >年</th>
			<th width="100px">月</th>
			<th width="100px">科</th>
			<th width="100px">次</th>
		</tr>

		<tbody id='t'></tbody>
		</table>
<div></div>

<script type="text/javascript">
$(function(){
//   $("#bt").click(function(){
    $.getJSON("${pageContext.request.contextPath}/Backstage/SpaToSalesServlet",{'action':'熱門預約療程'},function(data){	
    	var row=' ';
    	$.each(data, function(k, a){
    			row += '<tr><td>'+a.a+'年</td><td>'+a.b+'月</td><td>'+a.c+'科</td><td>'+a.d+'次'+'</td></tr>';
    	});$('#t').html(row);
	})
//   })
});
</script>
</body>
</html>