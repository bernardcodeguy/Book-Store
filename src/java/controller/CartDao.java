/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import model.Book;
import model.Cart;

/**
 *
 * @author Bern Ard
 */
public class CartDao {
    
    public static int cartCount(int customer_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT COUNT(*) FROM shopping_cart WHERE customer_id="+customer_id;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        int count = 0;
        
        while(rs.next()){            
            count = rs.getInt(1);
         }         
         con.close();
        
         return count;
    }
    
    public static List<Cart> cartDetails(int customer_id,int start,int total) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT shopping_cart.shopping_card_id,shopping_cart.quantity, customer.customer_id,customer.address,book.* FROM shopping_cart"
                + " INNER JOIN customer ON shopping_cart.customer_id = customer.customer_id"
                + " INNER JOIN book ON shopping_cart.book_id = book.book_id WHERE customer.customer_id="+customer_id+" LIMIT "+(start-1)+","+total;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        List<Cart> list = new ArrayList<>();
        
        while(rs.next()){            
            Cart c=new Cart();  
            
            c.setShopping_card_id(rs.getInt("shopping_card_id"));
            c.setCustomer_id(rs.getInt("customer_id"));
            c.setAddress(rs.getString("address"));
            c.setBook_id(rs.getInt("book_id"));
            c.setTitle(rs.getString("title"));
            c.setAuthor(rs.getString("author"));
            c.setPrice(rs.getDouble("price"));
            c.setQuantity(rs.getInt("quantity"));
            c.setImg(rs.getBlob("img"));
            list.add(c);  
         }         
         con.close();
        
         return list;      
    }
    
    
    
    public static double totalPrice(int customer_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT shopping_cart.shopping_card_id,shopping_cart.quantity, customer.customer_id,book.* FROM shopping_cart"
                + " INNER JOIN customer ON shopping_cart.customer_id = customer.customer_id"
                + " INNER JOIN book ON shopping_cart.book_id = book.book_id WHERE customer.customer_id="+customer_id;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        
        Map<Double,Integer> price = new HashMap<>();
        
        while(rs.next()){            
           
          price.put(rs.getDouble("price"), rs.getInt("quantity"));
         }         
         con.close();
         
         
         double checkoutPrice = 0.00;
         
         
         Iterator<Map.Entry<Double, Integer>> itr = price.entrySet().iterator();
         
         while(itr.hasNext())
        {
             Map.Entry<Double, Integer> entry = itr.next();
             
             double subtotal = entry.getKey() * entry.getValue();
             
             checkoutPrice = checkoutPrice + subtotal;
        }
         
        
         return checkoutPrice;      
    }
    
    
    
    
    
}
