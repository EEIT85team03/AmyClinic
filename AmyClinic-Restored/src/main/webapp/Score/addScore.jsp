<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.raty.js"></script>

	<div style="background-color: blue; width: auto;">
		<h1 style="color: white">評分並撰寫評論</h1>
	</div>
	<%-- 	<p>${param.eid }<p> --%>
	<%-- 	<p>${employeeVO.name}<p> --%>
	<p>您的評論會在網路上公開
	<p>
	<div id="star"></div>

	<form>
		<input type="text" style="width: 400PX; height: 300PX"> <input
			type="submit" value="輸入"> <input type="reset" value="重置">

	</form>
	
	
	<script>
		$('#star').raty({
			click : function(score) {
				alert(score);

			}

		});
	</script>




</body>
</html>