<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/General/img/logo.ico" />
<script> 
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1733704493575453',
      xfbml      : true,
      version    : 'v2.6'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<span class="fb-like" data-width="450" data-show-faces="true" data-layout="button"></span>
<div id="headerbox">
	<div id="banner">
	<a href="${pageContext.request.contextPath}/index.jsp">	
	<img src="${pageContext.request.contextPath}/General/img/img04.jpg" alt="">
	</a>
	</div>
	<hr />
	<div id="header">
	<div id="menu">
		<ul>
			<li class='has-sub'><a href="#">關於我們</a>
				<ul>
					<li><a href='#'><span>國民大會</span></a></li>
					<li><a href='#'><span>齊頭式平等</span></a></li>
					<li><a href='#'><span>權能區分</span></a></li>
					<li><a href='${pageContext.request.contextPath}/free/showophr'><span>門診時間表及醫師介紹</span></a></li>
					<li><a href='#'><span>政府機器論</span></a></li>
					<li><a href='#'><span>民權初步</span></a></li>
					<li class='last'><a href='#'><span>革命民權</span></a></li>
				</ul></li>
			<li><a href="#">最新消息</a></li>
			<li class='has-sub'><a href="${pageContext.request.contextPath}/member/member.jsp">會員專區</a>
				<ul>
					<li class='has-sub'><a href='#'><span>民生主義</span></a>
						<ul>
							<li><a href='#'><span>國營事業</span></a></li>
							<li><a href='#'><span>土地增值稅</span></a></li>
							<li><a href='#'><span>漲價歸公</span></a></li>
							<li><a href='#'><span>三七五減租</span></a></li>
							<li><a href='#'><span>累進稅率</span></a></li>
							<li><a href='#'><span>實業計畫</span></a></li>
							<li><a href='#'><span>平均地權</span></a></li>
							<li><a href='#'><span>耕者有其田</span></a></li>
							<li class='last'><a href='#'><span>節制資本</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>民權主義</span></a>
						<ul>
							<li><a href='#'><span>選舉權</span></a></li>
							<li><a href='#'><span>罷免權</span></a></li>
							<li><a href='#'><span>創制權</span></a></li>
							<li class='last'><a href='#'><span>複決權</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>建國大綱</span></a>
						<ul>
							<li><a href='#'><span>建國方略</span></a></li>
							<li><a href='#'><span>革命方略</span></a></li>
							<li><a href='#'><span>三民主義十六講</span></a></li>
							<li class='last'><a href='#'><span>知難行易</span></a></li>
						</ul></li>
				</ul></li>
			<li class='has-sub'><a href="#">服務項目</a>
				<ul>
					<li class='has-sub'><a href='#'><span>整形手術</span></a>
						<ul>
							<li><a href='#'><span>豐胸術</span></a></li>
							<li><a href='#'><span>隆鼻術</span></a></li>
							<li><a href='#'><span>脂肪移植</span></a></li>
							<li><a href='#'><span>拉皮術</span></a></li>
							<li><a href='#'><span>蘿蔔腿縮小術</span></a></li>
							<li class='last'><a href='#'><span>雙眼皮</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>雷射光療</span></a>
						<ul>
							<li><a href='#'><span>雷射除毛</span></a></li>
							<li><a href='#'><span>雷射淨膚</span></a></li>
							<li><a href='#'><span>雷射除痣</span></a></li>
							<li><a href='#'><span>粉餅雷射</span></a></li>
							<li><a href='#'><span>變頻飛梭</span></a></li>
							<li class='last'><a href='#'><span>脈衝光</span></a></li>
						</ul></li>
					<li><a href='#' class='has-sub'><span>瘦身雕塑</span></a>
						<ul>
							<li><a href='#'><span>震波減脂</span></a></li>
							<li><a href='#'><span>冷凍減脂</span></a></li>
							<li><a href='#'><span>威塑減脂</span></a></li>
							<li><a href='#'><span>水刀抽脂</span></a></li>
							<li><a href='#'><span>爆脂衝擊波</span></a></li>
							<li class='last'><a href='#'><span>黃金脂雕</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>微整形</span></a>
						<ul>
							<li><a href='#'><span>波尿酸</span></a></li>
							<li><a href='#'><span>晶亮瓷</span></a></li>
							<li><a href='#'><span>水微晶</span></a></li>
							<li><a href='#'><span>膠原蛋白</span></a></li>
							<li><a href='#'><span>微針療程</span></a></li>
							<li class='last'><a href='#'><span>無痕植髮</span></a></li>
						</ul></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/app/add_app.jsp">線上預約</a></li>
			<li><a href="${pageContext.request.contextPath}/shopping/prod_list.jsp">線上購物</a></li>
			<li><a href="${pageContext.request.contextPath}/ChatClient.jsp">專員諮詢</a></li>
		</ul>
	</div>
<!-- 	<div id="search"> -->
<!-- 		<form method="get" action=""> -->
<!-- 			<fieldset> -->
<!-- 				<input type="text" name="s" id="search-text" size="15" /> <input -->
<!-- 					type="submit" id="search-submit" value="GO" /> -->
<!-- 			</fieldset> -->
<!-- 		</form> -->
<!-- 	</div> -->
</div>
</div>