package src.com.ufal.system;

import src.com.ufal.system.beans.Client;

import java.sql.*;
import java.util.ArrayList;

public class DBConnection {
    static private final String USER = "localhost";
    static private final String PASSWORD = "";
    static private final String PORT = "3306";
    static private final String DATABASE = "db_movie_store";
    static private final String DRIVER = "com.mysql.cj.jdbc.Driver";
    static private final String URL = "jdbc:mysql://" + USER + ":" + PORT + "/" + DATABASE;
    static private Connection connection;

    static void start() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        connection = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
    }

    static ArrayList<Client> getClients() {
        return new ArrayList<Client>();
    }

    static void close() throws SQLException {
        connection.close();
    }

}
