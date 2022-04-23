package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addToCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            String uname_var=session.getAttribute("user").toString();
            String bookid_var=request.getParameter("bookid");
            int quantity_var=Integer.parseInt(request.getParameter("quantity"));
            double finalprice_var=(double)session.getAttribute("finalprice")*quantity_var;
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps0=con.prepareStatement("select * from cart where username=?");
            ps0.setString(1,uname_var);
            ResultSet rs0=ps0.executeQuery();
                if(rs0.next())
                {
                    PreparedStatement pst=con.prepareStatement("delete from cart where username=?;");
                    pst.setString(1,uname_var);
                    pst.executeUpdate();
                }
            PreparedStatement ps=con.prepareStatement("insert into cart values(?,?,?,?);");
            ps.setString(1,uname_var);
            ps.setString(2,bookid_var);
            ps.setDouble(3,finalprice_var);
            ps.setInt(4,quantity_var);
            ps.executeUpdate(); //update done
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item added to your cart!');");
                out.println("location='bookInfo1.jsp';");
                out.println("</script>");
        }
        catch(SQLException ex)
        {
            Logger.getLogger(registerCheck.class.getName()).log(Level.SEVERE, null, ex);
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
