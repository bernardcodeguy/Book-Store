/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CustomerDao {
    
    public static int customerID(String user) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT customer_id FROM customer WHERE username=? OR email=?";
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        
        ps.setString(1, user);
        ps.setString(2, user);
        
        ResultSet rs=ps.executeQuery();  
        
        int customer_id = 0;
        
        while(rs.next()){            
            customer_id = rs.getInt("customer_id");
         }         
         con.close();
        
         return customer_id;
    }
    
}
