<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#userphoto {
	border-radius: 50%;
}

#LoginBox {
	display: inline;
	background-color: white;
	height: 60px;
	width: 100px;
	color: red;
}
</style>
<div id="fb-root"></div>
<div id="LoginBox">
	<div>
		<input type="hidden" class="g-signin2" /> 
		<c:choose>
			<c:when test="${memberVO != null}">
				<c:choose>
					<c:when test="${memberVO.photo != null && memberVO.photo != \"\"}">
						<img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="50" width="50">
					</c:when>
					<c:otherwise>
						<img id="userphoto" src='${pageContext.request.contextPath}/images/logo.jpg' height="50" width="50">
					</c:otherwise>
				</c:choose>
				<br /> 
	        	Welcome, ${memberVO.name}!<br />
				<a href="#" onclick="logout();" id="logoutbutton">Sign out</a> | 
				<a href="${pageContext.request.contextPath}/member/editprofile.action">Profile</a> 
			</c:when>
			<c:otherwise>
				<img id="userphoto" src='${pageContext.request.contextPath}/images/logo.jpg' height="50" width="50">
				<br />
	        	Welcome, Guest!<br />
				<a href="${pageContext.request.contextPath}/login/login.jsp">Login</a> |
				<a href="${pageContext.request.contextPath}/register/register.jsp">Sign up!</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- Combined Facebook / Google script -->
<%-- <script src="${pageContext.request.contextPath}/js/logout.js"></script> --%>
<script>
	//Google

	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}

	function GoogleSignOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('Google: User signed out.');
		});
	}

	//-------------------------------------------
	// Facebook

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		console.log(response.authResponse);
		var accessToken = response.authResponse.accessToken;

		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			console.log("Facebook logged in!");
			testAPI();
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.

		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
		}
	}

	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '1733704493575453',
			cookie : true,
			xfbml : true,
			//status	   : true,
			version : 'v2.5'
		});
		console.log("FB init");
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};

	//Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	//(function(d, s, id) {
	//  var js, fjs = d.getElementsByTagName(s)[0];
	//  if (d.getElementById(id)) return;
	//  js = d.createElement(s); js.id = id;
	//  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=1733704493575453";
	//  fjs.parentNode.insertBefore(js, fjs);
	//}(document, 'script', 'facebook-jssdk')); 

	//https://developers.facebook.com/docs/facebook-login/permissions
	function testAPI() {
		FB.api('/me', 'get', {fields : 'id,name,gender,email,first_name,locale,picture,timezone'}, function(response) {
			var id = response.id;
			var name = response.name;
			var email = response.email
			var first_name = response.first_name
			var gender = response.gender;
			var locale = response.locale;
			var picture = response.picture.data.url;
			var timezone = response.timezone;
			var data = {
				"id" : id,
				"name" : name,
				"email" : email,
				"first_name" : first_name,
				"gender" : gender,
				"locale" : locale,
				"picture" : picture,
				"timezone" : timezone
			};
			function getContextPath() { //obtains context path. EL doesn't work with separated .js
				return window.location.pathname.substring(0,
						window.location.pathname.indexOf("/", 2));
			}
		});
	}

	function FacebookSignOut() {
		if (FB.getAccessToken() != null) {
			FB.logout(function(response) {
				console.log("Facebook: User signed out.");
			});
		}
	}
	//-------------------------------------------
	function logout() {
		GoogleSignOut();
		FacebookSignOut();

		function getContextPath() { //obtains context path. EL doesn't work with separated .js
			return window.location.pathname.substring(0,
					window.location.pathname.indexOf("/", 2));
		}
		$.ajax({
			type : "POST",
			url : (getContextPath() + '/member/logout'),
			data : 'email=' + "${memberVO.email}",
			success : function(data) {
				if (data[0].redirect) {
					window.location.href = data[0].redirectURL;
				}
			}
		})

	}
</script>
