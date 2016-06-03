// Google

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

      function getContextPath() { //obtains context path. EL doesn't work with separated .js
    	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    	}
    	
	$.ajax({
		type: "POST",
		url: (getContextPath()+'/GoogleLoginServlet'),
		data: 'idtoken=' + id_token,
		dataType:'json',
		success: function(data) {
			if(data[0].redirect) {
				console.log("redirecting");
				window.location.href = data[0].redirectURL;
			}
		}
	})
}

function GoogleSignOut() {
	var id_token = ${memberVO.pwd};
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('Google: User signed out.');
    });
}

//-------------------------------------------
// Facebook


// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
console.log('statusChangeCallback');
console.log(response);
console.log(response.authResponse);
var accessToken = response.authResponse.accessToken;

//var data = {"input_token":accessToken,"access_token":""};
//$.ajax({
//    url: "graph.facebook.com/debug_token",
//    type: 'GET',
//    data: data,
//    dataType:'json',
//    success: function(data){
//      //On ajax success do this
//      alert(data);
//    }
//});
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
appId      : '1733704493575453',
cookie     : true,   
xfbml      : true,
//status	   : true,
version    : 'v2.5' 
});
console.log("FB init");
FB.getLoginStatus(function(response) {
statusChangeCallback(response);
});

};

//Load the SDK asynchronously
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
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
FB.api('/me', 'get', { fields: 'id,name,gender,email,first_name,locale,picture,timezone' }, function(response) {
  var id = response.id;
  var name = response.name;
  var email = response.email
  var first_name = response.first_name
//  console.log(response.last_name);
//  console.log(response.age_range);
//  console.log(response.link);
  var gender = response.gender;
  var locale = response.locale;
  var picture = response.picture.data.url;
  var timezone = response.timezone;
//  console.log(response.updated_time);
//  console.log(response.verified);
  var data = {"id":id,"name":name,"email":email,"first_name":first_name,"gender":gender,"locale":locale,"picture":picture,"timezone":timezone};
  console.log(data);
//  console.log(data.id);
//  console.log(data.picture);
  function getContextPath() { //obtains context path. EL doesn't work with separated .js
	  return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
  }
//  $.ajax({
//      url: getContextPath() + '/FacebookLoginServlet',
//      type: 'POST',
////      contentType:'application/json', //sent type
//      data: {"data" : JSON.stringify(data)},
//      dataType:'json', //response type
//      success: function(data){
//        //On ajax success do this
//			if(data[0].redirect) {
//			window.location.href = data[0].redirectURL;
//			}
//      }
//  });
});


}

function FacebookSignOut(){
if(FB.getAccessToken() != null) {
    FB.logout(function(response) {
        console.log("Facebook: User signed out.");
    });
}
}