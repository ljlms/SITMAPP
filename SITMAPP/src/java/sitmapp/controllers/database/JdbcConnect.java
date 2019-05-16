
package sitmapp.controllers.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnect {
    
    
    private final static String USER = "manuponton";
    private final static String PASSWORD = "adminponton";
    private final static String URL = "jdbc:mysql://localhost:3308/sitmapp";
    private final static String DRIVER = "com.mysql.jdbc.Driver";

    public static Connection connect() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
