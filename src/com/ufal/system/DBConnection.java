package src.com.ufal.system;

import java.sql.*;

public class DBConnection {

    static void start() throws ClassNotFoundException, SQLException {
        final String USER = "localhost";
        final String PASSWORD = "";

        final String PORT = "3306";
        final String DATABASE = "db_movie_store";
        final String DRIVER = "com.mysql.cj.jdbc.Driver";
        final String URL = "jdbc:mysql://"+USER+":"+PORT+"/"+DATABASE;
        Connection connection;

        Class.forName(DRIVER);
        connection = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
        connection.close();
    }

}
