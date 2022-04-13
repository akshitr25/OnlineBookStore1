package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateQuantity extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session=request.getSession();
            String uname_var=session.getAttribute("user").toString();
            int bookid_var=Integer.parseInt(request.getParameter("bookid"));
            
            int quantity_var=Integer.parseInt(request.getParameter("quantity"));
            
            //double finalprice_var=(double)session.getAttribute("finalprice")*quantity_var;
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps1=con.prepareStatement("select books.price,books.discount from books,cart where books.bookid=? and cart.bookid=books.bookid;");
            ps1.setInt(1,bookid_var);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();
            int price_var=rs1.getInt(1);
            int disc_var=rs1.getInt(2);
            //double finalprice_var=Double.parseDouble(session.getAttribute("finalprice").toString());
            PreparedStatement ps2=con.prepareStatement("update cart set quantity=?,final_price=? where username=? and bookid=?;");
            ps2.setInt(1,quantity_var);
            double finalprice_var=(price_var*quantity_var)*(100-disc_var)/100;
            ps2.setDouble(2,finalprice_var);
            ps2.setString(3,uname_var);
            ps2.setInt(4,bookid_var);
            ps2.executeUpdate();
            //request.setAttribute("finalprice",finalprice_var);
            response.sendRedirect("editCart.jsp");
            /*
                out.println("<script type=\"text/javascript\">");
                out.println("location='editCart.jsp';");
                out.println("</script>");
            */
        }
        catch(Exception ex){}
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
