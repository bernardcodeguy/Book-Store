package controller;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConnectionManager {
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        System.out.println("--Log--");
        System.out.println("In ConnectionManager");
        String usernameDB = "root";
        String passwordDB = "";
        String urlPort = "localhost:3306";
        String databaseName = "book_store_db";
        String url = "jdbc:mysql://"+urlPort+"/"+databaseName;
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        Class.forName(dbDriver); 
        Connection connection = DriverManager.getConnection(url,usernameDB,passwordDB);
        return connection;
    }
    
}
