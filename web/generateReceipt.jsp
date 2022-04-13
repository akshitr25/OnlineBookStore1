<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="header.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebookstore.MyDb"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bill</title>
    </head>
    <body>
        <%
            MyDb db=new MyDb();
            Connection con=db.getCon();
            int order_id=(int)request.getAttribute("orderid");
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat formatter1=new SimpleDateFormat("HH:mm:ss");
            String dateString=formatter.format(date);
            String timeString=formatter1.format(date);
            PreparedStatement pst=con.prepareStatement("select * from orders where orderid=?");
            pst.setInt(1,order_id);
            ResultSet rst=pst.executeQuery();
            rst.next();
            String uname_var=rst.getString(2);
            int bookid_var=rst.getInt(3);
            String bookname_var=rst.getString(4);
            int price_var=rst.getInt(5);
            int disc_var=rst.getInt(6);
            int quantity_var=rst.getInt(7);
            double finalprice_var=rst.getDouble(8);
            String address_var=rst.getString(9);
            
        %>
        <style>
        th
        {
            text-align: left;
        }
        table 
        {
            border-spacing: 5px;
            width: 80%;
        }
        #bill
        {
            margin: auto;
            width: 40%;
            border: 3px solid black;
            padding: 10px;
        }
        table
        {
            margin-left:auto; 
            margin-right:auto;
        }
        #info 
        {
            display: flex;
            justify-content: space-between;
        }
        #backtohome
        {
            font-weight: bold;
        }
        </style>
        <script>
            function backToHome(elem)
            {
                elem.setAttribute("action","userHome.jsp");
                elem.submit();
            }        
        </script>
        <form onsubmit="backToHome(this)">
            <button id="backtohome">Back To Home</button>
        </form>   
        <div id="bill">
        <center>
        ------------------------------------------------------------------------------------------------------------------
        <h1>Online Book Store</h1>
        <h4><%=dateString%> <%=timeString%></h4>
        ------------------------------------------------------------------------------------------------------------------
        </center>
        <b>Order ID: <%=order_id%></b><br>
        <div id="info">
        <span id="phoneno"><b>Customer Phone No.: ${phoneno}</b></span>
        <span id="name"><b>Customer Name: ${name}</b></span>
        
        </div>
        <table>
        <tr>
        <th>Book ID</th>
        <th>Book Name</th>
        <th>Book Price</th>
        <th>Quantity</th>
        <th>Discount</th>
        <th>Final Value</th>
        </tr>
        <%
            //while(rst.next())
            //{
        %>
        <tr>
        <td><%=bookid_var%></td>     
        <td><%=bookname_var%></td> 
        <td><%=price_var%></td> 
        <td><%=quantity_var%></td> 
        <td><%=disc_var%>%</td>
        <td><%=finalprice_var%></td>
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><b>Total Price<b></td>
        <td><b><%=finalprice_var%></b></td>
        </tr> 
        </table>  
        <%
            //}
        %>
        </div>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
        <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
        <script>
            
            var doc=new jsPDF();
            var div=document.querySelector('#bill');
            doc.fromHTML(div,10,5);
            doc.save("Book Order<%=order_id%>.pdf");
        </script> 
    </body>
</html>
