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
import java.util.List;
import model.Cart;
import model.OrderDetails;
import model.OrderList;


public class OrderDao {
    
    public static int orderID(int customer_id,int book_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT order_id FROM orders WHERE customer_id="+customer_id+" AND "+book_id;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        
        ps.setInt(1, customer_id);
        ps.setInt(2, book_id);
        
        ResultSet rs=ps.executeQuery();  
        
        int order_id = 0;
        
        while(rs.next()){            
            order_id = rs.getInt("order_id");
         }         
         con.close();
        
         return order_id;
    }
    
    public static int orderCount(int customer_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT COUNT(*) FROM orders WHERE customer_id="+customer_id;
    
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
    
    public static List<OrderList> orderList(int customer_id,int start,int total) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT orders.*, customer.customer_id,book.* FROM orders"
                + " INNER JOIN customer ON orders.customer_id = customer.customer_id"
                + " INNER JOIN book ON orders.book_id = book.book_id WHERE customer.customer_id="+customer_id+" ORDER BY order_id ASC LIMIT "+(start-1)+","+total;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        List<OrderList> list = new ArrayList<>();
        
        while(rs.next()){            
            OrderList ls=new OrderList();  
            ls.setOrder_id(rs.getInt("order_id"));
            ls.setCustomer_id(rs.getInt("customer_id"));
            ls.setBook_id(rs.getInt("book_id"));
            ls.setTitle(rs.getString("title"));
            ls.setAuthor(rs.getString("author"));
            ls.setPrice(rs.getDouble("price"));
            ls.setGenre(rs.getString("genre"));
            ls.setImg(rs.getBlob("img"));
            list.add(ls);  
         }         
         con.close();
        
         return list;      
    }
    
    public static OrderDetails orderDetails(int customer_id,int book_id,int order_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT orders.*,DATE_FORMAT(orders.order_date,\"%e %M, %Y\") AS date_ordered,customer.customer_id,book.* FROM orders"
                + " INNER JOIN customer ON orders.customer_id = customer.customer_id"
                + " INNER JOIN book ON orders.book_id = book.book_id WHERE customer.customer_id="+customer_id+" AND book.book_id="+book_id+" AND orders.order_id="+order_id;
    
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        OrderDetails details = new OrderDetails();
        
        while(rs.next()){            
              details.setTitle(rs.getString("title"));
              details.setAuthor(rs.getString("author"));
              details.setGenre(rs.getString("genre"));
              details.setPrice(rs.getDouble("price"));
              details.setQuantity(rs.getInt("quantity"));
              
              details.setTotalPrice(rs.getDouble("price") * rs.getInt("quantity"));
              details.setOrder_date(rs.getString("date_ordered"));
              details.setStatus(rs.getString("status"));
              details.setBook_desc(rs.getString("book_desc"));
              details.setImg(rs.getBlob("img"));
         }         
         con.close();
        
         return details;      
    }
    
    
}
