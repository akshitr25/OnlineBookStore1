<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<!DOCTYPE html>
<html>
    <head>
        <%  try{
            if(session.getAttribute("user")==null) //USE WITH CARE, changing variable name will lead to total confusion
                response.sendRedirect("login.jsp");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Info</title>
    </head>
    <body>
        <h1>Book Information</h1>
        <%
            String bookid_var=session.getAttribute("bookid").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from books where bookid=?");
                ps.setString(1,bookid_var);
                ResultSet rs=ps.executeQuery();
                rs.next();
                    String bookid=rs.getString(1);
                    String bookname=rs.getString(2);
                    String author=rs.getString(3);
                    String desc=rs.getString(4);
                    int price=rs.getInt(5);
                    int disc=rs.getInt(6);
                    String genre=rs.getString(7);  
                    double savings=price*disc/100;
                    double final_price=price-savings;
                    session.setAttribute("finalprice",final_price);//for cart
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
        <b>Book ID:</b> <%=bookid%><br><br>
        <b>Book Name:</b> <%=bookname%><br><br>
        <b>Author:</b> <%=author%><br><br>
        <b>Special Discount: </b><%=disc%>%<br><br>
        <b>Description:</b> <%=desc%><br><br>
        <b>Price:</b> ₹<strike><%=price%></strike>&nbsp<b><%=final_price%></b><br><br>
        <b>You save: ₹<%=savings%></b><br><br>
        <b>Genre: </b><%=genre%>
        <form action="addToCart" method="post">
            <button name="bookid" value=<%=bookid%>>Add to Cart</button>
            <b>Quantity</b><input type="number" min="1" max="10" name="quantity" class="text" required/>
        </form>
        <%} catch(Exception e)
            {}
        %>
        
    </body>
</html>
