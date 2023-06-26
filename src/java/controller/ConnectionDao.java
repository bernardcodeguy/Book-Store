/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Bern Ard
 */
public class ConnectionDao {
    
    
    
    public static String connect() throws ClassNotFoundException, SQLException{
        
        
        
        String sql = "SELECT * FROM customer";
        
        
        Connection con = ConnectionManager.getConnection();
        Statement st = con.createStatement();
        
        ResultSet rs = st.executeQuery(sql);
        
        
        while(rs.next()){
            return rs.getString("first_name");
        }
        
        
        
        return "N/A";
        
    }
    
}
