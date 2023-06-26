/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Customer;


public class SignUpDao {
    
    
    public static String insert(Customer customer) throws Exception{
        Connection con = ConnectionManager.getConnection();
        String result = "Data entry successfull";
        String sql = "INSERT INTO customer(first_name,last_name,username,password,email,address,phone) VALUES(?,?,?,?,?,?,?)";	
        PreparedStatement ps;

        try {
                ps = con.prepareStatement(sql);
                ps.setString(1, customer.getFirst_name());
                ps.setString(2, customer.getLast_name());
                ps.setString(3, customer.getUsername());
                ps.setString(4, customer.getPassword());
                ps.setString(5, customer.getEmail());
                ps.setString(6, customer.getAddress());
                ps.setString(7, customer.getPhone());
               

                ps.executeUpdate();
                con.close();
        } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                result = "Data entry unsuccessfull";
        }

        return result;      
        
    }
    
}
