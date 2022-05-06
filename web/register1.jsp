<!DOCTYPE html>
<html lang="en">
	<head>
            <%@page import="java.sql.Statement"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="onlinebookstore.MyDb"%>
            <%
                MyDb db=new MyDb();
                Connection con=db.getCon();
            %>
		<meta charset="utf-8">
		<title>Please Register</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>	
        <script>
        function redirectToLogin(elem)
                {
                    elem.setAttribute("action","login1.jsp");
                    elem.submit();
                }  
        </script>  
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
        %>
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
<!--							<li><a href="recommendPage.jsp">View Recommendations</a></li>
							<li><a href="cartPage.jsp">Your Cart</a></li>
							<li><a href="checkoutPage.jsp">Checkout</a></li>					-->
							<li><a href="login1.jsp">Login</a></li>		
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.html" class="logo pull-left"><img src="themes/images//logo.png" class="site_logo" alt=""></a>
					<!-- <nav id="menu" class="pull-right">
						<ul>
							<li><a href="./products.html">Woman</a>					
								<ul>
									<li><a href="./products.html">Lacinia nibh</a></li>									
									<li><a href="./products.html">Eget molestie</a></li>
									<li><a href="./products.html">Varius purus</a></li>									
								</ul>
							</li>															
							<li><a href="./products.html">Man</a></li>			
							<li><a href="./products.html">Sport</a>
								<ul>									
									<li><a href="./products.html">Gifts and Tech</a></li>
									<li><a href="./products.html">Ties and Hats</a></li>
									<li><a href="./products.html">Cold Weather</a></li>
								</ul>
							</li>							
							<li><a href="./products.html">Hangbag</a></li>
							<li><a href="./products.html">Best Seller</a></li>
							<li><a href="./products.html">Top Seller</a></li>
						</ul>
					</nav> -->
				</div>
			</section>			
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Register</span></h4>
			</section>			
			<section class="main-content">				
				<div class="row">
					
					<div class="span7">					
						<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
						<form action="registerCheck" method="post" class="form-stacked">
							<fieldset>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" name="user" placeholder="Enter your username" class="input-xlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Name</label>
									<div class="controls">
										<input type="text" name="name" placeholder="Enter your name" class="input-xlarge" required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Phone no.</label>
									<div class="controls">
										<input type="text" name="phoneno" placeholder="Enter your phone no." class="input-xlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Email address</label>
									<div class="controls">
										<input type="text" name="email" placeholder="Enter your email" class="input-xlarge" required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Address</label>
									<div class="controls">
										<input type="text" name="address" placeholder="Enter your address" class="input-xlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Password</label>
									<div class="controls">
										<input type="password" name="pass" placeholder="Enter your password" class="input-xlarge" required>
									</div>
								</div>		
                                                                <div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account"></div>
								<br>
                                                                <div class="control-group">
									<p>Already have an account? <a href="login1.jsp">Login</a></p>

								</div>
								
								
							</fieldset>
						</form>					
					</div>				
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
                                                        <li><a href="login1.jsp">Login</a></li>	
<!--							<li><a href="userHome1.jsp">Home Page</a></li>  -->
							<li><a href="./about.html">About Us</a></li>
							<li><a href="./contact.html">Contact Us</a></li>
													
						</ul>					
					</div>
<!--					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="recommendPage.jsp">View Recommendations</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>-->
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>Bookstore is a user friendly platform to avail offers and redeem discounts on a wide range of books with variety of quality content</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
				})
			});
		</script>		
    </body>
</html>
