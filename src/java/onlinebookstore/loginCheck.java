package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginCheck extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String uname=request.getParameter("user");
            String pswd=request.getParameter("pass");
            MyDb db=new MyDb();
            Connection con=db.getCon();
            //out.println(username+" "+password);
            //Statement st=con.createStatement(); //issue!
            PreparedStatement ps=con.prepareStatement("select name from users where username=? and password=password(?)");
            ps.setString(1,uname);
            ps.setString(2,pswd);
            ResultSet rs=ps.executeQuery();
            boolean found=rs.next();
            if(found)
            {
                //request.getSession().setAttribute("id",sid);
                HttpSession session=request.getSession();//?
                session.setAttribute("user",uname);//?
                String name=rs.getString(1);
                session.setAttribute("name",name);
                session.setAttribute("genre",null);
                session.setAttribute("finalprice",null);//for cart
                session.setAttribute("phoneno",null);
                response.sendRedirect("userHome1.jsp"); //change!
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Credentials');");
                out.println("location='login1.jsp';");
                out.println("</script>");
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(loginCheck.class.getName()).log(Level.SEVERE, null, ex);
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
