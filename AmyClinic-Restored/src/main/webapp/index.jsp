<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<!DOCTYPE html>
<!-- saved from url=(0063)http://www.beide.com.tw/demotype/flash/FLASH-02/JQ-2/index.html -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>-AMY-</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="jquery-1.3.2.js"></script> -->
<script type="text/javascript" src="js/supersized.2.0.js"></script>
<script type="text/javascript">
	$(function() {
		$.fn.supersized.options = {
			startwidth : 1920, //照片長度 
			startheight : 1080, //照片寬度
			vertical_center : 1, //垂直居中 1居中 0關閉
			slideshow : 1, //自動輪播 1開 0關
			navigation : 0, //播放控制鈕 1開 0關
			transition : 1, //0-None, 1-Fade, 2-slide top, 3-slide right, 4-slide bottom, 5-slide left //換場效果
			pause_hover : 0, //滑入停止輪播
			slide_counter : 0, //顯示圖片筆數 1開,0關
			slide_captions : 0, //圖片名稱
			slide_interval : 2000
		//換圖片時間
		//淡入圖片轉場時間要開啟supersized.2.0檔案，修改第218行的紅色數字
		};
		$('#supersize').supersized();
	});
</script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

#supersize {
	position: fixed;
}

#supersize img, #supersize a {
	height: 100%;
	width: 100%;
	position: absolute;
	z-index: 0;
}

#supersize .prevslide, #supersize .prevslide img {
	z-index: 1;
}

#supersize .activeslide, #supersize .activeslide img {
	z-index: 2;
}
</style>
<!--[if lt IE 9]>
		<script src="http://htmL5shim.googlecode.com/svn/trunk/html5.js">	
		</script>
		<![endif]-->
</head>

<body marginwidth="0" marginheight="0">
	<div id="supersize" 	style="height: 856px; width: 1521.77777777778px; display: none;">
		<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img src="images/home01.jpg" title="" ></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="images/home02.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="images/home03.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="images/home04.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="images/home05.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="images/home06.jpg" title=""></a>
	</div>
	<!-- 		test -->
<div style="z-index:9999; position: relative;" align="center"  valign="center">
<div id="allpage">
		<header >
			<marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#FF9D6F" direction="right" height="20" scrollamount="8" behavior="alternate">歡迎光臨-AMY-限時特價藥妝、醫美保養品,☆專業醫美品牌☆</marquee>
		</header>
		<!--top image-->

		<article>
			<h2 class="title"></h2>
			<!--黒底標題-->
			<section>
				<a href="http://www.w3schools.com/"></a> 
				<br> <a href="http://www.w3schools.com/"> 
				<img src="http://zippy.gfycat.com/MedicalBrownFoxhound.gif" alt="請重新整理"
					title="動子動" class="litimg" width="300px" /></a>

			</section>
<!-- Henry's test login --><hr/>
<div style="bgcolor='#FF9D6F'">
		<a href="login/login.jsp">Login page</a><br>
		<a href="register/register.jsp">Register a new account</a><br>		

<!--           	 namespace/action name.action  target registered in struts.xml-->
		<a href="member/editprofile.action">Edit Account Information</a><br>
<!--                    	 namespace/action name                      target registered in struts.xml-->		
<%-- 		<a href="<s:url action="member/member2"/>">login required page 2  -- member/memberonly2.jsp")</a><br>		 --%>
<!-- 		<a href="public/publicpage.jsp">login not required page</a><hr> -->
		<a href="<s:url action="free/public"/>">一般頁面1(free/HelloWorld.action --   free/HelloWorld.jsp")</a><br>
<!-- Henry's test login -->

<!-- 購物系統測試 -->

		<a href="shopping/prod_list.jsp">商品列表(不需登入)</a><br>

		<a href="shopping/OrdersServlet" >查詢訂單(需登入)</a><br>
<!-- 預約系統測試 -->
		
		<a href="app/add_app.jsp">線上預約(需登入)</a><br>

		<a href="app/query_app.jsp" >查詢預約(需登入)</a><br>
		
		<a href="Backstage/login.jsp" >員工登入</a><br>
		
		<input type="button" value="麗質不必天生，美麗可以創造，專業的醫美團隊AMY" src="register/register.jsp" style="font-style: italic;font-family: fantasy;font-size: xx-large;"/>
</div>		
		</article>
		<aside></aside>


<hr>
		<footer>
			<p>E-amil:xxx@gmail.com &nbsp; Tel:0999-999-999 &nbsp;
				Hello-Word國際碼業集團 &nbsp; &copy; 2016 EEIT85team03<a href="Backstage/0ininder.jsp">後台專區</a><br></p>
		</footer>
	</div>
</div>
<!-- 		test-->

</body>
</html>
