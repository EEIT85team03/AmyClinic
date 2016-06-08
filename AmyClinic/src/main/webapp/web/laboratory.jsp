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
<title>Prevention a Medical Category Flat Bootstrap Responsive Website Template | Laboratory :: w3layouts</title>
<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
<link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
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
		<!-- laboratory-section -->
		<section class="laboratory">
			<div class="inner-banner demo-2 text-center">
				<header class="logo">
					<h1><a class="cd-logo link link--takiri" href="index.html">Prevention <span>is better than cure.</span></a></h1>
				</header>
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Laboratory</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
				<div class="cd-image-block">
					<ul class="cd-images-list">
						<li class="is-selected">
							<a href="#0">
								<h3>Laboratory One</h3>
							</a>
						</li>

						<li>
							<a href="#0">
								<h3>Laboratory Two</h3>
							</a>
						</li>

						<li>
							<a href="#0">
								<h3>Laboratory Three</h3>
							</a>
						</li>

						<li>
							<a href="#0">
								<h3>Laboratory Four</h3>
							</a>
						</li>
					</ul> <!-- .cd-images-list -->
				</div> <!-- .cd-image-block -->

				<div class="cd-content-block">
					<ul>
						<li class="is-selected">
							<div>
								<h3>Laboratory Automation</h3>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cum quisquam, libero molestiae cupiditate, omnis? Provident excepturi, nobis cupiditate, nulla dolorem dignissimos error necessitatibus, sint praesentium dolores, harum! Aliquam sequi impedit corrupti, numquam maiores ipsa commodi excepturi eligendi cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti cupiditate, voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cum quisquam, libero molestiae cupiditate, omnis? Provident excepturi, nobis cupiditate, nulla dolorem dignissimos error necessitatibus, sint praesentium dolores, harum! Aliquam sequi impedit corrupti, numquam maiores ipsa commodi excepturi eligendi cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
								
							</div> 
						</li>

						<li>
							<div>
								<h3>Barcoding and bi-directional interfacing</h3>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur nulla dolorem dignissimos error necessitatibus, sint praesentium dolores, harum! Aliquam sequi impedit corrupti, numquam maiores ipsa commodi excepturi eligendi cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti doloribus et quos dolore excepturi, rem incidunt consectetur quia accusantium placeat quae officiis in ab. Veniam sapiente aut est asperiores nihil reprehenderit incidunt cupiditate, voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cum quisquam, libero molestiae cupiditate, omnis? Provident excepturi, nobis cupiditate, nulla dolorem dignissimos error necessitatibus, sint praesentium dolores, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti doloribus et quos dolore excepturi, rem incidunt consectetur quia accusantium placeat quae officiis in ab. Veniam sapiente aut est asperiores nihil reprehenderit incidunt cupiditate, voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
	
							</div> 
						</li>

						<li>
							<div>
								<h3>Our Backend Prowess</h3>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cum quisquam, libero molestiae cupiditate, omnis? Provident excepturi, nobis cupiditate, nulla dolorem dignissimos error necessitatibus, sint praesentium dolores, harum! Aliquam sequi impedit corrupti, numquam maiores ipsa commodi excepturi eligendi cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti. </p>
								
								<p>
									Lorem ipsum dolor sit amet, Veniam sapiente aut est asperiores nihil reprehenderit incidunt cupiditate consectetur doloribus et quos dolore excepturi, rem incidunt consectetur quia accusantium placeat quae officiis in ab adipisicing elit. Quasi cum quisquam, libero molestiae cupiditate.
								</p>
					
							</div> 
						</li>

						<li>
							<div>
								<h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</h3>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi cum quisquam, sint praesentium dolores, harum! Aliquam sequi impedit corrupti, numquam maiores ipsa commodi excepturi eligendi cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti doloribus et quos dolore excepturi, rem incidunt consectetur quia accusantium placeat quae officiis in ab. Veniam sapiente aut est asperiores nihil reprehenderit incidunt cupiditate, voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing cupiditate adipisci atque sint iste aspernatur, hic sed modi at voluptatum nihil incidunt, fugiat repellendus beatae debitis, soluta blanditiis culpa! Magnam quisquam tempore exercitationem molestias cupiditate quam aut eum perferendis deleniti doloribus et quos dolore excepturi, rem incidunt consectetur quia accusantium placeat quae officiis in ab. Veniam sapiente aut est asperiores nihil reprehenderit incidunt cupiditate, voluptatibus nemo iste. Quos, ullam. Cupiditate, sed.
								</p>
							
							</div> 
						</li>
					</ul>

					<button class="cd-close">Close</button>
				</div> <!-- .cd-content-block -->

				<ul class="block-navigation">
					<li><button class="cd-prev inactive">&larr; Prev</button></li>
					<li><button class="cd-next">Next &rarr;</button></li>
				</ul> <!-- .block-navigation -->
			
		<script src="js/jquery-2.1.4.js"></script>
		<script src="js/main1.js"></script> <!-- Resource jQuery -->
		<div class="clearfix"></div>
		<div id="grid-gallery" class="grid-gallery">
			<div class="container">
			<h3 class="title text-center">Lab Tour</h3>
				<section class="grid-wrap">
					<ul class="grid">
						<li class="grid-sizer"></li><!-- for Masonry column width -->
						<li>
							<figure>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l6.jpg" alt="img06"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l7.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l8.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l9.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l10.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l11.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l13.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l6.jpg" alt="img06"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<div class="clearfix"></div>
					</ul>
				</section><!-- // grid-wrap -->
				<section class="slideshow">
					<ul>
						<li>
							<figure>
								<figcaption>
									<h3>Letterpress asymmetrical</h3>
									<p>Kale chips lomo biodiesel stumptown Godard Tumblr, mustache sriracha tattooed cray aute slow-carb placeat delectus. Letterpress asymmetrical fanny pack art party est pour-over skateboard anim quis, ullamco craft beer.</p>
								</figcaption>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Vice velit chia</h3>
									<p>Chillwave Echo Park Etsy organic Cosby sweater seitan authentic pour-over. Occupy wolf selvage bespoke tattooed, cred sustainable Odd Future hashtag butcher.</p>
								</figcaption>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Brunch semiotics</h3>
									<p>IPhone PBR polaroid before they sold out meh you probably haven't heard of them leggings tattooed tote bag, butcher paleo next level single-origin coffee photo booth.</p>
								</figcaption>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Chillwave nihil occupy</h3>
									<p>Vice cliche locavore mumblecore vegan wayfarers asymmetrical letterpress hoodie mustache. Shabby chic lomo polaroid, scenester 8-bit Portland Pitchfork VHS tote bag.</p>
								</figcaption>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Kale chips lomo biodiesel</h3>
									<p>Chambray Schlitz pug YOLO, PBR Tumblr semiotics. Flexitarian YOLO ennui Blue Bottle, forage dreamcatcher chillwave put a bird on it craft beer Etsy.</p>
								</figcaption>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Exercitation occaecat</h3>
									<p>Cosby sweater hella lomo Thundercats VHS occupy High Life. Synth pop-up readymade single-origin coffee, fanny pack tousled retro. Fingerstache mlkshk ugh hashtag, church-key ethnic street art pug yr.</p>
								</figcaption>
								<img src="images/l6.jpg" alt="img06"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Selfies viral four</h3>
									<p>Ethnic readymade pug, small batch XOXO Odd Future normcore kogi food truck craft beer single-origin coffee banh mi photo booth raw denim. XOXO messenger bag pug VHS. Forage gluten-free polaroid, twee hoodie chillwave Helvetica.</p>
								</figcaption>
								<img src="images/l7.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Photo booth skateboard</h3>
									<p>Thundercats pour-over four loko skateboard Brooklyn, Etsy sriracha leggings dreamcatcher narwhal authentic 3 wolf moon synth Portland. Shabby chic photo booth Blue Bottle keffiyeh, McSweeney's roof party Carles.</p>
								</figcaption>
								<img src="images/l8.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Ex fashion axe</h3>
									<p>Ennui Blue Bottle shabby chic, organic butcher High Life tattooed meggings jean shorts Brooklyn sartorial polaroid. Cray raw denim +1, bespoke High Life Odd Future banh mi chillwave Marfa kogi disrupt paleo direct trade 90's Godard. </p>
								</figcaption>
								<img src="images/l9.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Thundercats next level</h3>
									<p>Typewriter authentic PBR, iPhone mixtape fixie post-ironic fingerstache Pitchfork artisan. Wayfarers master cleanse occupy, Tonx lo-fi swag Truffaut irony whatever Blue Bottle readymade PBR gluten-free. Lomo Pinterest Banksy fap. Retro ennui you probably haven't heard of them iPhone, PBR fashion axe polaroid.</p>
								</figcaption>
								<img src="images/l10.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Bushwick selvage synth</h3>
									<p>Schlitz deserunt pour-over consectetur. Selfies plaid asymmetrical farm-to-table, cred gastropub photo booth narwhal non roof party velit raw denim slow-carb meggings pug. Tempor post-ironic seitan cliche bicycle rights. Meh viral Williamsburg, quinoa 8-bit kale chips YOLO Marfa accusamus.</p>
								</figcaption>
								<img src="images/l11.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Bottle wayfarers locavore</h3>
									<p>Aliqua High Life art party fixie farm-to-table. Kitsch Echo Park shabby chic, narwhal fugiat Cosby sweater asymmetrical gastropub tofu. Authentic minim Pinterest Blue Bottle beard, aliqua chia XOXO dolor freegan banh mi vegan fugiat.</p>
								</figcaption>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Letterpress asymmetrical</h3>
									<p>Pickled hoodie Pinterest 90's proident church-key chambray. Salvia incididunt slow-carb ugh skateboard velit, flannel authentic hoodie lomo fixie photo booth farm-to-table. Minim meggings Bushwick, semiotics Vice put a bird.</p>
								</figcaption>
								<img src="images/l13.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Vice velit chia</h3>
									<p>Tattooed assumenda chambray cray officia. 90's mollit ethnic church-key ex eu pop-up gentrify. Tonx raw denim eu, bitters nesciunt distillery Neutra pop-up. Drinking vinegar Helvetica Truffaut tattooed.</p>
								</figcaption>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Brunch semiotics</h3>
									<p>Gentrify High Life adipisicing, duis slow-carb kogi Tumblr raw denim freegan Echo Park. Fingerstache laboris pork belly messenger bag, you probably haven't heard of them vegan twee Intelligentsia Vice Etsy pickled put a bird on it Godard roof party. Meggings small batch dreamcatcher velit.</p>
								</figcaption>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Chillwave nihil occupy</h3>
									<p>Marfa exercitation non, beard +1 hashtag cardigan gluten-free mixtape church-key ugh eu Portland leggings. Ennui farm-to-table fingerstache keytar Echo Park tattooed. Seitan qui artisan, aliquip cupidatat sunt Portland wayfarers duis.</p>
								</figcaption>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Kale chips lomo biodiesel</h3>
									<p>Lomo church-key whatever, seitan laborum drinking vinegar lo-fi semiotics nihil meh. Skateboard irure before they sold out Banksy. Narwhal High Life lomo aliqua drinking vinegar. PBR&B placeat proident, craft beer forage DIY nostrud meh flexitarian keytar Helvetica.</p>
								</figcaption>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Exercitation occaecat</h3>
									<p>Skateboard Truffaut bicycle rights seitan normcore. Culpa lo-fi ennui, Pinterest before they sold out Echo Park roof party sapiente aesthetic consequat Truffaut freegan voluptate. Kogi banh mi vero nihil, freegan gluten-free cliche. Forage Etsy laboris anim normcore, McSweeney's ex.</p>
								</figcaption>
								<img src="images/l6.jpg" alt="img06"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Selfies viral four</h3>
									<p>Viral roof party locavore flexitarian nihil fanny pack actually Odd Future anim commodo. Sunt yr aute, enim quis plaid sartorial duis leggings lo-fi gluten-free. Tote bag flexitarian pug stumptown, Cosby sweater try-hard ethnic scenester. Mumblecore +1 hoodie accusamus skateboard slow-carb, Thundercats Godard placeat craft beer meh enim trust fund.</p>
								</figcaption>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Photo booth skateboard</h3>
									<p>Culpa pour-over cray nesciunt dreamcatcher. Meggings distillery cillum raw denim voluptate, single-origin coffee lo-fi ethical iPhone four loko nihil salvia. Biodiesel ea Intelligentsia quis deep v, American Apparel trust fund slow-carb synth semiotics quinoa Brooklyn pour-over nulla Godard.</p>
								</figcaption>
								<img src="images/l2.jpg" alt="img02"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Ex fashion axe</h3>
									<p>Bespoke irony tousled nihil flexitarian, salvia tempor nostrud Bushwick hashtag Austin ethnic disrupt. Beard Helvetica nihil, chia craft beer Wes Anderson keytar dolore. Irure incididunt flexitarian photo booth cillum, YOLO deserunt Brooklyn artisan. Brunch assumenda irony, Blue Bottle roof party DIY ullamco quis.</p>
								</figcaption>
								<img src="images/l3.jpg" alt="img03"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Thundercats next level</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
									quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea.</p>
								</figcaption>
								<img src="images/l4.jpg" alt="img04"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Bushwick selvage synth</h3>
									<p>Ethical Truffaut tofu food truck cred cornhole. Irure umami Austin cornhole blog ethical. Aliqua yr Truffaut, adipisicing hashtag Shoreditch eiusmod tempor literally vinyl.</p>
								</figcaption>
								<img src="images/l5.jpg" alt="img05"/>
							</figure>
						</li>
						<li>
							<figure>
								<figcaption>
									<h3>Bottle wayfarers locavore</h3>
									<p>Pork belly irony Shoreditch fashion axe DIY. Portland banjo irony, squid gentrify Austin fixie church-key magna. Marfa artisan Echo Park, McSweeney's banjo sunt keytar tofu. Brooklyn PBR single-origin coffee disrupt polaroid ut, gluten-free XOXO plaid magna.</p>
								</figcaption>
								<img src="images/l12.jpg" alt="img01"/>
							</figure>
						</li>
					</ul>
					<nav>
						<span class="icon nav-prev"></span>
						<span class="icon nav-next"></span>
						<span class="icon nav-close"></span>
					</nav>
					<div class="info-keys icon">Navigate with arrow keys</div>
				</section><!-- // slideshow -->
			</div>
			</div><!-- // grid-gallery -->
		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/cbpGridGallery.js"></script>
		<script>
			new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
		</script>
		</section>
		<!-- //laboratory-section -->
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