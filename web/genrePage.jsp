<%@include file="header.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genre Page</title>
    </head>
    <body>
        <%
            try{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("user")==null)
                response.sendRedirect("login.jsp");
        %>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            } 
        </script>
        <h1>Genre Page</h1>
        <b>Genre:</b> ${genre}
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form><br>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <form method="post">
        <table id="menu">
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Discount</th>
                    </tr>
            
        <%
            String genre_var=session.getAttribute("genre").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from books where genre=?");
                ps.setString(1,genre_var);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String bookid=rs.getString(1);
                    String bookname=rs.getString(2);
                    String author=rs.getString(3);
                    String desc=rs.getString(4);
                    int price=rs.getInt(5);
                    int disc=rs.getInt(6);
                    String genre=rs.getString(7);   
        %>
        <tr>
                   <td align="center"><%=bookid%></td>
                   <td><a href="redirectToBook?bookid=<%=bookid%>"><%=bookname%></a></td>
                   <td><%=author%></td>
                   <td><%=desc%></td>
                   <td align="center">₹<%=price%></td>
                   <td align="center"><%=disc%>%</td>
                   </tr>
        <%  }
            }catch(Exception e)
            {}
        %>
        </table> 
        </form>
    </body>
</html>
