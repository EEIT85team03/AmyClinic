<%@page import="group3.beef.employee.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		EmployeeService eSvc = new EmployeeService();
		List<EmployeeVO> list = null;
		list = eSvc.getAll();
		pageContext.setAttribute("list", list);
	%>
	<table border='1'  >
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>email</th>
		<th>教育程度</th>
		<th>經歷</th>
		<th>專長</th>
	</tr>
	<c:forEach var="EmpVO" items="${list}">
		<tr>
			<td>${EmpVO.eid}</td>
			<td>${EmpVO.name}</td>
			<td>${EmpVO.email}</td>
			<td>${EmpVO.education}</td>
			<td>${EmpVO.experience}</td>
			<td>${EmpVO.specialty}</td>
		</tr>
	</c:forEach>
	</table>


</body>
</html>