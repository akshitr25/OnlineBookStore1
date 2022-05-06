<!DOCTYPE html>
<html lang="en">
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="onlinebookstore.MyDb"%>
	<head>
		<meta charset="utf-8">
		<title>User Profile</title>
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
			<script src="themes/js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>	
        <script>
            function redirectToCheckout(elem)
            {
                elem.setAttribute("action","checkoutPage1.jsp");
                elem.submit();
            }
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome1.jsp");
                elem.submit();
            }   
            function redirectToEditCart(elem)
            {
                elem.setAttribute("action","editCart.jsp");
                elem.submit();
            }
            function redirectToWishlist(elem)
            {
                elem.setAttribute("action","wishlistPage1.jsp");
                elem.submit();
            }
        </script>
        <%
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login1.jsp");
        %>
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<div class="account pull-left">
						<ul class="user-menu">				
							<li><a href="cartPage1.jsp">Your Cart</a></li>		
						</ul>
					</div>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="wishlistPage1.jsp">Your Wishlist</a></li>
							<li><a href="checkoutPage1.jsp">Checkout</a></li>					
							<li><a href="userLogout">Logout</a></li>			
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="userHome1.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
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
				<h4><span>User Profile</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Profile</span></h4>
						<table class="table table-striped">
<!--							<thead>
								<tr>
									<th>Username</th>
									<th>Name</th>
                                                                        <th>Phone no.</th>
									<th>E-mail</th>
									<th>Address</th>
								</tr>
							</thead>-->
        <%  String uname_var=session.getAttribute("user").toString(); //1
            String name_var=session.getAttribute("name").toString(); //1
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select * from users where username=?");
            ps1.setString(1,uname_var);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            String phoneno_var=rs1.getString(3);
            String email_var=rs1.getString(4);
            String address_var=rs1.getString(5);
        %>
							<tbody>
                                                                    <tr>
                                                                        <td><b>Username</b><td>
                                                                        <td><%=uname_var%></td>
<!--                                                                        <td><input type="number" name="quantity" placeholder= class="input-mini" min="1" max="10" required><br>
                                                                            <button class="btn"  name="bookid" value=>Update</button></td> <!quantity>-->
<!--                                                                        <td><button name="bookid" value=>Update</button></td>-->
                                                                    </tr>  
                                                                    <tr>
                                                                        <td><b>Name</b><td>
                                                                        <td><%=name_var%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Phone no.</b><td>
                                                                        <td><%=phoneno_var%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>E-mail</b><td>
                                                                        <td><%=email_var%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>Address</b><td>
                                                                        <td><%=address_var%></td>
                                                                    </tr>
                </tr>			  
<!--								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="themes/images/ladies/1.jpg"></a></td>
									<td>Luctus quam ultrices rutrum</td>
									<td><input type="text" placeholder="2" class="input-mini"></td>
									<td>$1,150.00</td>
									<td>$2,450.00</td>
								</tr>-->
<!--								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="product_detail.html"><img alt="" src="themes/images/ladies/3.jpg"></a></td>
									<td>Wuam ultrices rutrum</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$1,210.00</td>
									<td>$1,123.00</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong>$3,600.00</strong></td>
								</tr>		  -->
							</tbody>
						</table>
<!--						<h4>What would you like to do next?</h4>
						<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
							Use Coupon Code
						</label>
						<label class="radio">
							<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
							Estimate Shipping &amp; Taxes
						</label>
						<hr>-->
<!--						<p class="cart-total right">
							<strong>Sub-Total</strong>:	$100.00<br>
							<strong>Eco Tax (-2.00)</strong>: $2.00<br>
							<strong>VAT (17.5%)</strong>: $17.50<br>
							<strong>Final Price: </strong>Rs.<br>
						</p>-->
<!--						<hr/>
						<p class="buttons center">				
							<button class="btn" type="button">Continue</button>
                                                        <form id="redirectToCheckout" method="post" name="checkoutForm" onsubmit="redirectToCheckout(this);">
							<button class="btn btn-inverse" type="submit" id="checkout">Proceed to Checkout</button>
                                                        </form>
						</p>					-->
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
                                                            <li class="nav-header">Genres</li>
								<%
                                                                    PreparedStatement psr=con.prepareStatement("select distinct(genre) from books;");
                                                                    ResultSet rsr=psr.executeQuery();
                                                                    while(rsr.next())
                                                                    {
                                                                        String nav_genre=rsr.getString(1);      
                                                                %>
                                                               <li><a href="redirectToGenre?genre=<%=nav_genre%>"><%=nav_genre%></a></li>
                                                                <%
                                                                    }
                                                                %>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">Authors</li>
                                                                <li><a href="redirectToBook?bookid=115">J.K. Rowling</a></li>
								<li><a href="redirectToBook?bookid=122">Chris Jericho</a></li>
								<li><a href="redirectToBook?bookid=113">Robin Sharma</a></li>
								<li><a href="redirectToBook?bookid=141">John Cena</a></li>
							</ul>
						</div>
<!--						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
                                                    <%
//                                                        PreparedStatement ps3=con.prepareStatement("select bookid,bookname,genre,price from books order by rand() limit 2;");
//                                                        ResultSet rs3=ps3.executeQuery();
                                                    %>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
                                                                <%
//                                                                        rs3.next();
//                                                                        int random_bookid=rs3.getInt(1);
//                                                                        String random_bookname=rs3.getString(2);
//                                                                        String random_genre=rs3.getString(3);
//                                                                        int random_price=rs3.getInt(4);
//                                                                        String random_imgpath="images/"+random_bookid+".jpg";
                                                                %>
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													
												</div>
											</li>
										</ul>
                                                                
									</div>
									<div class="item">
                                                                        <%
//                                                                            rs3.next();
//                                                                            random_bookid=rs3.getInt(1);
//                                                                            random_bookname=rs3.getString(2);
//                                                                            random_genre=rs3.getString(3);
//                                                                            random_price=rs3.getInt(4);
//                                                                            random_imgpath="images/"+random_bookid+".jpg";
                                                                        %>
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>						-->
					</div>
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="userHome1.jsp">Home Page</a></li>  
							<li><a href="./about.html">About Us</a></li>
							<li><a href="contact1.jsp">Contact Us</a></li>
							<li><a href="userlogout">Logout</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="viewOrders1.jsp">Order History</a></li>
							<li><a href="wishlistPage1.jsp">Wish List</a></li>
							<li><a href="newsletter1">Newsletter</a></li>
						</ul>
					</div>
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
                <%
                    }catch(Exception e)
                    {}
                %>
    </body>
</html>