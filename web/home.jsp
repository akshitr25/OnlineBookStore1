<%@include file="header.jsp"%>
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
<title>Online Book Store</title>
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
        button
        {
            font-size: 30px;
            font-weight: bold;
            color: white;
            background-color: maroon;
        }
        #loginbutton
        {
            
        }
    </style>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0
        response.setHeader("Expires","0"); //Proxies
    %>
    <div id="left">
        
    </div>
    <div id="right">
        <h1 id="rightheading">Login or Register</h1>
        <form action="login">
            <h1>Existing User? </h1><button id="loginbutton">Login</button>
        </form>
        <form action="register">
            <h1>New User?</h1><button id="registerbutton">Register</button>
        </form>
    </div>
</body>
</html>
