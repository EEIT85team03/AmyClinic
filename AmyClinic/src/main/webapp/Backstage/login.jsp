<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

	
<form action="EmpLoginServlet.do" method="post">
	<table>
		<tr>
			<td>
				帳號：
			</td>
			<td>
				<input type="text" name="mail" size="20" value="${request.mail}"/>
			</td>
		</tr>
		<tr>
			<td>
				密碼：
			</td>
			<td>
				<input type="password" name="pwd" size="20" value="${request.pwd}"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="送出"/>
			</td>
		</tr>
	
	</table>
	<input type="hidden" name="action" value="login">
	</form>
	
	
	
	<a href="<%=request.getContextPath()%>/BeefTest/AddEMP.jsp">註冊會員</a><br>
	<a href="<%=request.getContextPath()%>/Backstage/foget_pw.jsp">忘記密碼</a><br><br><br><br>
	
	
	
	


</body>
</html>