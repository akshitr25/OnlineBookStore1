<!DOCTYPE html>
<html lang="en">
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="onlinebookstore.MyDb"%>
	<head>
		<meta charset="utf-8">
		<title>Your Cart</title>
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
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="recommendPage.jsp">View Recommendations</a></li>
							<li><a href="cart.html">Your Cart</a></li>
							<li><a href="checkout.html">Checkout</a></li>					
							<li><a href="userLogout">Logout</a></li>			
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.html" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
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
				<h4><span>Shopping Cart</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">
					<div class="span9">					
						<h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Image</th>
									<th>Book Name</th>
                                                                        <th>Unit Price</th>
									<th>Quantity</th>
									<th>Total</th>
                                                                        <th>Remove</th>
								</tr>
							</thead>
							<tbody>
        <%  String username_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select * from cart where username=?");
            ps1.setString(1,username_var);
            ResultSet rs1=ps1.executeQuery();
            if(!rs1.next())
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please add a book to your cart.');");
                out.println("location='userHome1.jsp';");
                out.println("</script>");
            }
            String bookid_var=rs1.getString(2);
            int quantity_var=rs1.getInt(4);
            //double finalprice_var=rs1.getDouble(3)*quantity_var;
            PreparedStatement ps2=con.prepareStatement("select * from books where bookid=?");
            ps2.setString(1,bookid_var);
            ResultSet rs2=ps2.executeQuery();
            rs2.next();
            String bookname_var=rs2.getString(2);
            int price_var=rs2.getInt(5);
            int disc_var=rs2.getInt(6);
            String genre_var=rs2.getString(7);
            double finalprice_var=(price_var*quantity_var)*(100-disc_var)/100;
            String img_path=bookid_var+".jpg";
        %>
								<tr>
                                                                        <td><a href="redirectToBook?bookid=<%=bookid_var%>"><img alt="" src=<%=img_path%> width="155" height="250"></a></td>
                                                                        <td><%=bookname_var%><br><b>Discount: <%=disc_var%>%</b></td>
									<td>Rs. <%=price_var%></td>
                                                                        <td><input type="text" placeholder="1" class="input-mini"></td>
									<td>Rs. <%=finalprice_var%></td>
                                                                        <td><input type="checkbox" value="option1"></td>
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
						<p class="cart-total right">
<!--							<strong>Sub-Total</strong>:	$100.00<br>
							<strong>Eco Tax (-2.00)</strong>: $2.00<br>
							<strong>VAT (17.5%)</strong>: $17.50<br>-->
							<strong>Final Price: </strong>Rs. <%=finalprice_var%><br>
						</p>
						<hr/>
						<p class="buttons center">				
							<button class="btn" type="button">Update</button>
							<button class="btn" type="button">Continue</button>
                                                        <form id="redirectToCheckout" method="post" name="checkoutForm" onsubmit="redirectToCheckout(this);">
							<button class="btn btn-inverse" type="submit" id="checkout">Proceed to Checkout</button>
                                                        </form>
						</p>					
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">Genres</li>
                                                                <li class="active"><a href="redirectToGenre?genre=<%=genre_var%>"><%=genre_var%></a></li>
								<li><a href="redirectToGenre?genre=Fantasy Fiction">Fantasy Fiction</a></li>
                                                                <li><a href="redirectToGenre?genre=Self-Help">Self-Help</a></li>
								<li><a href="redirectToGenre?genre=Action and Adventure">Action and Adventure</a></li>
								<li><a href="redirectToGenre?genre=Classics">Classics</a></li>
								<li><a href="redirectToGenre?genre=Science Fiction">Science Fiction</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">MANUFACTURES</li>
								<li><a href="products.html">Adidas</a></li>
								<li><a href="products.html">Nike</a></li>
								<li><a href="products.html">Dunlop</a></li>
								<li><a href="products.html">Yamaha</a></li>
							</ul>
						</div>
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<a href="product_detail.html"><img alt="" src="themes/images/ladies/2.jpg"></a><br/>
													<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
													<a href="#" class="category">Suspendisse aliquet</a>
													<p class="price">$261</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<a href="product_detail.html"><img alt="" src="themes/images/ladies/4.jpg"></a><br/>
													<a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
													<a href="#" class="category">Urna nec lectus mollis</a>
													<p class="price">$134</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>						
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
							<li><a href="./contact.html">Contact Us</a></li>
							<li><a href="cartPage.jsp">Your Cart</a></li>
							<li><a href="userlogout">Logout</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="recommendPage.jsp">View Recommendations</a></li>
							<li><a href="viewOrders.jsp">Order History</a></li>
							<li><a href="wishlistPage.jsp">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
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
			<section id="copyright">
				<span>Template created using bootstrap</span>
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