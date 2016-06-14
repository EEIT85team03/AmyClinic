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


	<div style="text-align: center ;margin-bottom: 50PX" >最新消息</div>	
	<div style="float:left;margin-left:500pX">
		<li><a href="beautiful.jsp">美麗見證</a></li>
		<li><a href="knowledge.jsp">醫美小常識</a></li>
		<li><a href="knowledge.jsp">門診時間</a></li>
		<li><a href="knowledge.jsp">常見問題</a></li>
	
	</div>
	<div style="float:right;margin-right:100PX">
		<table width=900pX>
			<tr>
				<th width=15% >張貼日期</th>
				<th >標題</th>
			</tr>
			<tr >
				<td >2016-05-01</td>
				<td >初來乍到！醫美小學堂開課囉！ 7大專有名詞一次解惑</td>
			</tr>	
			<tr>
				<td>2016-04-25</td>
				<td >3招練出名模美腿 讓你不當蘿蔔人！</td>
			</tr>	
			<tr>
				<td>2016-04-20</td>
				<td >不想被人看出真實年齡 脖子肌膚該怎麼保養？</td>
			</tr>	
			<tr>
				<td>2016-03-30</td>
				<td >換季如何保養？ 趕快拯救你的敏感性肌膚！</td>
			</tr>	
			<tr>
				<td>2016-03-25</td>
				<td>化妝品、作臉、洗SPA、面膜，您用對方法了嗎？！</td>
			</tr>
		
		</table>
	</div>
			
			

	

	<s:include value="/General/footer.jsp"></s:include>

	
</body>
</html>