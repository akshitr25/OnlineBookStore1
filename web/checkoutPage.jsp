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
        <p>Name: <%=name_var%></p>
        <p>Contact no.: <%=phoneno_var%></p>
        <p>Address: <%=address_var%></p>
        <p>Book ID: <%=bookid_var%></p>
        <p>Book Name: <%=bookname_var%></p>
        <p>Price: ₹<%=price_var%></p>
        <p>Discount: <%=disc_var%>%</p>
        <p>Final Amount: ₹<%=finalprice_var%></p>
        <form action="checkout" method="post">
            <input type="submit" value="Checkout" class="button"/>
        </form>
    </body>
</html>
