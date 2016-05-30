<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form action="LoginServlet" method="post">
	<table>
		<tr>
			<td colspan=2>
				帳號：Test@group3.com<br>
				密碼：1234
			</td>
		</tr>
		<tr>
			<td>
				帳號：
			</td>
			<td>
				<input type="text" name="email" size="20"/>
			</td>
		</tr>
		<tr>
			<td>
				密碼：
			</td>
			<td>
				<input type="password" name="pwd" size="20"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="送出"/>
			</td>
		</tr>
	
	</table>

</form>
</body>
</html>