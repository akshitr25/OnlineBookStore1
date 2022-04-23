package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class redirectToGenre extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession();//?
            //String genre_var=session.getAttribute("genre").toString();//trial
            String genre_var=request.getParameter("genre");
            session.setAttribute("genre",genre_var);//imp line
            //String s=session.getAttribute("genre").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            System.out.println(genre_var);
            response.sendRedirect("genrePage1.jsp");
        }
        catch(Exception ex)
        {
            Logger.getLogger(redirectToGenre.class.getName()).log(Level.SEVERE, null, ex);
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
/*<!button title="Fantasy Fiction" name="fanfic" type="submit" value="Fantasy Fiction">Fantasy Fiction<!button>
            <!button title="Self-Help" name="selfhelp" type="submit" value="Self-Help">Self-Help<!button>
            <!button title="Wrestling" name="wrestling" type="submit" value="Wrestling">Wrestling<!button>
            <!input name="fanfic" type="submit" value="" class="button"/>
            <!input name="selfhelp" type="submit" value="Self-help" class="button"/>
            <!input name="wrestling" type="submit" value="Wrestling" class="button"/>

<form action="redirectToGenre" method="post">
            <pre>
            
            </pre>
        </form>
        <form action="redirectToGenre" method="post">
            <pre>
            <button name="genre" type="submit" value="Self-Help">Self-Help</button>
            </pre>
         </form>


<button name="genre" type="submit" value="Fantasy Fiction">Fantasy Fiction</button>
            <button name="genre" type="submit" value="Self-Help">Self-Help</button>
*/