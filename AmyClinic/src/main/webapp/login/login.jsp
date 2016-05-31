<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

	<s:include value="/General/header.jsp"></s:include>
	<hr>
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
						<span id="mybtn" class="button button-orange"><i class="fa"></i> &#x26E8; <strong>忘記密碼</strong></span>
						<a href="${pageContext.request.contextPath}/register/register.jsp" class="button button-green"> <i class="fa"></i>&#10133;
							<strong>現在加入愛美</strong></a>
						
						<a href="${pageContext.request.contextPath}/register/register.jsp">
						<span class="g-signin2" data-onsuccess="onSignIn"></span></a>
						
						<a href="#" onclick="signOut();">Sign out</a>
					</div>
				</fieldset>
			</s:form>
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
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
//       console.log("ID Token: " + id_token);     
// 	  var user = {'name': profile.getName()};
	  	  
// 	  sessionStorage.setItem('user', JSON.stringify(user)); //session->JSON test	  
// 	  var obj = JSON.parse(sessionStorage.user);
// 	  console.log(obj.name);


// 	  var xhr = new XMLHttpRequest(); //AJAX, sends token to backend for verification
// 	  xhr.open('POST', '${pageContext.request.contextPath}/GoogleLoginServlet'); // token verification servlet
// 	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
// 	  xhr.onload = function() {
// 	    console.log('Signed in as: ' + xhr.responseText);
// 	  };
// 	  xhr.send('idtoken=' + id_token);
	  	  
	$.ajax({
		type: "POST",
		url: '${pageContext.request.contextPath}/GoogleLoginServlet',
		data: 'idtoken=' + id_token,
		dataType:'json',
		success: function(data) {
			console.log(data);
			console.log(data[0].success);
			console.log(data[0].redirect);
			console.log(data[0].redirectURL);
			if(data[0].redirect) {
				console.log("redirecting");
				window.location.href = data[0].redirectURL;
			}
		}
	})
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
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