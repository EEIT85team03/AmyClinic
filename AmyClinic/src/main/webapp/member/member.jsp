<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/General/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/css/member.css" />
<title>會員專區</title>
<script src="js/modernizr.js"></script>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="tabs member-wrapper">
	<div id="member-bar">
	<h1 class="ribbon">Hello your user majesty!</h1>
	<nav>
		<ul>
			<li><a href="#section-bar-1">歡迎頁面</a></li>
			<li><a href="#section-bar-2">編輯資料</a></li>
			<li><a href="#section-bar-3">我的購物車</a></li>
			<li><a href="#section-bar-4">我的訂單</a></li>
			<li><a href="#section-bar-5">查詢訂單</a></li>
			<li><a href="#section-bar-6">我的預約紀錄</a></li>
			<li><a href="#section-bar-7">最新活動</a></li>
			<li><a href="#section-bar-8">線上客服</a></li>
		</ul>
	</nav>
	</div>
	<div class="content-wrap">
    <div class="circle top left"></div>
    <div class="circle top right"></div>
    <div class="circle bottom left"></div>
    <div class="circle bottom right"></div>   
<section id="section-bar-1">
    <div class="flag">Hello your user majesty!</div>
    <div class="corner-ribbon corner-ribbon-left-top"><span>NEW</span></div>
    <div class="corner-ribbon corner-ribbon-right-top"><span>NEW</span></div>
  <h1 class="Hello-banner">&bull; Keep in Touch &bull;</h1>
  <div class="icon_wrapper"></div>
  <div class="underline"></div>
  <form action="#" method="post" id="contact_form">
  	<div class="submit">
      <input type="submit" value="Send Message" id="form_button" />
      <img src="nan.jpg" alt="">
    </div>
    <br>
    <br>
    <div class="name">
      <label for="name"></label>
      <input type="text" placeholder="My name is" name="name" id="name_input" required>
    </div>
    <div class="email">
      <label for="email"></label>
      <input type="email" placeholder="My e-mail is" name="email" id="email_input" required>
    </div>
    <div class="telephone">
      <label for="name"></label>
      <input type="text" placeholder="My number is" name="telephone" id="telephone_input" required>
    </div>
    <div class="subject">
      <label for="subject"></label>
      <select name="subject" id="subject_input" required>
        <option disabled selected>Subject line</option>
        <option>I'd like to start a project</option>
        <option>I'd like to ask a question</option>
        <option>I'd like to make a proposal</option>
      </select>
    </div>
    <div class="message">
      <label for="message"></label>
    </div>
  </form><!-- // End form -->
    <div class="flag">
			Hello your user majesty!
		</div>
 </section>
<section id="section-bar-2"><p><jsp:include page="/login/editprofile.jsp"></jsp:include></p></section>
<section id="section-bar-3"><p>3</p></section>
<section id="section-bar-4"><p>4</p></section>
<section id="section-bar-5"><p>5</p></section>
<section id="section-bar-5"><p>6</p></section>
<section id="section-bar-5"><p>7</p></section>
<section id="section-bar-5"><p>8</p></section>
 </div>
 </div>
<jsp:include page="/General/footer.jsp"></jsp:include>
 <script src="js/member.js"></script>
        <script>
            (function() {

                [].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
                    new CBPFWTabs( el );
                });

            })();
        </script>
</body>
</html>