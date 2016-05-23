<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<form action="EmpLoginServlet" method="post">
	<table>
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