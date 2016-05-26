<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  pageEncoding="UTF-8"  errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/Backstage/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/Backstage/css/sb-admin.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/Backstage/css/plugins/morris.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="<%=request.getContextPath()%>/Backstage/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom Fonts -->
<script src="<%=request.getContextPath()%>/Backstage/js/jquery.js"></script>
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/Backstage/js/bootstrap.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/Backstage/js/plugins/morris/raphael.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="<%=request.getContextPath()%>/Backstage/js/plugins/morris/morris.min.js"></script>
<script src="<%=request.getContextPath()%>/Backstage/js/plugins/morris/morris-data.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.bg {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: -999;
}

.bg img {
	min-height: 100%;
	width: 100%;
}
</style>
</head>
<body>
	<!--top Navigation 導航-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="ininder.jsp">☆AMY診所☆終極管理系統☆Pro_3_01☆</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu message-dropdown">
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								width="50px"
								src="http://2.blog.xuite.net/2/5/0/b/22959614/blog_1733140/txt/35316357/0.jpg"
								alt=""> <!--                                         訊息圖 -->
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>涼麵趁熱吃</strong>
								</h5>
								<!--                                         簡訊名 -->
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> 昨天 at 4:32 PM
								</p>
								<p>從前有賣韮、蒜、蔥及白菜的四個朋友，每天收市以後，便在一處喝酒，但賣白菜的那位最吝嗇，從來不曾請過客。</p>
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								width="50px"
								src="http://ext.pimg.tw/yysky/1396003820-231168804.jpg" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>鈴兒兔</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> 昨天 at 14:25 PM
								</p>
								<p>你跨年有空嗎？......有..........那我跟你換班</p>
							</div>
						</div>
				</a></li>
				<li class="message-footer"><a href="#">訊息管理</a></li>
			</ul></li>
		<!--                                         訊息區over -->
		<!--                                         通知區-->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-bell"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu alert-dropdown">
				<li><a href="#">您的帳號已鎖定<span class="label label-default">0</span></a></li>
				<li><a href="#">您的帳號已開通<span class="label label-primary">1</span></a></li>
				<li><a href="#">您的帳號已鎖定<span class="label label-success">0</span></a></li>
				<li><a href="#">您的帳號已開通<span class="label label-info">1</span></a></li>
				<li><a href="#">您的帳號已鎖定<span class="label label-warning">0</span></a></li>
				<li><a href="#">您的帳號已開通<span class="label label-danger">1</span></a></li>
				<li class="divider"></li>
				<li><a href="#">查看所有通知</a></li>
			</ul></li>
		<!--                                         通知區over-->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i>涼麵趁熱吃<b
				class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="#"><i class="fa fa-fw fa-user"></i>我的帳戶</a></li>
				<li><a href="#"><i class="fa fa-fw fa-envelope"></i>訊息管理</a></li>
				<li><a href="#"><i class="fa fa-fw fa-gear"></i>喜好設定</a></li>
				<li class="divider"></li>
				<li><a href="#"><i class="fa fa-fw fa-power-off"></i><b>登出!</b></a></li>
			</ul></li>
	</ul>
	<!--  topover--><!--  topover--><!--  topover--><!--  topover--><!--  topover-->
	<!-- 側邊欄功能表項目-對應導航功能表 -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class="active"><a
				href="<%=request.getContextPath()%>/index.jsp"><i
					class="fa fa-fw fa-dashboard"></i>-Amy醫美前端-</a></li>
			<li><a href="procedures.jsp"><i
					class="fa fa-fw fa-bar-chart-o"></i>療程管理</a></li>
			<li><a href="#"><i class="fa fa-fw fa-table"></i>預約系統</a></li>
			<li><a href="#"><i class="fa fa-fw fa-edit"></i>醫師排班</a></li>
			<li><a href="#"><i class="fa fa-fw fa-desktop"></i>會員管理</a></li>
			<li><a href="product.jsp"><i class="fa fa-fw fa-desktop"></i>商品管理</a></li>
			<li><a href="#"><i class="fa fa-fw fa-wrench"></i>客服系統</a></li>
			<li><a href="#"><i class="fa fa-fw fa-file"></i>員工管理</a></li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i>熱銷項目<i
					class="fa fa-fw fa-caret-down"></i></a>
				<ul id="demo" class="collapse">
					<li><a href="#">熱銷產品</a></li>
					<li><a href="#">熱銷療程</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-fw fa-dashboard"></i> RTL
					Dashboard</a></li>
		</ul>
	</div>
	</nav>
	<!-- /.navbar-collapse -->
	<div class="bg">
		<img src="<%=request.getContextPath()%>/images/b_01.jpg">
	</div>
</body>
</html>