package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerCheck extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String uname=request.getParameter("user");
            String name_var=request.getParameter("name");
            String phone=request.getParameter("phoneno");
            String mail=request.getParameter("email");
            String add=request.getParameter("address");
            String pswd=request.getParameter("pass");
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?);");
            ps.setString(1,uname);
            ps.setString(2,name_var);
            ps.setString(3,phone);
            ps.setString(4,mail);
            ps.setString(5,add);
            ps.setString(6,pswd);
            ps.executeUpdate(); //update done
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registration Successful, Please Login');");
                out.println("location='login.jsp';");
                out.println("</script>");
        }
        catch(SQLException ex) {
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
