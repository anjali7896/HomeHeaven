package HomeHeaven.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/homeheaven";
    private static final String USER = "root";
    private static final String PASS = "root";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            System.out.println("DB Error: " + e);
        }
        return con;
    }
}
