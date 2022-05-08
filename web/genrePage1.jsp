<!DOCTYPE html>
<html lang="en">
	<head>
            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="onlinebookstore.MyDb"%>
		<meta charset="utf-8">
		<title>Genre Page</title>
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
        <%
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login1.jsp");
            else if(session.getAttribute("genre")==null)
                response.sendRedirect("userHome1.jsp");
        %>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            } 
        </script>
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<div class="account pull-left">
						<ul class="user-menu">				
							<li><a href="userProfile.jsp">Your Profile</a></li>		
						</ul>
					</div>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="recommendPage1.jsp">View Recommendations</a></li>
							<li><a href="cartPage1.jsp">Your Cart</a></li>
							<li><a href="checkoutPage1.jsp">Checkout</a></li>					
							<li><a href="userLogout">Logout</a></li>	 <!make it logout>		
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
				<h4><span>Genre: ${genre}</span></h4>
			</section>
			<section class="main-content">
				
				<div class="row">						
					<div class="span9">								
						<ul class="thumbnails listing-products">
						<%
            String genre_var=session.getAttribute("genre").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from books where genre=?");
                ps.setString(1,genre_var);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String bookid=rs.getString(1);
                    String bookname=rs.getString(2);
                    String author=rs.getString(3);
                    String desc=rs.getString(4);
                    int price=rs.getInt(5);
                    int disc=rs.getInt(6);
                    String genre=rs.getString(7);  
                    String img_path="images/"+bookid+".jpg";
        %>	
                    <li class="span3">
                        <div class="product-box">
                            <span class="sale_tag"></span>												
                            <a href="redirectToBook?bookid=<%=bookid%>"><img alt=<%=bookname%> src=<%=img_path%>></a><br/>
				<a href="redirectToBook?bookid=<%=bookid%>" class="title"><%=bookname%></a><br/>
				<a href="#" class="category"><%=author%></a>
				<p class="price">Rs. <%=price%></p>
			</div>
                    </li>
                                                        
                                                        
                                                        
<!--							<li class="span3">
								<div class="product-box">												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/8.jpg"></a><br/>
									<a href="product_detail.html" class="title">Praesent tempor sem</a><br/>
									<a href="#" class="category">Erat gravida</a>
									<p class="price">$28</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">
									<span class="sale_tag"></span>												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/7.jpg"></a><br/>
									<a href="product_detail.html" class="title">Wuam ultrices rutrum</a><br/>
									<a href="#" class="category">Suspendisse aliquet</a>
									<p class="price">$341</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">												
									<span class="sale_tag"></span>
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/6.jpg"></a><br/>
									<a href="product_detail.html" class="title">Praesent tempor sem sodales</a><br/>
									<a href="#" class="category">Nam imperdiet</a>
									<p class="price">$49</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">                                        												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/1.jpg"></a><br/>
									<a href="product_detail.html" class="title">Fusce id molestie massa</a><br/>
									<a href="#" class="category">Congue diam congue</a>
									<p class="price">$35</p>
								</div>
							</li>       -->
<!--							<li class="span3">
								<div class="product-box">												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/2.jpg"></a><br/>
									<a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
									<a href="#" class="category">Gravida placerat</a>
									<p class="price">$61</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/3.jpg"></a><br/>
									<a href="product_detail.html" class="title">Quam ultrices rutrum</a><br/>
									<a href="#" class="category">Orci et nisl iaculis</a>
									<p class="price">$233</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/4.jpg"></a><br/>
									<a href="product_detail.html" class="title">Tempor sem sodales</a><br/>
									<a href="#" class="category">Urna nec lectus mollis</a>
									<p class="price">$134</p>
								</div>
							</li>-->
