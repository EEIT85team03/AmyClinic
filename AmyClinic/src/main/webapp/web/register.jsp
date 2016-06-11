<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script	src="${pageContext.request.contextPath}/web/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/web/css/jquery-ui.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/web/js/jquery-ui.min.js"></script>

<title>Amy | 會員註冊</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- login-section -->
		<section class="login-page">
			<div class="inner-banner demo-2 text-center">
				<header class="logo">
					<h1><a class="cd-logo link link--takiri" href="index.jsp">Prevention <span>is better than cure.</span></a></h1>
				</header>
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>註冊會員</h2>
						<h6>Registeration is required to make appointments and purchases!</h6>
					</div>
				</div>
			</div>
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
					<h3>註冊表格</h3>
						<p class="est">Thank you for taking the time to register your information with Amy! We promise to never sell or share your personal information with anyone else!</p>
							<div class="login-form-grids">
									<h5>required information</h5>
								<form action="${pageContext.request.contextPath}/logreg/register.action" method="post">
									<input type="text" name="memberVO.name" placeholder="姓名" required id="username" >								
									<input type="password" name="memberVO.pwd" placeholder="會員密碼" required id="password" >																	
									<input type="password" name="" placeholder="確認密碼" required >								
									<input type="email" name="memberVO.email" placeholder="電子信箱" required id="email" >								

									<h6>optional information</h6>																	
									
									<input type="text" name="memberVO.birthday" placeholder="出生日期" value="2016-05-20" id="birthday" readonly id="country">								
									<input type="text" name="memberVO.country" placeholder="選擇國籍" id="country" >								
									<input type="text" name="memberVO.gender" placeholder="選擇性別" id="gender" >								
									<input type="text" name="memberVO.addr" placeholder="用戶地址" id="address" >								
									<input type="text" name="memberVO.phone" placeholder="電話號碼" id="phone" >								
									<input type="text" name="memberVO.height" placeholder="身高" id="height" >								
									<input type="text" name="memberVO.mass" placeholder="體重" id="weigt" >								
									<input type="text" name="fileUpload" placeholder="會員圖片" id="uploader" >								
									
									<div class="register-check-box">
										<div class="check">
											<label class="checkbox"><input type="checkbox" name="checkbox"><i> </i>I accept the terms and conditions</label>
										</div>
									</div>
									<input type="submit" value="建立帳號">
								</form>
							</div>
						</div>
						</div>
					</div>
				<!-- //login -->
			<!--- /login ---->
		</section>
		<!-- //login-section -->
		<!-- book an appointment -->
		<jsp:include page="fragment/appointment.jsp" />
		<!-- //book an appointment -->
		
		<!-- news letter -->
		<jsp:include page="fragment/newsletter.jsp" />
		<!-- //news letter -->
		
		<!-- footer -->
		<jsp:include page="fragment/footer.jsp" />
		<!-- //footer -->
		<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>