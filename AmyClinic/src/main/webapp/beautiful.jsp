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
				<td >2016-05-20</td>
				<td ><a href="">3D變頻飛梭雷射功效<a></td>
			</tr>	
			<tr>
				<td>2016-04-21</td>
				<td ><a href="">【極線超音波拉提】找回消失的輪廓線<a></td>
			</tr>	
			<tr>
				<td>2016-04-15</td>
				<td ><a href="">【極線音波拉皮】地表最強的拉提科技　大小臉OUT!創造緊實完美顏容＿甜心虎牙<a></td>
			</tr>	
			<tr>
				<td>2016-03-28</td>
				<td ><a href="">【飛梭雷射】第三次飛梭雷射心得♥凹洞快滾(上)_大饅大力<a></td>
			</tr>	
			<tr>
				<td>2016-03-20</td>
				<td><a href="">【淨膚雷射】和擾人斑點說掰掰。淨膚雷射 & 彩衝光讓妹妹變美了_洋娃娃的夢幻城堡<a></td>
			</tr>
		
		</table>
	</div>
			
			
			

	

	<s:include value="/General/footer.jsp"></s:include>

	
</body>
</html>