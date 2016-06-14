<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css" rel="stylesheet">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">

<title>靜態網頁</title>
</head>
<body>
	<s:include value="/General/header.jsp"></s:include>


	<div style="text-align: center">最新消息</div>	
	<div style="float:left;margin-left:500pX">
		<li>美麗見證</li>
		<li>醫美小常識</li>
	
	</div>
	<div style="float:right;margin-right:500PX">
		<Ui>內容</Ui>
	</div>
			
			

	

	<s:include value="/General/footer.jsp"></s:include>

	
</body>
</html>