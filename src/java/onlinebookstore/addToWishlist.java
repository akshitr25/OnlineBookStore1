package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addToWishlist extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();
            String uname_var=session.getAttribute("user").toString();
            int bookid_var=Integer.parseInt(request.getParameter("bookid")); //.toString()
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps0=con.prepareStatement("select * from wishlist where username=? and bookid=?;");
            ps0.setString(1,uname_var);
            ps0.setInt(2,bookid_var);
            ResultSet rs0=ps0.executeQuery();
            //boolean notEmpty=rs0.next();
            if(!rs0.next())
            {
                PreparedStatement pst=con.prepareStatement("select bookname from books where bookid=?");
                pst.setInt(1,bookid_var);
                ResultSet rst=pst.executeQuery();
                rst.next();
                String bookname_var=rst.getString(1);
                PreparedStatement ps=con.prepareStatement("insert into wishlist values(?,?,?);");
                ps.setString(1,uname_var);
                ps.setInt(2,bookid_var);
                ps.setString(3,bookname_var);
                ps.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item added to your wishlist!');");
                out.println("location='bookInfo.jsp';");
                out.println("</script>");
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item already in your wishlist!');");
                out.println("location='bookInfo.jsp';");
                out.println("</script>");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(addToWishlist.class.getName()).log(Level.SEVERE, null, ex);
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
