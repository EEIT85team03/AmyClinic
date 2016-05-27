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

	<div>${employeeVO.name}</div>
	<div>${avgPicture}</div>
	<div>${avgScore}</div>
	<div><img width='300px' height='auto'src='${pageContext.request.contextPath}/images/${avgPicture}'></div>

${memberVO}
${employeeVO}
<form METHOD='post' ACTION='ScoreServlet' >
	<input type="submit" value="撰寫評論">
	<input type="hidden" name="action" value="add_score">
	<input type="hidden" name="employeeVO" value="${employeeVO}">


</form>


	<c:forEach var="ScoreVO" items="${scoreVO}" >
		<div>
		
		<span>${ScoreVO.mb.name }</span>
		<span><img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' height="150" width="150" ></span>
		${ScoreVO.scoreDate}
		
		<img width='300px' height='auto'src='${pageContext.request.contextPath}/images/${ScoreVO.scores}star.jpg'>

		${ScoreVO.comment}
		</div>
	</c:forEach>







</body>
</html>