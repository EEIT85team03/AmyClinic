<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>
	I am login/login.jsp<hr>
	
	User: * Password: 1234
	<ul>
		<li><font color="blue"><b>Struts2 Login Form</b></font> 		
			<s:form namespace="/logreg" action="login">
				<s:textfield name="memberVO.name" label="User Name" placeholder="User ID" />
				<s:password name="memberVO.pwd" label="Password" />
				<s:submit value="Submit" method="login" />
			</s:form>
		</li>
		<li><input type="button" value="Forgot Password?" onclick="location.href='${pageContext.request.contextPath}/login/recover.jsp'"></li>
		<li><div style="color:red;">${message}</div></li>
	</ul>	
</body>
</html>