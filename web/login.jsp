<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="onlinebookstore.MyDb"%>
<%
    MyDb db=new MyDb();
    Connection con=db.getCon();
%>
<title>Please Login</title>
</head>
<body>
    <style>
        #right
        {
            position: absolute;
            left: 1000px;
            width: 500px;
            height: 500px;
            border: 5px solid brown;
            padding-left: 10px;
        }
        h1
        {
            
        }
        #rightheading
        {
            text-align: center;
            color: darkslategrey;
        }
    </style>
    <script>
    function redirectToRegister(elem)
            {
                elem.setAttribute("action","register.jsp");
                elem.submit();
            }  
    </script>  
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires","0"); //Proxies
    %>
    <div id="left">
        
    </div>
    <div id="right">
        <h1 id="rightheading">Login or Register</h1>
        <form action="loginCheck" method="post">
            <pre>
            <b>Username</b> <input type="text" name="user" class="text" placeholder="Enter username" required/>
            <b>Password</b> <input type="password" name="pass" class="text" placeholder="Enter password" required/>
            <input type="submit" value="Login" class="button"/>
            </pre>
         </form>
        <form id="redirectToRegister" method="post" name="register" onsubmit="redirectToRegister(this);">
        New User?<input type="submit" id="registerbutton" value="Register Here"/>
    </form>
    </div>
</body>
</html>

