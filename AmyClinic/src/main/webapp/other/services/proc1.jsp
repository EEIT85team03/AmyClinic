<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${proc.name}</title>
<link href="${pageContext.request.contextPath}/General/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/other/services/css/normalize.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/other/services/css/style.css"
	rel="stylesheet">
<style type="text/css">
#allpage {
	width: 1200px;
	margin: 0 auto;
}

#content {
	overflow: auto !important;
	overflow /**/: hidden;
	width: 100%;
	padding-bottom: 20px;
}

aside {
	float: left;
}

article {
	float: right;
	width: 800px;
}

.intro {
	text-align: left;
}
</style>
</head>
<body>
	<jsp:include page="/General/header.jsp"></jsp:include>
	<div id="allpage">
		<div id="content">
			<aside> 
				<jsp:include page="/other/services/aside.jsp"></jsp:include>
			</aside>
			<article id="a1">
				<img src="${pageContext.request.contextPath}/other/services/img/1-1.jpg"/><br>
				<br>
				<h1>三明治豐胸法</h1>
				
				<p class="intro">此法是從美國、日本等國多位醫師的臨床案例所研發的複合式美胸法，結合「自體脂肪隆乳豐胸」及「果凍矽膠隆乳」的雙方優點，為不滿胸前無料的女性找到自然且立即的隆乳技術。</p>
				
				<p class="intro">三明治豐胸法會因不同的手術順序與方法，而有不同效果，手術複雜且專業，執刀醫師必須熟稔兩種豐胸技術，才能成功達到理想效果。 不論手術方法的先後順序，三明治法大至可分成立即性與延遲性兩種類別。所謂的立即性就是一次手術即完成三明治豐胸法，延遲性則是原本先做了單項豐胸手術，事後為了修飾胸型再進行第二種手術。</p>

			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>