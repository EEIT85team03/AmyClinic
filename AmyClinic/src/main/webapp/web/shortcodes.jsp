<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Prevention a Medical Category Flat Bootstrap Responsive Website Template | Short Codes :: w3layouts</title>
<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content=" Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	
<!-- js -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- js -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script>		
		<!-- js for news -->
		<script src="js/jquery.easing.min.js"></script>
		<script type="text/javascript" src="js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
				$(window).load(function() {
					$('#visual').pignoseLayerSlider({
						play    : '.btn-play',
						pause   : '.btn-pause',
						next    : '.btn-next',
						prev    : '.btn-prev'
					});
				});
			//]]>
			</script>
		<!-- /js for news -->
		
		<!-- for smooth scrolling -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		</script>
		<!-- //for smooth scrolling -->
</head>
<body>
	<!-- header -->
	<div class="top-strip">
		<div class="container-fluid">
			<div class="social-icons">
				<a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
				<a class="twitter" href="#"><i class="fa fa-twitter"></i></a>
				<a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a>
				<a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a>
				<a class="tumblr" href="#"><i class="fa fa-tumblr"></i></a>
			</div>
			<div class="contact-info">
				<ul>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>+0123 384 920</li>
					<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">contact@yourdomain.com</a></li>
				</ul>
			</div>
			<!-- Large modal -->
			<div class="selectpackage">
				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Packages</button>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;</button>
									<h4 class="modal-title package-title" id="myModalLabel">
										PREVENTIVE HEALTH CHECK UP PACKAGES</h4>
								</div>
								<div class="modal-body packages">
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>A set of basic tests that can give a broad overview of your health status.</p>
											<i class="fa fa-heartbeat"></i>
											<h4>MASTER HEALTH CHECK</h4>
											<a href="book-a-test.html">Book Now</a>
										</div>
									</div>
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>Are you looking for a comprehensive health check that includes even Eye, Dental and ENT checks?</p>
											<i class="fa fa-medkit"></i>
											<h4>WHOLE BODY CHECKUP</h4>
											<a href="book-a-test.html">Book Now</a>
										</div>
									</div>
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>Do you wish to check your body out for an entire spectrum of diseases in a luxurious ambience?</p>
											<i class="fa fa-user-md"></i>
											<h4>HEALTH CHECK 1 AND 2</h4>
											<a href="book-a-test.html">Book Now</a>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				<script>
				$('#myModal').modal('');
				</script>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<nav class="navbar nav_bottom" role="navigation">
	 <div class="container">
	 <!-- Brand and toggle get grouped for better mobile display -->
	   <div class="navbar-header nav_2">
		  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="#"></a>
	   </div> 
	   <!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
			<ul class="nav navbar-nav nav_1">
				<li><a href="index.html">Home</a></li>
				<li><a href="about.html">About</a></li>
				<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Lab<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="laboratory.html">About Lab</a></li>
					<li><a href="quality.html">Quality</a></li>
					<li><a href="technologies.html">Technologies</a></li>
					<li><a href="instruments.html">Instruments</a></li>
				  </ul>
				</li>
				<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Book Test<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="book-a-test.html">Book a Test</a></li>
					<li><a href="test-list.html">Test Menu</a></li>
				  </ul>
				</li>
				<li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Opportunity<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="career.html">Careers</a></li>
					<li><a href="404.html">Franchisee</a></li>
				  </ul>
				</li>
				<li class="dropdown current_page">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="news.html">News</a></li>
					<li><a href="faq.html">Faq</a></li>
					<li><a href="mobile-app.html">App</a></li>
					<li><a href="login.html">Login</a></li>
					<li><a href="terms.html">Terms of Use</a></li>
					<li><a href="shortcodes.html">Shortcodes</a></li>
					<li><a href="privacy_policy.html">Privacy Policy</a></li>
				  </ul>
				</li>
				<li><a href="blog.html">Blog</a></li>
				<li><a href="contact.html">Contact</a></li>
			</ul>
		 </div><!-- /.navbar-collapse -->
	   </div>
	</nav>
	<!-- //header -->
		<!-- shortcodes-section -->
		<section class="typography">
			<div class="inner-banner demo-2 text-center">
				<header class="logo">
					<h1><a class="cd-logo link link--takiri" href="index.html">Prevention <span>is better than cure.</span></a></h1>
				</header>
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Shortcodes</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- shortcodes ---->
			<div class="shortcodes">
				<div class="container">
					<h3 class="last-updated">Shortcodes</h3>
					<div class="typrography">
					<div class="grid_3 grid_4 wow fadeInLeft animated" data-wow-delay=".5s">
					 <h3 class="bars">Headings</h3>
							 
					 <article class="headings">
						<h1>H1 Style Font Size 36px</h1>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
					
						<h2>H2 Style Font Size 30px</h2>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
						
						<h3>H3 Style Font Size 28px</h3>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
					
						<h4>H4 Style Font Size 24px</h4>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
						
						<h5>H5 Style Font Size 20px</h5>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
						
						<h6>H6 Style Font Size 16px</h6>
						<p>perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem</p>
					 </article>
						  </div>
						  <div class="grid_3 grid_5 wow fadeInRight animated" data-wow-delay=".5s">
							<h3 class="bars">Buttons</h3>
								  <h1 class="t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h1>
							  <h2 class="t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h2>
							  <h3 class="t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h3>
							  <h4 class="typ1 t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h4>
							  <h5 class="typ1 t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h5>
							  <h6 class="typ1 t-button">
								<a href="#"><span class="label label-default">Default</span></a>
								<a href="#"><span class="label label-primary">Primary</span></a>
								<a href="#"><span class="label label-success">Success</span></a>
								<a href="#"><span class="label label-info">Info</span></a>
								<a href="#"><span class="label label-warning">Warning</span></a>
								<a href="#"><span class="label label-danger">Danger</span></a>
							  </h6>
						  </div>
						  <div class="col-sm-6 col-md-6 col-lg-6 mb-60">
							<h4 class="text-blue title-border mb-30 bars">Alert Boxes</h4>
							<div class="alert alert-success alert-dismissable">
							  <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> × </button>
							  Success! Well done its submitted. </div>
							<div class="alert alert-info alert-dismissable">
							  <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> × </button>
							  Info! take this info. </div>
							<div class="alert alert-warning alert-dismissable">
							  <button aria-hidden="true" data-dismiss="alert" class="close" type="button"> × </button>
							  Warning ! Dont submit this. </div>
							<div class="alert alert-danger alert-dismissable">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button"> × </button>
								Error ! Change few things. </div>
						  </div>
						  <div class="col-sm-6 col-md-6 col-lg-6 mb-60">
							<h4 class="text-blue title-border mb-30 bars">Tab</h4>            
							<div class="horizontal-tab">
							  <ul class="nav nav-tabs">
								<li class=""><a href="#tab1" data-toggle="tab" aria-expanded="false">Tab1</a></li>
								<li class=""><a href="#tab2" data-toggle="tab" aria-expanded="false">Tab2</a></li>
								<li class=""><a href="#tab3" data-toggle="tab" aria-expanded="false">Tab3</a></li>
								<li class="active"><a href="#tab4" data-toggle="tab" aria-expanded="true">Tab4</a></li>
							  </ul>
							  <div class="tab-content">
								<div class="tab-pane fade" id="tab1">
								  <div class="row">
									<div class="col-md-12">
									  <p>Tab 1 : Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias atque autem fuga similique, mollitia impedit maxime sapiente omnis blanditiis qui iste aliquam, quisquam eos, earum.</p>
									  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat ex hic, maiores excepturi, doloribus modi.</p>
									</div>
								  </div>
								</div>
								<div class="tab-pane" id="tab2">
								  <div class="row">
									<div class="col-md-12">
									  <p>Tab 2 : Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias atque autem fuga similique, mollitia impedit maxime sapiente omnis blanditiis qui iste aliquam, quisquam eos, earum.</p>
									  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat ex hic, maiores excepturi, doloribus modi.</p>
									</div>
								  </div>
								</div>
								<div class="tab-pane" id="tab3">
								  <div class="row">
									<div class="col-md-12">
									  <p>Tab 3 : Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias atque autem fuga similique, mollitia impedit maxime sapiente omnis blanditiis qui iste aliquam, quisquam eos, earum.</p>
									  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat ex hic, maiores excepturi, doloribus modi.</p>
									</div>
								  </div>
								</div>
								<div class="tab-pane active in" id="tab4">
								  <div class="row">
									<div class="col-md-12">
									  <p>Tab 4 : Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias atque autem fuga similique, mollitia impedit maxime sapiente omnis blanditiis qui iste aliquam, quisquam eos, earum.</p>
									  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat ex hic, maiores excepturi, doloribus modi.</p>
									</div>
								  </div>
								</div>
							  </div>
							</div>
						  </div>
						  <div class="clearfix"></div>
						  <div class="grid_3 grid_5 wow fadeInLeft animated" data-wow-delay=".5s">
							 <h3 class="bars">Progress Bars</h3>
							  <div class="tab-content">
								 <div class="tab-pane active" id="domprogress">
									 <div class="progress">    
										  <div class="progress-bar progress-bar-primary" style="width: 20%"></div>
									 </div>
									 <p>Info with <code>progress-bar-info</code> class.</p>
									 <div class="progress">    
										 <div class="progress-bar progress-bar-info" style="width: 60%"></div>
									 </div>
									 <p>Success with <code>progress-bar-success</code> class.</p>
									 <div class="progress">
										 <div class="progress-bar progress-bar-success" style="width: 30%"></div>
									 </div>
									 <p>Warning with <code>progress-bar-warning</code> class.</p>
									 <div class="progress">
										 <div class="progress-bar progress-bar-warning" style="width: 70%"></div>
									 </div>
									 <p>Danger with <code>progress-bar-danger</code> class.</p>
									 <div class="progress">
										 <div class="progress-bar progress-bar-danger" style="width: 50%"></div>
									 </div>
									 <p>Inverse with <code>progress-bar-inverse</code> class.</p>
									 <div class="progress">
										 <div class="progress-bar progress-bar-inverse" style="width: 40%"></div>
									 </div>
									 <p>Inverse with <code>progress-bar-inverse</code> class.</p>
									 <div class="progress">
										 <div class="progress-bar progress-bar-success" style="width: 35%"><span class="sr-only">35% Complete (success)</span></div>
										 <div class="progress-bar progress-bar-warning" style="width: 20%"><span class="sr-only">20% Complete (warning)</span></div>
										 <div class="progress-bar progress-bar-danger" style="width: 10%"><span class="sr-only">10% Complete (danger)</span></div>
									 </div>
								   </div>
							   </div>
						   </div>
						   
						   <div class="grid_3 grid_5 wow fadeInRight animated" data-wow-delay=".5s">
							 <h3 class="bars">Pagination</h3>
							 <div class="col-md-6">
								  <nav>
								  <ul class="pagination pagination-lg">
									<li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								  </ul>
								  </nav>
								  <nav>
								  <ul class="pagination">
									<li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								  </ul>
								 </nav>
								 <nav>
								   <ul class="pagination pagination-sm">
									<li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								  </ul>
								 </nav>				 
							 </div>
							 <div class="col-md-6">
									<ul class="pagination pagination-lg">
													<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
													<li class="active"><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
												</ul>
								<nav>
								  <ul class="pagination">
									<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								 </ul>
							   </nav>
								 <ul class="pagination pagination-sm">
									<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
								</ul>
								</div>
							   <div class="clearfix"> </div>
						 </div>

					 <div class="list_1">
						 <div class="progress-content">
							<h3>Default</h3>
								<div class="progress default"><div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Default</span>60%</div></div>
								<div class="progress default"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"><span class="progress-label">Success</span>40%</div></div>
								<div class="progress default"><div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;"><span class="progress-label">Info</span>20%</div></div>
								<div class="progress default"><div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Warning</span>60%</div></div>
								<div class="progress default"><div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"><span class="progress-label">Danger</span>80%</div></div>
								<div class="spacer spacer-normal "></div>
								<h3>Striped</h3>
								<div class="progress progress-striped"><div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Default</span>60%</div></div>
								<div class="progress progress-striped"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"><span class="progress-label">Success</span>40%</div></div>
								<div class="progress progress-striped"><div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;"><span class="progress-label">Info</span>20%</div></div>
								<div class="progress progress-striped"><div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Warning</span>60%</div></div>
								<div class="progress progress-striped"><div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"><span class="progress-label">Danger</span>80%</div></div>
								<div class="spacer spacer-normal "></div>
								<h3>Animated</h3>
								<div class="progress progress-striped active"><div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Default</span>60%</div></div>
								<div class="progress progress-striped active"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"><span class="progress-label">Success</span>40%</div></div>
								<div class="progress progress-striped active"><div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;"><span class="progress-label">Info</span>20%</div></div>
								<div class="progress progress-striped active"><div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"><span class="progress-label">Warning</span>60%</div></div>
								<div class="progress progress-striped active"><div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"><span class="progress-label"></span>80%</div></div>
						   </div>
							<div class="columns">
								<h3>1/2 Columns</h3>
								<div class="row">
								<div class="col-sm-6 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam</p>
								</div>
								<div class="col-sm-6 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam</p>
								</div>
								</div>
								<h3 class="sc-title normal">1/3 Columns</h3>
								<div class="row">
								<div class="col-sm-4 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
								<div class="col-sm-4 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
								<div class="col-sm-4 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
								</div>
								<h3 class="sc-title normal">2/3 Columns &amp; 1/3 Columns</h3>
								<div class="row">
								<div class="col-sm-8 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
								<div class="col-sm-4 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt.</p>
								</div>
								</div>
								<h3 class="sc-title normal">1/4 Columns</h3>
								<div class="row">
								<div class="col-sm-3 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae&nbsp;</p>
								</div>
								<div class="col-sm-3 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae&nbsp;</p>
								</div>
								<div class="col-sm-3 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae&nbsp;</p>
								</div>
								<div class="col-sm-3 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae&nbsp;</p>
								</div>
								</div>
								<h3 class="sc-title normal">3/4 Columns &amp; 1/4 Columns</h3>
								<div class="row">
								<div class="col-sm-9 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
								<div class="col-sm-3 column_grid">
								<p>Sed ut perspiciatis unde omnis voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								</div>
								<h3 class="sc-title normal">1/6 Columns</h3>
								<div class="row">
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								<div class="col-sm-2 column_grid">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo.</p>
								</div>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
			<!--- //shortcodes ---->
		</section>
		<!-- //shortcodes-section -->
		<!-- book an appointment -->
		<div class="appointment">
			<div class="container">
				<div class="col-md-9 appointment-left">
					<h3>FREE APPOINTMENT BOOKING</h3>
					<p>Lorem Ipsum is simply dummy printing and typesetting industry. when an unknown printer took a galley of type and scrambled.</p>
				</div>
				<div class="col-md-3 appointment-right">
					<a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal_1">book your appointment</a>
					<div class="modal fade" id="applyModal_1" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog dialog_3">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        	<h4 class="modal-title" id="myModalLabel"><div class="head_4">
			                         <h3>Make An appointment Now</h3>
									 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro similique ipsa deleniti doloribus fuga dicta id voluptate, excepturi nostrum cupiditate</p>
			                        </div></h4>
					      	</div>
							<div class="modal-body">
								<form name="row" method="post" class="register">
                                    <input type="text" name="name" id="name" placeholder="Name" required="">
                                    <input type="text" name="email id" id="Email id" placeholder="Email id" required="">
                                    <input type="text" name="mobile number" id="Mobile Number" placeholder="Mobile Number" required="">
									<input class="date" id="datepicker" type="text" value="Appointment date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Appointment date';}" required=>
									<textarea type="text" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Message...';}" required="">Enter Message...</textarea>
									<input type="submit" onclick="myFunction()" value="Submit Now">
								</form>
							</div>
							<!---start-date-piker---->
								<link rel="stylesheet" href="css/jquery-ui.css" />
								<script src="js/jquery-ui.js"></script>
									<script>
										$(function() {
										$( "#datepicker" ).datepicker();
										});
									</script>
							<!---/End-date-piker---->
                     </div>
		         </div>
		     </div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //book an appointment -->
		
		<!-- news letter -->
		<div class="subscribe text-center">
			<div class="container">
				<h3>Subscribe to Our Newsletter</h3>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature.</p>
				<form>
					<input placeholder="Email Address" class="user" type="text" required="">
					<input type="submit" value="Subscribe">
				</form>
				<p class="spam">We never share your information or use it to spam you</p>
			</div>
		</div>
		<!-- //news letter -->
		
		<!-- footer -->
		<footer>
			<div class="footer-grids">
				<div class="container">
					<div class="col-md-3 footer one">
						<h3>About Company</h3>
						<p> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of Latin at Hampden-Sydney College in Virginia from a Lorem Ipsum passage, undoubtable source.</p>
						<p class="adam">- Patrick Victoria, CEO</p>
						<div class="clear"></div>
					</div>
					<div class="col-md-3 footer one tweet">
						<h3>Tweets</h3>
						<ul>
							<li>
								<a href="#">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accus.
								<i>http//example.com</i></a>
								<span>About 15 minutes ago<span>
							</span></span></li>
							<li>
								<a href="#"> Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit. 
								<i>http//example.com</i></a>
								<span>About a day ago<span>
							</span></span></li>
						</ul>
					</div>
					<div class="col-md-3 footer two">
						<h3>Keep Connected</h3>
						<ul>
							<li><a class="fb" href="#"><i class="fa fa-facebook"></i>Like us on Facebook</a></li>
							<li><a class="fb1" href="#"><i class="fa fa-twitter"></i>Follow us on Twitter</a></li>
							<li><a class="fb2" href="#"><i class="fa fa-google-plus"></i>Add us on Google Plus</a></li>
							<li><a class="fb3" href="#"><i class="fa fa-dribbble"></i>Follow us on Dribbble</a></li>
							<li><a class="fb4" href="#"><i class="fa fa-pinterest-p"></i>Follow us on Pinterest</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer three">
						<h3>Contact Information</h3>
						<ul>
							<li><i class="fa fa-map-marker"></i><p>The company name <span>Lorem ipsum dolor,</span>Glasglow Dr 40 Fe 72. </p><div class="clearfix"></div> </li>
							<li><i class="fa fa-phone"></i><p>1234567890</p> <div class="clearfix"></div> </li>
							<li><i class="fa fa-envelope-o"></i><a href="mailto:info@example.com">contact@example.com</a> <div class="clearfix"></div></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- maps -->
			<div id="map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d2482.432383990807!2d0.028213999961443994!3d51.52362882484525!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1423469959819" frameborder="0" style="border:0"></iframe>
			</div>
			<div class="copy-right-grids">
				<div class="container">
					<div class="copy-left">
							<p class="footer-gd">© 2016 Prevention. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>
					</div>
					<div class="footer-links">
						<ul>
							<li><a href="sitemap.html">Sitemap</a></li>
							<li><a href="privacy_policy.html">Privacy Policy</a></li>
							<li><a href="terms.html">Terms of Use</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</footer>
		<!-- //footer -->
		<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>