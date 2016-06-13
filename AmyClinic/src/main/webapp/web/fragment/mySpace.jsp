<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#mySpace {
	position: absolute;
	top: 350px;
	right: 2px;
	z-index: 9999;
	width: 144px;
	height: 144px;
}
#logo {
	border: 1px solid pink;
	border-radius: 144px;
}
</style>

<div id="mySpace">
	<a href="${pageContext.request.contextPath}/login/login.jsp"><img
		src="${pageContext.request.contextPath}/General/img/logo.jpg" alt=""
		id="logo"></a>
</div>

<script>
	$float_speed = 0;
	$my_Space = $("#mySpace");

	$(window).load(function() {
		thePosition = $('#mySpace').position().top;
		floats();
	});

	$(window).scroll(function() {
		floats();
	});

	function floats() {
		var scrollAmount = $(document).scrollTop();
		var newPosition = thePosition + scrollAmount;
		if ($(window).height() < $my_Space.height()) {
			$my_Space.css("top", thePosition);
		} else {
			$my_Space.stop().animate({
				top : newPosition
			}, $float_speed, function(x, t, b, c, d) {
				return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
			});
		}
	}
</script>