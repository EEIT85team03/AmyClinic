<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/login/css/login.css" rel="stylesheet">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">
	<title>會員登入</title>
</head>
<body>
<!-- facebook script -->
<div id="fb-root"></div>
<script src="${pageContext.request.contextPath}/js/facebook.login.js"></script>
<!-- end facebook script -->
<!-- <div id="fb-root"></div> -->
	<s:include value="/General/header.jsp"></s:include>

	<div id="page">
  <div class="welcome">
            <div class="balloon">
                <div><span>☺</span>
                </div>
                <div><span>登</span>
                </div>
                <div><span>入</span>
                </div>
                <div><span>愛</span>
                </div>
                <div><span>美</span>
                </div>
                <div><span>!</span>
                </div>
            </div>
        </div>
		<div id="loginpage">
			<s:form namespace="/logreg" action="login" id="loginform"
				theme="simple">
				<fieldset id="field">
					<legend></legend>
			<div style="color: red;">${message}</div>
					<div>
						<span id="label">姓名：</span>
						<s:textfield name="memberVO.name" placeholder="    您的姓名"
							id="username" label="waterwww" />
					</div>
					<div>
						<span id="label">密碼：</span>
						<s:password name="memberVO.pwd" id="password"
							placeholder="    您的密碼" />
					</div>
					<div>
						<s:submit value="確定登入" method="login" />						
						<span id="mybtn" class="button button-orange"><i class="fa"></i> &#10071; <strong>忘記密碼</strong></span>
						<a href="${pageContext.request.contextPath}/register/register.jsp" class="button button-green"> <i class="fa"></i>&#10133;
							<strong>現在加入愛美</strong></a>

						
						<a href="${pageContext.request.contextPath}/register/register.jsp">
<!-- 							Google Login button -->
						<span class="g-signin2" data-onsuccess="onSignIn"></span></a>
<!-- 						Facebook login button -->
						<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"></div>
<!-- 						<div id="status"></div> -->
						<a href="#" onclick="logout();">Sign out</a>

					</div>
				</fieldset>
			</s:form>

				<div id="googleButtonPlaceholder">
					<div class="g-signin2" data-onsuccess="onSignIn" data-width="300" data-height="60"></div>
					<span class="btn">使用 Google Gmail 登入</span>
				</div>

						<div id="googleButtonPlaceholder"><div class="g-signin2" data-onsuccess="onSignIn" data-width="300" data-height="60"></div><span class="btn">使用 Google Gmail 登入</span></div>
						<a href="#" onclick="logout();" id="googlelogout">Sign out</a>

		</div>

	</div>
	
	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&#10005;</span>
      	忘記密碼？
    </div>
    <div class="modal-body">
      <p>可以撥打以下電話連絡我們客服人員</p>
      <p> 0800-000-999...</p>
      <hr/>
		<s:include value="/login/recover.jsp"></s:include>
    </div>
  </div>
</div>

	



<s:include value="/General/footer.jsp"></s:include>

<!-- Google script -->
<script src="${pageContext.request.contextPath}/js/google.login.js"></script>
<!-- Henry's Custom logout -->
<script>	
	function logout(){
		signOut();
		FB.logout();
     	function getContextPath() { //obtains context path. EL doesn't work with separated .js
    	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    	}
     	console.log("${memberVO.email}");
		$.ajax({
			type: "POST",
			url: (getContextPath()+'/member/logout'),
			data: 'email=' + "${memberVO.email}", 
			success: function(data) { 
				if(data[0].redirect) {
					window.location.href = data[0].redirectURL;
				}
			}
		})
		
	}
</script>

<script>
	$(function() {
		$(":text").attr("autocomplete", "off");
	});
</script>
<script>
var modal = document.getElementById('myModal');

var btn = document.getElementById("mybtn");

var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
