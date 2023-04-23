package src.com.ufal.system;

import src.com.ufal.system.beans.Client;

import java.sql.*;
import java.util.ArrayList;

public class DBConnection {
    static final String USER = "localhost";
    static final String PASSWORD = "";
    static final String PORT = "3306";
    static final String DATABASE = "db_movie_store";
    static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String URL = "jdbc:mysql://" + USER + ":" + PORT + "/" + DATABASE;
    static Connection connection;

    static void start() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        connection = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
        connection.close();
    }

    static ArrayList<Client> getClients() {
        return new ArrayList<Client>();
    }

}
