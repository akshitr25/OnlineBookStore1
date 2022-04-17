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
        <title>Your Wishlist</title>
    </head>
    <body>
        <script>
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
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login.jsp");
        %>
        <h1>Your Wishlist</h1>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form><br><br>
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form>
        <form id="redirectToCart" method="post" name="gotocart" onsubmit="redirectToCart(this);">
            <button>View Cart</button>
        </form>
        <table id="cartlist">
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Remove</th>
                    </tr>
        <%  String username_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select bookid,bookname from wishlist where username=?;");
            ps1.setString(1,username_var);
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next())
            {
                int bookid_var=rs1.getInt(1);
                String bookname_var=rs1.getString(2);
        %>
        <tr>
                   <td align="center"><%=bookid_var%></td>
                   <td><a href="redirectToBook?bookid=<%=bookid_var%>"><%=bookname_var%></a></td>
                   <td><a href="deleteFromWishlist?bookid=<%=bookid_var%>" style="text-decoration: none;"><center>&#10060</center></a></td>
        </tr>
        <%
            }
            }catch(Exception ex){}
        %>
        </table>
    </body>
</html>
