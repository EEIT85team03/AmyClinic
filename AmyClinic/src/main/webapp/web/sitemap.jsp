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
<title>Amy | Sitemap</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- sitemap-section -->
		<section class="sitemap-section">
			<div class="inner-banner demo-2 text-center">
				<header class="logo">
					<h1><a class="cd-logo link link--takiri" href="index.html">Prevention <span>is better than cure.</span></a></h1>
				</header>
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Sitemap</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- sitemap ---->
			<div class="sitemap">
				<div class="container">
					<h3 class="last-updated">Sitemap</h3>
					<div class="col-md-4 sitemap-grid">
						<h4>Lab</h4>
						<ul>
							<li><span>&#62;</span><a href="laboratory.html">About Lab</a></li>
							<li><span>&#62;</span><a href="quality.html">Quality</a></li>
							<li><span>&#62;</span><a href="technologies.html">Technologies</a></li>
							<li><span>&#62;</span><a href="instruments.html">Instruments</a>
							 <ul class="sub-child">
								<li><a href="single-instrument.html">Single-instrument</a></li>
							 </ul>
							</li>
						</ul>
						<h4>Book Test</h4>
						<ul>
							<li><span>&#62;</span><a href="book-a-test.html">Book a Test</a></li>
							<li><span>&#62;</span><a href="test-list.html">Test Menu</a>
							<ul class="sub-child">
								<li><a href="test-desc.html">Test-desc</a></li>
							 </ul>
							</li>
						</ul>
					</div>
					<div class="col-md-4 sitemap-grid">
						<h4>Opportunity</h4>
						<ul>
							<li><span>&#62;</span><a href="career.html">Careers</a>
							<ul class="sub-child">
								<li><a href="jobs_single.html">Jobs-single</a></li>
							 </ul>
							</li>
							<li><span>&#62;</span><a href="404.html">Franchisee</a></li>
						</ul>
						<h4>Pages</h4>
						<ul>
							<li><span>&#62;</span><a href="news.html">News</a></li>
							<li><span>&#62;</span><a href="faq.html">Faq</a></li>
							<li><span>&#62;</span><a href="mobile-app.html">App</a></li>
							<li><span>&#62;</span><a href="terms.html">Terms of Use</a></li>
							<li><span>&#62;</span><a href="shortcodes.html">Shortcodes</a></li>
							<li><span>&#62;</span><a href="privacy_policy.html">Privacy Policy</a></li>
						</ul>
					</div>
					<div class="col-md-4 sitemap-grid">
						<h4>Blog</h4>
						<ul>
							<li><span>&#62;</span><a href="blog.html">Blog-post</a></li>
							<li><span>&#62;</span><a href="single.html">Single-post</a></li>
						</ul>
						<h4>Remaining</h4>
						<ul>
							<li><span>&#62;</span><a href="index.html">Home</a></li>
							<li><span>&#62;</span><a href="about.html">About</a></li>
							<li><span>&#62;</span><a href="contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--- /sitemap ---->
		</section>
		<!-- //sitemap-section -->
		
		<!-- footer -->
		<jsp:include page="fragment/footer.jsp" />
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