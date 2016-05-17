<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recover Password</title>
</head>
<body>
I'm recover.jsp!<hr>

	<ul>
		<li><font color="blue"><b>Please enter your Email to recover your password:</b></font> 		
			<s:form namespace="/free" action="recover">
				<s:textfield name="memberVO.email" label="Email" placeholder="abc@xyz.com" />				
				<s:submit value="Submit" method="recover" />
			</s:form>
		</li>
		<li><div style="color:red;">${message}</div></li>
	</ul>	
</body>
</html>