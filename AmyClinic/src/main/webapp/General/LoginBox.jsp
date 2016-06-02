<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#userphoto{
		border-radius:50%;
	}
	#LoginBox{
		display:inline;
		background-color:white;
		height:60px;
		width: 100px;
		color:red;
	}
</style>
<div id="LoginBox">
	<div>		
		<img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="50" width="50">
		<div>
			${memberVO.name}!
			Logout | Profile
		</div>
	</div>	
</div>

<script>

</script>