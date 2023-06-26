package controller;

import controller.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class AlreadyExistDao {
	
	public static boolean emailExist(String email) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM customer WHERE email=? LIMIT 1";
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		
		
		if(rs.next()) {
			con.close();
			return true;
		}else {
			con.close();
			return false;
		}
		
		
	}
        
        public static boolean userNameExist(String username) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM customer WHERE username=? LIMIT 1";
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, username);
		
		ResultSet rs = ps.executeQuery();
		
		
		
		if(rs.next()) {
			con.close();
			return true;
		}else {
			con.close();
			return false;
		}
		
		
	}

}
