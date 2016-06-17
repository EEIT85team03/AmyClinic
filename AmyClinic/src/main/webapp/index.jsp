<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css" rel="stylesheet">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<style type="text/css">
body{ 
 background-image: url("images/home07.jpg"); }
#header{
background-color: #AE00AE;
}
/* #banner a img{ */
/* width: 100%; */
/* } */
#banner a img {visibility:hidden;}
#LoginBoxText p a{color: white;}
.img{width: 800px; height: 500px;}
a:hover {
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
  /* IE 8 */
  filter: alpha(opacity=50);
  /* IE7 */
  opacity: 0.6;
  text-decoration: none;
}
.container-fluid {
/*   margin: 40px auto 10px; */
/*   padding: 20px 0px; */
  max-width: 800px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.page-header{margin:0px auto;}
#page {
	width: 100%;
	margin: 0 auto;
	padding-top: 0px;
}
font{
font-family: myfont;
background-color: #fff;
}
#footer {
	width: 100%;
	background-color: #AE00AE;
 	padding-top: 0px; 
}
#footer-bgcontent {
 	height: 0px; 
	background-color: #AE00AE;

}
.imgmsg{
font-size: 40px;
} 
</style>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<title>愛美首頁</title>
</head>
<body>
	<!-- facebook script -->
	<div id="fb-root"></div>
	<script src="${pageContext.request.contextPath}/js/facebook.login.js"></script>
	<!-- end facebook script -->
	<s:include value="/General/header.jsp"></s:include>
	<center>
<h1 ><font color=#FF8000 class='fa fa-smile-o'  >麗質不必天生，美麗可以創造，專業的醫美團隊AMY</font></h1><br>
<%-- <img src="${pageContext.request.contextPath}/images/logo.jpg" class="img-circle">  --%>
</center>
<div class="container-fluid">
<div class="row-fluid">
<div class="span12">
<%-- <div class="page-header"></div> --%>     
    <div class="carousel slide" id="myCarousel">
        <div class="carousel-inner">
 
            <div class="item active">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home01.jpg" title=""  class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg' color=#FF8000 >臨行密密縫，意恐遲遲歸</font></center></div>                	               	
                </div>                                                       
            </div><!-- /Slide1 --> 

            <div class="item">   
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home02.jpg" title="" class='img'></a>
                </div>                        
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg'  color=#FF8000>執手相看淚眼，竟無語凝噎</font></center></div>                	
                </div>                                                        
            </div><!-- /Slide2 -->             

            <div class="item">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home03.jpg" title="" class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg'  color=#FF8000>桃花潭水深千尺，不及汪倫送我情</font></center></div>                                                       
            </div>                         
        </div><!-- /Slide3 -->  
        
           <div class="item">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home04.jpg" title="" class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg'  color=#FF8000>國際級醫學美容高級品牌</font></center></div>                                                       
            </div>                         
        </div><!-- /Slide4 -->  
        
           <div class="item">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home05.jpg" title="" class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg'  color=#FF8000>給您貴婦般的奢華體驗</font></center></div>                                                       
            </div>                         
        </div><!-- /Slide5 -->  
        
           <div class="item">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home06.jpg" title="" class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font class='imgmsg'  color=#FF8000>充滿設計感的櫃檯</font></center></div>                                                       
            </div>                         
        </div><!-- /Slide6 -->  
                             
    </div><!-- /#myCarousel -->
        
</div><!-- /.span12 -->          
</div><!-- /.row --> 
</div><!-- /.container -->                      
<script type="text/javascript">// Carousel Auto-Cycle
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 3000
    })
  });
</script>


<!-- 1 -->
	
	<!-- Google script -->
	<script src="${pageContext.request.contextPath}/js/google.login.js"></script>
	<!-- Henry's Custom logout -->
	<script>
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
	<script>
	function fb_login() {
	    FB.login( function() {checkLoginState();}, { scope: 'email,public_profile' } );
	    
	}

	</script>
	
<%-- 	<jsp:include page="/General/footer.jsp" /> --%>
	<s:include value="/General/footer.jsp"></s:include>

</body>
</html>