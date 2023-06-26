/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import controller.ConnectionManager;
import com.mysql.cj.xdevapi.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

public class LoginDao {
    
    public boolean userExist(String user,String password) throws ClassNotFoundException, SQLException{
        String sql = "SELECT * FROM customer WHERE email=? OR username=?";
        
        
        Connection con = ConnectionManager.getConnection();
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, user);
        ps.setString(2, user);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {				
            String pass1 = rs.getString("password");
            Boolean match = BCrypt.checkpw(password, pass1);
            con.close();

            if(password.equals(pass1) || match) {
                    return true;
            }
	}
        
        return false;
    }
    
    
    
    
    
    
    
}
