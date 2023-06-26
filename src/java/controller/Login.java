/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
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


@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session = request.getSession();
      
        
        String user = request.getParameter("user");
	String password = request.getParameter("password");
        
        LoginDao dao = new LoginDao();
        
        
        try {
            if(dao.userExist(user, password)){            
                session.setAttribute("user", user);			 
                response.sendRedirect("home.jsp?page=1");
            }else{
                 PrintWriter out1 = response.getWriter();
                out1.println("<script type=\"text/javascript\">");
                out1.println("alert('User Does Not Exists');");
                out1.println("location='login.jsp';");
                out1.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
       
        
    }

    

}
