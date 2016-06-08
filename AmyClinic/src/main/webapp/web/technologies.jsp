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
<title>Prevention a Medical Category Flat Bootstrap Responsive Website Template | Technologies :: w3layouts</title>
<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/gallery.css" rel="stylesheet" type="text/css" media="all" /> <!-- gallery css -->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Prevention Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
				<li class="dropdown current_page">
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
				<li class="dropdown">
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
		<!-- technologies-section -->
		<section class="laboratory">
			<div class="inner-banner demo-2 text-center">
				<header class="logo">
					<h1><a class="cd-logo link link--takiri" href="index.html">Prevention <span>is better than cure.</span></a></h1>
				</header>
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Technologies</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- technologies ---->
			<div class="technologies">
				<div class="container">
					<h3 class="last-updated">Technologies</h3>
						<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
						<p>There are many variations of passages of Lorem Ipsum available, but look even slightly believable. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>					
					<div class="tech-accordian">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
							  <h4 class="panel-title asd">
								<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse1">assumenda est cliche reprehenderit</label>
								</a>
							  </h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							  <div class="panel-body panel_text">
								<div id="style-2">
									Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus 
									terry richardson ad squid. 3 wolf moon officia aute, non cupidatat 
									skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
									Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis 
									suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis 
									autem vel eum iure reprehenderit qui in ea voluptate velit esse quam 
									nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo 
									voluptas nulla pariatur
									Quis 
									autem vel eum iure reprehenderit qui in ea voluptate velit esse quam 
									nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo 
									voluptas nulla pariatur
								</div>
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingTwo">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse2">Itaque earum rerum</label>
								</a>
							  </h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingThree">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse3">autem accusamus terry richa quibusdam</label>
								</a>
							  </h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFour">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse2">Itaque earum rerum</label>
								</a>
							  </h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingFive">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse3">autem accusamus terry richa quibusdam</label>
								</a>
							  </h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingSix">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse2">Itaque earum rerum</label>
								</a>
							  </h4>
							</div>
							<div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingSeven">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse3">autem accusamus terry richa quibusdam</label>
								</a>
							  </h4>
							</div>
							<div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingEight">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse2">Itaque earum rerum</label>
								</a>
							  </h4>
							</div>
							<div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingNine">
							  <h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
								  <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i><label class="horse3">autem accusamus terry richa quibusdam</label>
								</a>
							  </h4>
							</div>
							<div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNine">
							   <div class="panel-body panel_text">
								Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
							  </div>
							</div>
						  </div>
						</div>
					</div>
				</div>
			</div>
			<!--- /technologies ---->
		</section>
		<!-- //technologies-section -->
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