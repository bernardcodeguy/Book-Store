/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bern Ard
 */
@WebServlet(name = "BookImage", urlPatterns = {"/bookimage"})
public class BookImage extends HttpServlet {
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                int id = Integer.parseInt(request.getParameter("id"));
               
                String sql = "SELECT img FROM book WHERE book_id=?";

                try {
                
                Connection con = ConnectionManager.getConnection();

                PreparedStatement ps;
		  
		   ps = con.prepareStatement(sql);
		   ps.setInt(1, id);
		   
		   ResultSet rs1 = ps.executeQuery();
		   if(rs1.next()){
		    byte [] imageData = rs1.getBytes("img"); // extract byte data from the resultset..
		    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
		             os.write(imageData);
		             os.flush();
		             os.close();
		   }
		  } catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   response.getOutputStream().flush();
		   response.getOutputStream().close();
		  }       
    }

   

}
