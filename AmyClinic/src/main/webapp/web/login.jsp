<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | 會員登入 </title>
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
						<h2>登 入 愛 美</h2>
						<h6>Log into Amy</h6>
					</div>
				</div>
			</div>
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
					<h3>登 入</h3>
					<p class="est">Login</p>
							<div class="login-form-grids">
								<div style="color: red;">${message}</div>
								<form action="${pageContext.request.contextPath}/logreg/login.action" method="post">
									<label class="test-info">會員帳號 <span>*</span></label>
									<input type="text" name="memberVO.name" placeholder="電子信箱 / Email" required=" " >
									<div class="clearfix"></div>
									<label class="test-info">會員密碼 <span>*</span></label>
									<input type="password"name="memberVO.pwd" placeholder="密碼 / Password" required=" " >
									<div class="clearfix"></div>
									<div class="forgot">
										<a href="#">忘記密碼?</a>
									</div>
									<input type="submit" value="登 入">
								</form>
							</div>
							<h4>For New People</h4>
							<p><a href="register.jsp">Register Here</a> (or) go to <a href="index.jsp">Home Page<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
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