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
<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> 登入成功的頁面 - login_success.jsp           </h3> 
				   <h3> 歡迎:<font color=red> ${email} </font>您好</h3>
				   <h3> 歡迎:<font color=red> ${memberVO.name} </font>您好</h3>
			 </td>
		</tr>
	</table>
	

</body>
</html>