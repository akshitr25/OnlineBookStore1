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
            String uname_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement pst=con.prepareStatement("select * from orders where username=?");
            pst.setString(1,uname_var);
            ResultSet rst=pst.executeQuery();
            if(!rst.next())
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please place orders to get recommendations.');");
                out.println("location='userHome.jsp';");
                out.println("</script>");
            }
            PreparedStatement ps0=con.prepareStatement("select orders.bookname from orders,users where users.username=orders.username and users.username=? and orders.orderid=(select max(orders.orderid)from orders where orders.username=?);");
            ps0.setString(1,uname_var);
            ps0.setString(2,uname_var);
            ResultSet rs0=ps0.executeQuery();
            rs0.next();
            String bookbought=rs0.getString(1);
        %>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            } 
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recommendations</title>
    </head>
    <body>
        <h1>Recommendations</h1>
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form>  
        <br><br>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <p>Since you last ordered <b><%=bookbought%></b>, you may like these books:</p>
        <table id="recommend">
                    <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Discount</th>
                    </tr>
        <%

            PreparedStatement ps=con.prepareStatement("select * from books where genre=(select books.genre from books,orders,users where users.username=? and books.bookid=orders.bookid and orders.orderid=(select max(orders.orderid) from orders where orders.username=?)) and bookname!=?;");
                ps.setString(1,uname_var);
                ps.setString(2,uname_var);
                ps.setString(3,bookbought);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    int bookid_var=rs.getInt(1);
                    String bookname_var=rs.getString(2);
                    String author_var=rs.getString(3);
                    int price_var=rs.getInt(5);
                    int disc_var=rs.getInt(6);
                %>
                <tr>
                   <td align="center"><%=bookid_var%></td>
                   <td><a href="redirectToBook?bookid=<%=bookid_var%>"><%=bookname_var%></a></td>
                   <td><%=author_var%></td>
                   <td align="center">₹<%=price_var%></td>
                   <td align="center"><%=disc_var%>%</td>
                </tr>
        <%  }
        %>
        </table>
        <%
            } catch(Exception e)
            {}
        %>
    </body>
</html>
<%
    /*
    select books.genre from books,orders,users where books.bookid=128 and users.username='rajatg2017' and books.bookid=orders.bookid and orders.orderid=(select max(orders.orderid) from orders);
    
    select books.genre from books,orders,users where users.username='rajatg2017' and books.bookid=orders.bookid and orders.orderid=(select max(orders.orderid) from orders);
    
    select bookname from books where genre=(select books.genre from books,orders,users where users.username='rajatg2017' and books.bookid=orders.bookid and orders.orderid=(select max(orders.orderid) from orders));
    */
%>
