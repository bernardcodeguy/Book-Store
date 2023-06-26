/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Customer;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


@WebServlet(name = "SignUpServlet", urlPatterns = {"/signup"})
public class SignUpServlet extends HttpServlet {

  

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String username = request.getParameter("username");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String plainPass1 = request.getParameter("passwd");
        String plainPass2 = request.getParameter("passwd2");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        
        try {
			if(AlreadyExistDao.emailExist(email)) {
				PrintWriter out1 = response.getWriter();
				out1.println("<script type=\"text/javascript\">");
				out1.println("alert('Customer with email you provided already exists');");
				out1.println("location='signup.jsp';");
				out1.println("</script>");				
			}else if(AlreadyExistDao.userNameExist(username)) {
				PrintWriter out1 = response.getWriter();
				out1.println("<script type=\"text/javascript\">");
				out1.println("alert('Customer with username you provided already exists');");
				out1.println("location='signup.jsp';");
				out1.println("</script>");				
			}else {
				if(plainPass1.equals(plainPass2)) {
					String pass1 = hashPassword(plainPass1);
					//String pass2 = hashPassword(plainPass2);
					
					Customer customer = new Customer(fname,lname,username,pass1,email,address,phone);  
					
					SignUpDao signDao = new SignUpDao();
                                        
                                        
					
					
					String result = "";
					try {
						result = signDao.insert(customer);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception ex) {
                                        Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                        
					 if(result.equals("Data entry successfull")) {
						 HttpSession session = request.getSession();
						 session.setAttribute("user", customer.getUsername());			 
						 response.sendRedirect("home.jsp?page=1");	
                                                
					 }else {
						 response.getWriter().print(result);
					 }
				}else {
					PrintWriter out1 = response.getWriter();
					out1.println("<script type=\"text/javascript\">");
					out1.println("alert('Passwords does not match');");
					out1.println("location='register.jsp';"); out1.println("</script>");
				}
				
			}
			
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
        }
        
        
        
    }
    
    private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }
    
    

    

}
