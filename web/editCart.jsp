<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Cart</title>
    </head>
    <body>
        <%
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login.jsp");
        %>
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
            function redirectToCart(elem)
            {
                elem.setAttribute("action","cartPage.jsp");
                elem.submit();
            }
        </script>
        <%
            
        %>
        <h1>Edit Your Cart</h1>
        <form onsubmit="redirectToCart(this)">
            <button id="viewCartButton" style="float: left;">View Cart</button>
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
        <table id="editCartTable">
            <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Price</th>
                    <th>Discount</th>
                    <th>Quantity</th>
                    <th>Final Price</th>
                    <th>Remove</th>
            </tr>
            <%
                String uname_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select books.bookid,books.bookname,books.price,books.discount,cart.quantity from cart,books where cart.username=? and books.bookid=cart.bookid;");
            ps.setString(1,uname_var);
            ResultSet rs=ps.executeQuery();
            rs.next();
            int bookid_var=rs.getInt(1);
            String bookname_var=rs.getString(2);
            int price_var=rs.getInt(3);
            int disc_var=rs.getInt(4);
            int quantity_var=rs.getInt(5);
            double finalprice_var=(price_var*quantity_var)*(100-disc_var)/100;
            session.setAttribute("finalprice",finalprice_var); //trial
            %>
            <tr>
                   <td align="center"><%=bookid_var%></td>
                   <td><%=bookname_var%></td>
                   <td align="center">₹<%=price_var%></td>
                   <td align="center"><%=disc_var%>%</td>
                   <td align="center"><%=quantity_var%></td>
                   <td align="center">₹<%=finalprice_var%></td>
                   <td><a href="deleteFromCart?bookid=<%=bookid_var%>"><center>&#10060</center></a></td>
                   <td><form action="updateQuantity" method="post">
            <b>Quantity</b><input name="quantity" type="number" min="1" max="10" class="text" required/>
            <button name="bookid" value=<%=bookid_var%>>Save Quantity</button>
                       </form></td>
            </tr>
        </table>
        <%
            }catch(Exception ex)
            {}
        %>
    </body>
</html>
