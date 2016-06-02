<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{background: #eee url(http://subtlepatterns.com/patterns/sativa.png);}
html,body{
    position: relative;
    height: 100%;
}

.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
}

#output{
    position: absolute;
    width: 300px;
    top: -75px;
    left: 0;
    color: #fff;
}

#output.alert-success{
    background: rgb(25, 204, 25);
}

#output.alert-danger{
    background: rgb(228, 105, 105);
}


.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;

}

.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);

}

.avatar{
    width: 100px;height: 100px;
    margin: 10px auto 30px;
    border-radius: 100%;
    border: 2px solid #aaa;
    background-size: cover;
}

.form-box input{
    width: 100%;
    padding: 10px;
    text-align: center;
    height:40px;
    border: 1px solid #ccc;;
    background: #fafafa;
    transition:0.2s ease-in-out;

}

.form-box input:focus{
    outline: 0;
    background: #eee;
}

.form-box input[type="text"]{
    border-radius: 5px 5px 0 0;
    text-transform: lowercase;
}

.form-box input[type="password"]{
    border-radius: 0 0 5px 5px;
    border-top: 0;
}

.form-box button.login{
    margin-top:15px;
    padding: 10px 20px;
}

.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    -ms-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
}

</style>



<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input type="text" name="mail" id="mail" placeholder="usermail">
                    <input type="password" id="pwd" placeholder="password">
                    <button class="btn btn-info btn-block login" type="button">Login</button>
                    <a id="fpw" href="<%=request.getContextPath()%>/empLogin/foget_pw.jsp">忘記密碼</a>
<!--                     <a style="font-size: 5px;">忘記密碼</a> -->
                </form>
            </div>
        </div>
        
</div>

<script type="text/javascript">
// $(function(){
// 	var textfield = $("input[name=user]");
// 	            $('button[type="submit"]').click(function() {
	            	
// 	            	$.ajax({
// 	        			'type':'post',
// 	        			'url':'app_check',
// 	        			'dataType' :'JSON',
// 	        			"data":{"action" : "fmid" , "mid" : mid},
// 	        			'success':function(data){
	        				
// 	        			}
// 	        		})
	            	
	                

// 	            });
// 	});
 
	
$(function() {
	//alert()
	var hsn = window.location.host;
	var cpn = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var ctx ='http://'+hsn+cpn+'/ShowPicByAjax';
	//alert(cpn);
	//alert(ctx);
	var textfield = $("input[name=mail]");
	$('button[type="button"]').click(function() {
		//alert("btn click")
		var mail = $('#mail').val();
		var pwd = $('#pwd').val();
		$.ajax({
			'type':'get',
			'url':'EmpLoginServlet.do',
			'dataType' :'TEXT',
			"data":{"action" : "loginAjax" , "mail" : mail , "pwd" : pwd},
			'success':function(data){
				
				//little validation just to check username
                if (data == "success") {
                    //$("body").scrollTo("#output");
                    $('#fpw').remove();
                    $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
                    $("#output").removeClass(' alert-danger');
                    $("input").css({
                    "height":"0",
                    "padding":"0",
                    "margin":"0",
                    "opacity":"0"
                    });
                    //change button text 
                    $('button[type="submit"]').html("continue")
                    .removeClass("btn-info")
                    .addClass("btn-default").click(function(){
                    $("input").css({
                    "height":"auto",
                    "padding":"10px",
                    "opacity":"1"
                    }).val("");
                    });
                    
                    //show avatar
                    $(".avatar").css({
                        "background-image": "url("+ctx+")"
                        
                    });
                    setTimeout(login, 2000 )
                    function login(){
                    	window.location = ""+cpn+"/Backstage/product.jsp"
                    }
                    
                } else {
                    //remove success mesage replaced with error message
                    $("#output").removeClass(' alert alert-success');
                    $("#output").addClass("alert alert-danger animated fadeInUp").html("sorry enter a username ");
                }
                //console.log(textfield.val());
				
				
			}
		})
			
	})})



	
	
	
		
	
	

</script>



</body>
</html>