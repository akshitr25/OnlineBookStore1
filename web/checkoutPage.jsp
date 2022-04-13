<%@include file="header.jsp"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <h1>Checkout</h1>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            if(session.getAttribute("user")==null)
                response.sendRedirect("login.jsp");
            
            String uname_var=session.getAttribute("user").toString();
            String name_var=session.getAttribute("name").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select * from cart where username=?");
            ps1.setString(1,uname_var);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            int bookid_var=rs1.getInt(2);
            double finalprice_var=rs1.getDouble(3);
            int quantity_var=rs1.getInt(4);
            PreparedStatement ps2=con.prepareStatement("select bookname,price,discount from books where bookid=?");
            ps2.setInt(1,bookid_var);
            ResultSet rs2=ps2.executeQuery();
            rs2.next();
            String bookname_var=rs2.getString(1);
            int price_var=rs2.getInt(2);
            int disc_var=rs2.getInt(3);
            PreparedStatement ps3=con.prepareStatement("select phoneno,address from users where username=?");
            ps3.setString(1,uname_var);
            ResultSet rs3=ps3.executeQuery();
            rs3.next();
            String phoneno_var=rs3.getString(1);
            String address_var=rs3.getString(2);
            session.setAttribute("phoneno",phoneno_var);//trial
        %>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            }  
        </script>
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form>  
        <br><br>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <b><p>Name:</b> <%=name_var%></p>
        <b><p>Contact no.:</b> <%=phoneno_var%></p>
        <b><p>Address:</b> <%=address_var%></p>
        <b><p>Book ID:</b> <%=bookid_var%></p>
        <b><p>Book Name:</b> <%=bookname_var%></p>
        <b><p>Price:</b> ₹<%=price_var%></p>
        <b><p>Discount:</b> <%=disc_var%>%</p>
        <b><p>Final Amount:</b> ₹<%=finalprice_var%></p>
        <form action="checkout" method="post">
            <input type="submit" value="Checkout" class="button"/>
        </form>
    </body>
</html>
