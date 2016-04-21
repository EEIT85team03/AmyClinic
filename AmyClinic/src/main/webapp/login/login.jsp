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
<!-- 			Henry Struts2 testing -->
	I am login/login.jsp
	
	User: Henry Password: 123
	<ul>
		<li><font color="blue"><b>Struts2 login form test</b></font> 		
			<s:form namespace="/login" action="login">
				<s:textfield name="memberVO.name" label="User Name" placeholder="User ID" />
				<s:password name="memberVO.pwd" label="Password" />
				<s:submit value="Submit" method="login" />
			</s:form>
		</li>
		<div style="color:red;">${message}</div>
	</ul>
	
<!-- 			Henry Struts2 testing -->
</body>
</html>