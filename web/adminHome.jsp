<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body>
        <script>
            function gotoNewsletter(elem)
            {
                elem.setAttribute("action","newsletter1.jsp");
                elem.submit();
            }
        </script>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if(session.getAttribute("adminname")==null)
                response.sendRedirect("admin1.jsp");
        %>
        <h1>Admin Home</h1>
        <p>Hello, ${adminname}</p>
        <form id="gotoNewsletter" method="post" name="gotonewsletter" onsubmit="gotoNewsletter(this);">
            <button>Newsletter</button>
        </form>
        <form action="adminLogout">
            <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        
    </body>
</html>
