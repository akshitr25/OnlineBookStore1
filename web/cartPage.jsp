<%@include file="header.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>
    <body>
        <script>
            function redirectToCheckout(elem)
            {
                elem.setAttribute("action","checkoutPage.jsp");
                elem.submit();
            }
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            }   
            function redirectToEditCart(elem)
            {
                elem.setAttribute("action","editCart.jsp");
                elem.submit();
            }
            function redirectToWishlist(elem)
            {
                elem.setAttribute("action","wishlistPage.jsp");
                elem.submit();
            }
        </script>
        <%
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login.jsp");
        %>
        <h1>Your Cart</h1>
        <form id="redirectToWishlist" method="post" name="gotowishlist" onsubmit="redirectToWishlist(this);">
            <button>View Wishlist</button>
        </form>
        <form onsubmit="redirectToEditCart(this)">
            <button id="editCartButton" style="float: left;">Edit Cart</button>
        </form>  
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form>  
        <br><br>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <b>Username:</b> ${user}<br>
        <b>Name:</b> ${name}<br><br>
        <table id="cartlist">
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Amount</th>
                    <th>Discount</th>
                    <th>Quantity</th>
                    <th>Final Price</th>
                    </tr>
        <% String username_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select * from cart where username=?");
            ps1.setString(1,username_var);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
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
            double finalprice_var=(price_var*quantity_var)*(100-disc_var)/100;
        %>
        <tr>
                   <td align="center"><%=bookid_var%></td>
                   <td><%=bookname_var%></td>
                   <td align="center">₹<%=price_var%></td>
                   <td align="center"><%=disc_var%>%</td>
                   <td align="center"><%=quantity_var%></td>
                   <td align="center">₹<%=finalprice_var%></td>
                   </tr>
        </table>
        <form id="redirectToCheckout" method="post" name="checkoutForm" onsubmit="redirectToCheckout(this);">
        <input type="submit" id="checkoutbutton" value="Proceed to Checkout"/>
    </form>
        <%
            }catch(Exception ex)
            {}
        %>
        
    </body>
</html>
