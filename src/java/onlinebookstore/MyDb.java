package onlinebookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyDb {
    Connection con;
    public Connection getCon()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinebookstore","root","root");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MyDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
