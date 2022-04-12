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
<title>Please Register</title>
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
    function redirectToLogin(elem)
            {
                elem.setAttribute("action","login.jsp");
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
        <form action="registerCheck" method="post">
            <pre>
            <b>Username </b> <input type="text" name="user" class="text" placeholder="Enter username"/>
            <b>Name     </b> <input type="text" name="name" class="text" placeholder="Enter name"/>
            <b>Phone no.</b> <input type="text" name="phoneno" class="text" placeholder="Enter phone no."/>
            <b>E-mail   </b> <input type="text" name="email" class="text" placeholder="Enter email"/>
            <b>Address  </b> <input type="text" name="address" class="text" placeholder="Enter address"/>
            <b>Password </b> <input type="password" name="pass" class="text" placeholder="Enter password"/>
            <input type="submit" value="Register" class="button"/>
            </pre>
         </form>
        <form id="redirectToRegister" method="post" name="register" onsubmit="redirectToLogin(this);">
        Existing User?<input type="submit" id="loginbutton" value="Login Here"/>
    </form>
    </div>
</body>
</html>
