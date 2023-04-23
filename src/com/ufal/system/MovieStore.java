package src.com.ufal.system;

import src.com.ufal.system.beans.Client;

import java.sql.SQLException;
import java.util.ArrayList;

public class MovieStore {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        DBConnection.start();
        ArrayList<Client> clients = DBConnection.getClients();
        System.out.println(clients.toString());
        DBConnection.close();
    }
}
