<!DOCTYPE html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- <title>-AMY-</title> -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/supersized.2.0.js"></script>
<script type="text/javascript">
	$(function() {
		$.fn.supersized.options = {
			startwidth : 1920, //照片長度 
			startheight : 1080, //照片寬度
			vertical_center : 1, //垂直居中 1居中 0關閉
			slideshow : 1, //自動輪播 1開 0關
			navigation : 0, //播放控制鈕 1開 0關
			transition : 0, //0-None, 1-Fade, 2-slide top, 3-slide right, 4-slide bottom, 5-slide left //換場效果
			pause_hover : 0, //滑入停止輪播
			slide_counter : 0, //顯示圖片筆數 1開,0關
			slide_captions : 0, //圖片名稱
			slide_interval : 3000
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

/* #logo{ */
/* 	float:left; */
/* 	width:60px; */
/* 	height:60px; */
/* 	border-radius:50%; */
	
/* } */
</style>

<!--[if lt IE 9]>
		<script src="http://htmL5shim.googlecode.com/svn/trunk/html5.js">	
		</script>
		<![endif]-->
<%-- <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/General/img/logo.ico" /> --%>
</head>

<body marginwidth="0" marginheight="0">
	<div id="supersize" 	style="height: 856px; width: 1521.77777777778px; display: none;">
		<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img src="${pageContext.request.contextPath}/images/home01.jpg" title="" ></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home02.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home03.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home04.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home05.jpg" title=""></a> 
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home06.jpg" title=""></a>
			<a	style="height: 856px; width: 1521.77777777778px; left: -121px; top: 0px;">
			<img	src="${pageContext.request.contextPath}/images/home07.jpg" title=""></a>
	</div>
	<!-- 		test -->
<div style="z-index:9999; position: relative;" align="center" align="center">
<div id="allpage">
<!-- 		<header > -->
<!-- 			<marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#FF9D6F" direction="right" height="20" scrollamount="8" behavior="alternate">歡迎光臨-AMY-限時特價藥妝、醫美保養品,☆專業醫美品牌☆</marquee> -->
<!-- 		</header> -->
<%-- 		<s:include value="/General/header.jsp"></s:include> --%>

		</div>
</div><!-- 		大區塊-->


</body>
</html>