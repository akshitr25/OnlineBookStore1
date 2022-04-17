<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
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
        <title>Your Orders</title>
    </head>
    <body>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
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
            MyDb db=new MyDb();
            Connection con=db.getCon();
            String uname_var=session.getAttribute("user").toString();
                PreparedStatement pst=con.prepareStatement("select * from orders where username=?;");
                pst.setString(1,uname_var);
                ResultSet rst=pst.executeQuery();
                if(!rst.next())
                {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('You have not placed any orders yet.');");
                    out.println("location='userHome.jsp';");
                    out.println("</script>");
                }
            PreparedStatement ps0=con.prepareStatement("select count(*) from orders;");
            ResultSet rs0=ps0.executeQuery();
            rs0.next();
            int count=rs0.getInt(1);
        %>
        <h1>Your Orders</h1>
        <form onsubmit="backToHome(this)">
            <button id="backtohome" style="float: right;">Back To Home</button>
        </form><br><br>
        <form action="userLogout">
        <button id="logoutbutton" style="float: right;"><b>Logout</b></button>
        </form>
        <table id="orders">
            <tr>
            <th>Order ID</th>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Quantity</th>
            <th>Final Price</th>
            <th>Date</th> 
            <th>Time</th>
            </tr>   
            <%
            //uname_var=session.getAttribute("user").toString();
            //MyDb db=new MyDb();
            //Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("select * from orders where username=?");
            ps.setString(1,uname_var);
            ResultSet rs=ps.executeQuery();
            //rs.next();
            while(rs.next())
            {
                int orderid_var=rs.getInt(1);
                int bookid_var=rs.getInt(3);
                String bookname_var=rs.getString(4);
                int quantity_var=rs.getInt(7);
                double finalprice_var=rs.getDouble(8);
                Date date_var=rs.getDate(10);
                Time time_var=rs.getTime(10);
        %>
        <tr>
                   <td align="center"><%=orderid_var%></td>
                   <td align="center"><%=bookid_var%></td>
                   <td><a href="redirectToBook?bookid=<%=bookid_var%>"><%=bookname_var%></a></td>
                   <td align="center"><%=quantity_var%></td>
                   <td align="center">₹<%=finalprice_var%></td>
                   <td align="center"><%=date_var%></td>
                   <td align="center"><%=time_var%></td>
                   </tr>
        <%
            }
        %>
        </table>
        <%
            }catch(Exception ex)
            {}
        %>
    </body>
</html>
