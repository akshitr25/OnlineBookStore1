<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="onlinebookstore.MyDb"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
    </head>
    <body>
        <script>
            function redirectToCart(elem)
            {
                elem.setAttribute("action","cartPage.jsp");
                elem.submit();
            }  
        </script>
        <% 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0
            response.setHeader("Expires","0"); //Proxies
            if(session.getAttribute("user")==null) //USE WITH CARE, changing variable name will lead to total confusion
                response.sendRedirect("login.jsp");
            MyDb db=new MyDb();
            Connection con=db.getCon();
            session.setAttribute("genre",null);
        %>
        
        <h1>User Home</h1>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <p>Hello: ${name}</p>
        <form id="redirectToCart" method="post" name="gotocart" onsubmit="redirectToCart(this);">
            <button>View Cart</button>
    </form>
        <h1>Select a Genre</h1>
        <form action="redirectToGenre" method="post">
            <pre>
            <button name="genre" type="submit" value="Wrestling">Wrestling</button>
            <button name="genre" type="submit" value="Fantasy Fiction">Fantasy Fiction</button>
            <button name="genre" type="submit" value="Self-Help">Self-Help</button>
            </pre>
        </form>
    </body>
</html>
