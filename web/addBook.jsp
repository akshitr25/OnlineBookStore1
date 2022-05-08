<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<!DOCTYPE html>
<html lang="en">
    <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("admin")==null)
                response.sendRedirect("admin1.jsp");
        %>
	<head>
		<meta charset="utf-8">
		<title>Add Books</title>
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
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
<!--					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>-->
                                    <div class="account pull-left">
						<ul class="user-menu">				
							<li><a href="aboutUs.html">About Us</a></li>		
						</ul>
                                    </div>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
<!--							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="cartPage1.jsp">Your Cart</a></li>-->
							<li><a href="adminHome1.jsp">Home</a></li>					
							<li><a href="adminLogout">Logout</a></li>			
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="adminHome1.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
<!--						<ul>
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
						</ul>-->
					</nav>
				</div>
			</section>							
			
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Add Books</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">				
					<div class="span5">
<!--						<div>
							<h5>ADDITIONAL INFORMATION</h5>
							<p><strong>Phone:</strong>&nbsp;(123) 456-7890<br>
							<strong>Fax:</strong>&nbsp;+04 (123) 456-7890<br>
							<strong>Email:</strong>&nbsp;<a href="#">hmabookstore2022@gmail.com</a>								
							</p>
							<br/>
							<h5>SECONDARY OFFICE</h5>
							<p><strong>Phone:</strong>&nbsp;(113) 023-1125<br>
							<strong>Fax:</strong>&nbsp;+04 (113) 023-1145<br>
							<strong>Email:</strong>&nbsp;<a href="#">vietcuong_it@yahoo.com</a>					
							</p>
						</div>-->
					</div>
					<section class="main-content">				
				<div class="row">
					
					<div class="span7">					
						<h4 class="title"><span class="text"><strong>New</strong> Book</span></h4>
						<form action="addBook" method="post" class="form-stacked">
							<fieldset>
								<div class="control-group">
									<label class="control-label">Book Name</label>
									<div class="controls">
										<input type="text" name="bookname" placeholder="Enter book name" class="input-xlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Author</label>
									<div class="controls">
										<input type="text" name="author" placeholder="Enter author name" class="input-xlarge" required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Description</label>
									<div class="controls">
										<input type="text" name="description" placeholder="Enter description" class="input-xxlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Price</label>
									<div class="controls">
										<input type="number" name="price" placeholder="Enter price" class="input-xlarge" required>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Discount</label>
									<div class="controls">
										<input type="number" name="discount" placeholder="Enter discount" class="input-xlarge" required>
									</div>
                                                                </div>
								<div class="control-group">
									<label class="control-label">Genre</label>
									<div class="controls">
										<input type="text" name="genre" placeholder="Enter genre" class="input-xlarge" required>
									</div>
								</div>	
                                                                <div class="control-group">
									<label class="control-label">Book Cover</label>
									<div class="controls">
										<input type="file" name="image" class="input-xlarge" required>
									</div>
								</div>	
                                                                <div class="actions"><input tabindex="9" class="btn btn-inverse large" type="submit" value="Insert new book"></div>
								<br>
							</fieldset>
						</form>					
					</div>				
				</div>
			</section>					
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="adminHome1.jsp">Home Page</a></li>  
                                                        <li><a href="newsletter1.jsp">Send Newsletter</a></li>
							<li><a href="editBook.jsp">Edit a book</a></li>
                                                        <li><a href="./about.html">About Us</a></li>
							<li><a href="adminLogout">Logout</a></li>							
						</ul>					
					</div>
<!--					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="viewOrders.jsp">Order History</a></li>
							<li><a href="wishlistPage1.jsp">Wish List</a></li>
							<li><a href="newsletter1">Newsletter</a></li>
						</ul>
					</div>-->
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>Bookstore is a user friendly platform to avail offers and redeem discounts on a wide range of books with variety of quality content</p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="https://www.facebook.com/Mediuniv/">Facebook</a>
							<a class="twitter" href="https://twitter.com/caps_medi">Twitter</a>
<!--							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>-->
						</span>
					</div>					
				</div>	
			</section>
		</div>
		<script src="themes/js/common.js"></script>		
    </body>
</html>