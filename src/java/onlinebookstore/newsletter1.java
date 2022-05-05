package onlinebookstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class newsletter1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String uname_var=session.getAttribute("user").toString();
            MyDb db=new MyDb();
            Connection con=db.getCon();
            PreparedStatement ps0=con.prepareStatement("select email,name from users where username=?");
            ps0.setString(1,uname_var);
            ResultSet rs0=ps0.executeQuery();
            rs0.next();
            String to=rs0.getString(1); //
            String name_var=rs0.getString(2); //
            PreparedStatement ps=con.prepareStatement("insert into subscribers select users.email from users where username=?;");
            ps.setString(1,uname_var);
            ps.executeUpdate();
    //fetch the inputs
      //String  to=request.getParameter("to");
      //String  cc=request.getParameter("cc");
      //String  bcc=request.getParameter("bcc");
      ServletContext context = getServletContext();
        final String  from=context.getInitParameter("user");
        final String  pass=context.getInitParameter("pass");
      String  sub="Subscribed to the Newsletter.";
      String  txt="Dear "+name_var+",\nYou have successfully subscribed to HMA Book Store Newsletter.\nThank you!";
    //create and set the properties
      Properties props=System.getProperties();
      props.setProperty("mail.smtp.host", "smtp.gmail.com");
      props.setProperty("mail.smtp.port", "587");
      props.setProperty("mail.smtp.auth", "true");
      props.setProperty("mail.smtp.starttls.enable", "true");
    //create the session and authorised the login n password      
      Session session1=Session.getDefaultInstance(props, new Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from,pass);
                }
      
      });
    //create the message and send   
      MimeMessage msg=new MimeMessage(session1);
      msg.addRecipient(RecipientType.TO, new InternetAddress(to));
      //msg.addRecipient(RecipientType.CC, new InternetAddress(cc));
      //msg.addRecipient(RecipientType.BCC, new InternetAddress(bcc));
      msg.setFrom(new InternetAddress(from));
      msg.setSubject(sub);
      msg.setText(txt);
      Transport.send(msg);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('You have successfully subscribed to our newsletter!');");
                out.println("location='userHome1.jsp';");
                out.println("</script>");
        } catch (AddressException ex) {
            out.println(ex);
        }catch (MessagingException ex) {
            out.println(ex);
        }catch(Exception ex)
        {out.println(ex);}
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
