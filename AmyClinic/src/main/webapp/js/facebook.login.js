

	// This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
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
    status	   : true,
    version    : 'v2.5' 
  });

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

//   Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
//  (function(d, s, id) {
//	  var js, fjs = d.getElementsByTagName(s)[0];
//	  if (d.getElementById(id)) return;
//	  js = d.createElement(s); js.id = id;
//	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=1733704493575453";
//	  fjs.parentNode.insertBefore(js, fjs);
//	}(document, 'script', 'facebook-jssdk')); 
 
  
  
//  https://developers.facebook.com/docs/facebook-login/permissions
  function testAPI() {
    FB.api('/me', 'get', { fields: 'id,name,gender,email,first_name,locale,picture,timezone' }, function(response) {
      console.log(response.id);
      console.log(response.name);
      console.log(response.email);
      console.log(response.first_name);
//      console.log(response.last_name);
//      console.log(response.age_range);
//      console.log(response.link);
      console.log(response.gender);
      console.log(response.locale);
      console.log(response.picture);
      console.log(response.timezone);
//      console.log(response.updated_time);
//      console.log(response.verified);
    });
  }

  
 

