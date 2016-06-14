<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<title>醫生資料</title>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>
<table align="center">
	<tr>
		<td width="50"></td>
		<td width="300">
			<img class="img-circle" width="300px" src="${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${empVO.eid}"/>
		</td>
		<td width="22"></td>
		<td>
				<table style="font-size: 15pt;">
					<tr>
						<td colspan="2" style="font-size: 35pt;"><b>${empVO.name}　醫師</b></td>
					</tr>
					<tr height="20">
						<td colspan="2"><hr></td>
					</tr>	
					<tr>
						<td width="100" height="60">學歷</td>
						<td>${empVO.education}</td>
					</tr>	
					<tr>
						<td height="60">經歷</td>
						<td id="exp"></td>
					</tr>	
					<tr>
						<td height="60">專長</td>
						<td>${empVO.specialty}</td>
					</tr>	
				</table>
			<input type="hidden" id="expstr" value="${empVO.experience}" />
		</td>
	</tr>
</table>
<br>
<jsp:include page="/General/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- Bootstrap Core JavaScript -->
<script>
$(function() {
	var expstr = $('#expstr').val();
	var expArray = expstr.split(')');
	for(var i = 0; i < expArray.length - 1; i++) {
		$('#exp').append(expArray[i] + ')<br>');
	}
})

</script>	
</body>
</html>