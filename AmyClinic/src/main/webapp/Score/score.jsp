<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			
		</tr>
	
	</table>
	<script src="../js/jquery-1.9.1.js"></script>
	<script>
//失敗的方法 找原因	
// 		window.addEventListener(load, init, false); 
// 		function init(){
// 			$.post("ScoreServlet",{'action':'getEmpScore'},function(data){
// 				console.log("我有執行")
// 			})
// 		}
		$(function(){
			$.getJSON("ScoreServlet",{'action':'getEmpScore'},function(data){
				$.each(data,function(i,emp){
					console.log(emp.eid);
					console.log(emp.name);
					
				})
			})
		})
	
	
	</script>




</body>
</html>