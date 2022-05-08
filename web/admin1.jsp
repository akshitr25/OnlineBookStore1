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
                if(session.getAttribute("admin")!=null) //cannot login if already logged in
                    response.sendRedirect("adminHome1.jsp");
            %>
		<meta charset="utf-8">
		<title>Admin Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"/>		
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
    function redirectToRegister(elem)
            {
                elem.setAttribute("action","register.jsp");
                elem.submit();
            }  
    </script>  
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires","0"); //Proxies
    %>
<!--		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-shirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="recommendPage.jsp">View Recommendations</a></li>
							<li><a href="cartPage.jsp">Your Cart</a></li>
							<li><a href="checkoutPage.jsp">Checkout</a></li>		
						</ul>
					</div>
				</div>
			</div>
		</div>-->
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="admin1.jsp" class="logo pull-left"><img src="themes/images//logo.png" class="site_logo" alt=""></a>
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
				<h4><span>Admin Login</span></h4>
			</section>			
			<section class="main-content">				
				<div class="row">
					<div class="span5">					
						<h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
						<form action="adminLogin" method="post">
							<input type="hidden" name="next" value="/">
							<fieldset>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" name="user" placeholder="Enter your username" id="username" class="input-xlarge" required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password</label>
									<div class="controls">
										<input type="password" name="pass" placeholder="Enter your password" id="password" class="input-xlarge" required>
									</div>
								</div>
								

								<div class="control-group">
									<input tabindex="3" class="btn btn-inverse large" type="submit" value="Sign into your account">
									<hr>
									<!-- <p class="reset">Recover your <a tabindex="4" href="#" title="Recover your username or password">username or password</a></p> -->
								</div>
                                                            
							</fieldset>
						</form>				
					</div>
					<!-- <div class="span7">					
						<h4 class="title"><span class="text"><strong>Register</strong> Form</span></h4>
						<form action="#" method="post" class="form-stacked">
							<fieldset>
								<div class="control-group">
									<label class="control-label">Username</label>
									<div class="controls">
										<input type="text" placeholder="Enter your username" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Email address:</label>
									<div class="controls">
										<input type="password" placeholder="Enter your email" class="input-xlarge">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password:</label>
									<div class="controls">
										<input type="password" placeholder="Enter your password" class="input-xlarge">
									</div>
								</div>							                            
								<div class="control-group">
									<p>Now that we know who you are. I'm not a mistake! In a comic, you know how you can tell who the arch-villain's going to be?</p>
								</div>
								<hr>
								<div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Create your account"></div>
							</fieldset>
						</form>					
					</div> -->				
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav"> 
							<li><a href="./about.html">About Us</a></li>							
						</ul>					
					</div>
<!--					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="./RecommendProduct.html">View Recommendations</a></li>
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