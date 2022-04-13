package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class checkout extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //System.out.println(1);
            HttpSession session=request.getSession();
            String uname_var=session.getAttribute("user").toString();
            String name_var=session.getAttribute("name").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            
            PreparedStatement ps1=con.prepareStatement("select * from cart where username=?");
            ps1.setString(1,uname_var);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            int bookid_var=rs1.getInt(2);
            double finalprice_var=rs1.getDouble(3);
            int quantity_var=rs1.getInt(4);
            
            PreparedStatement ps2=con.prepareStatement("select bookname,price,discount from books where bookid=?");
            ps2.setInt(1,bookid_var);
            ResultSet rs2=ps2.executeQuery();
            rs2.next();
            String bookname_var=rs2.getString(1);
            int price_var=rs2.getInt(2);
            int disc_var=rs2.getInt(3);
            
            PreparedStatement ps3=con.prepareStatement("select phoneno,address from users where username=?;");
            ps3.setString(1,uname_var);
            ResultSet rs3=ps3.executeQuery();
            rs3.next();
            String phoneno=rs3.getString(1);
            String address_var=rs3.getString(2);
            
            String qry="select orderid from orders order by orderid desc limit 1;";
            ResultSet rs4=con.createStatement().executeQuery(qry);
            int order_id=1;
            boolean found=rs4.next();
            
            if(found)
                order_id=rs4.getInt(1)+1;
            LocalDateTime myDateObj = LocalDateTime.now();
            //System.out.println("Before formatting: " + myDateObj);
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDate = myDateObj.format(myFormatObj);
            //System.out.println("After formatting: " + formattedDate);

            PreparedStatement ps4=con.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?);");//problem
            /*out.println("<script type=\"text/javascript\">");
                out.println("alert('1');");
                out.println("</script>");*/
            //System.out.println(sqldatetime_var);
            ps4.setInt(1,order_id);
            ps4.setString(2,uname_var);
            ps4.setInt(3,bookid_var);
            ps4.setString(4,bookname_var);
            ps4.setInt(5,price_var);
            ps4.setInt(6,disc_var);
            ps4.setInt(7,quantity_var);
            ps4.setDouble(8,finalprice_var);
            ps4.setString(9,address_var);
            ps4.setString(10,formattedDate);
            out.println("<script type=\"text/javascript\">");
                out.println("alert('123');");
                out.println("</script>");
            ps4.executeUpdate();
            
            request.setAttribute("orderid",order_id);
            
            request.getRequestDispatcher("generateReceipt.jsp").forward(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Order Successfully Placed!');");
                out.println("location='generateReceipt.jsp';");
                out.println("</script>");
        }
        catch(Exception ex)
        {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