<!--							<li class="span3">
								<div class="product-box">												
									<a href="product_detail.html"><img alt="" src="themes/images/ladies/5.jpg"></a><br/>
									<a href="product_detail.html" class="title">Luctus quam ultrices</a><br/>
									<a href="#" class="category">Suspendisse aliquet</a>
									<p class="price">$261</p>
								</div>
							</li>-->
						</ul>	
                                 <%}%>                   
						<hr>
						<div class="pagination pagination-small pagination-centered">
							<ul>
								<li><a href="#">Prev</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">Next</a></li>
							</ul>
						</div>
					</div>
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">Genres</li>
                                                                <%
                                                                    PreparedStatement ps1=con.prepareStatement("select distinct(genre) from books;");
                                                                    ResultSet rs1=ps1.executeQuery();
                                                                    while(rs1.next())
                                                                    {
                                                                        String nav_genre=rs1.getString(1);
                                                                        if(nav_genre.equals(genre_var))
                                                                        {
                                                                %>
                                                                <li class="active"><a href="redirectToGenre?genre=<%=genre_var%>"><%=genre_var%></a></li>
								<%
                                                                        }
                                                                        else
                                                                        {
                                                                %>
                                                                <li><a href="redirectToGenre?genre=<%=nav_genre%>"><%=nav_genre%></a></li>
                                                                <%
                                                                    }
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
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Randomize</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
                                                    <%
                                                        PreparedStatement ps2=con.prepareStatement("select bookid,bookname,genre,price from books order by rand() limit 2;");
                                                        ResultSet rs2=ps2.executeQuery();
                                                    %>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
                                                                <%
                                                                    rs2.next();
                                                                        int random_bookid=rs2.getInt(1);
                                                                        String random_bookname=rs2.getString(2);
                                                                        String random_genre=rs2.getString(3);
                                                                        int random_price=rs2.getInt(4);
                                                                        String random_imgpath="images/"+random_bookid+".jpg";
                                                                %>
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
                                                                                                        <a href="redirectToBook?bookid=<%=random_bookid%>"><img alt=<%=random_bookname%> src=<%=random_imgpath%>></a><br/>
													<a href="redirectToBook?bookid=<%=random_bookid%>" class="title"><%=random_bookname%></a><br/>
                                                                                                        <a href="redirectToGenre?genre=<%=random_genre%>" class="category"><%=random_genre%></a>
													<p class="price">Rs. <%=random_price%></p>
												</div>
											</li>
										</ul>
                                                                
									</div>
									<div class="item">
                                                                        <%
                                                                            rs2.next();
                                                                            random_bookid=rs2.getInt(1);
                                                                            random_bookname=rs2.getString(2);
                                                                            random_genre=rs2.getString(3);
                                                                            random_price=rs2.getInt(4);
                                                                            random_imgpath="images/"+random_bookid+".jpg";
                                                                        %>
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<a href="redirectToBook?bookid=<%=random_bookid%>"><img alt=<%=random_bookname%> src=<%=random_imgpath%>></a><br/>
													<a href="redirectToBook?bookid=<%=random_bookid%>" class="title"><%=random_bookname%></a><br/>
                                                                                                        <a href="redirectToGenre?genre=<%=random_genre%>" class="category"><%=random_genre%></a>
													<p class="price">Rs. <%=random_price%></p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="block">								
							<h4 class="title"><strong>Best</strong> Sellers</h4>								
							<ul class="small-product">
								<li>
									<a href="redirectToBook?bookid=112" title="Ikigai">
										<img src="images/112.jpg" alt="Ikigai : Japanese Art of staying Young.. While growing Old">
									</a>
									<a href="redirectToBook?bookid=112">Ikigai</a>
								</li>
								<li>
									<a href="redirectToBook?bookid=147" title="Best in the World">
										<img src="images/147.jpg" alt="Best in the World">
									</a>
									<a href="redirectToBook?bookid=147">Best in the World</a>
								</li>
								<li>
									<a href="redirectToBook?bookid=156" title="And Then There Were None">
										<img src="images/156.jpg" alt="And Then There Were None">
									</a>
									<a href="redirectToBook?bookid=156">And Then There Were None</a>
								</li>   
							</ul>
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
							<li><a href="contact1.jsp">Contact Us</a></li>
							<li><a href="cartPage1.jsp">Your Cart</a></li>
							<li><a href="userLogout">Logout</a></li>							
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
                <%
                    }catch(Exception e)
                            {}
                %>
    </body>
</html>