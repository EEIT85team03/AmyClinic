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
				<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:300px;width:1280px;'><div id='gmap_canvas' style='height:300px;width:1280px;'></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div> <script type='text/javascript'>function init_map(){var myOptions = {zoom:18,center:new google.maps.LatLng(25.0329694,121.56541770000001),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(25.0329694,121.56541770000001)});infowindow = new google.maps.InfoWindow({content:'<strong>Amy</strong><br><br> Taipei<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>
<!-- 				<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d2482.432383990807!2d0.028213999961443994!3d51.52362882484525!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1423469959819" frameborder="0" style="border:0"></iframe> -->
<!-- 				<iframe frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJl-yledOrQjQR3zWeWtIGwO0&key=AIzaSyD55vaIxOmFmpw17fmvtnhaMYiS7dN6UHY&language=zh_tw" allowfullscreen></iframe> -->
			</div>
			<div class="copy-right-grids">
				<div class="container">
					<div class="copy-left">
							<p class="footer-gd">© 2016 Amy Clinic. All Rights Reserved | Base Template Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>
					</div>
					<div class="footer-links">
						<ul>
							<li><a href="${pageContext.request.contextPath}/web/sitemap.jsp">Sitemap</a></li>
							<li><a href="${pageContext.request.contextPath}/web/privacy_policy.jsp">Privacy Policy</a></li>
							<li><a href="${pageContext.request.contextPath}/web/terms.jsp">Terms of Use</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</footer>
		