
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Book;


public class BookDao {
    
    
    public static List<Book> getBooks(int start,int total) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT * FROM book LIMIT "+(start-1)+","+total;
        
        List<Book> list = new ArrayList<>();  
        
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        while(rs.next()){            
            Book b=new Book();  
            b.setBook_id(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setPublisher(rs.getString("publisher"));
            b.setPublished_year(rs.getString("published_year"));
            b.setPrice(rs.getDouble("price"));
            b.setGenre(rs.getString("genre"));
            b.setBook_desc(rs.getString("book_desc"));
            b.setArrival_date(rs.getString("arrival_date"));
            b.setImg(rs.getBlob("img"));
            list.add(b);  
         }         
         con.close();
        
         return list;
    }
    
    public static Book getBookDetails(int book_id) throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT * FROM book WHERE book_id="+book_id;
        
        List<Book> list = new ArrayList<>();  
        
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        Book b=new Book(); 
        while(rs.next()){            
             
            b.setBook_id(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setPublisher(rs.getString("publisher"));
            b.setPublished_year(rs.getString("published_year"));
            b.setPrice(rs.getDouble("price"));
            b.setGenre(rs.getString("genre"));
            b.setBook_desc(rs.getString("book_desc"));
            b.setArrival_date(rs.getString("arrival_date"));
            b.setImg(rs.getBlob("img"));
           
         }         
         con.close();
        
         return b;
    }
    
    public static int getBooksCount() throws SQLException, ClassNotFoundException{ 
        String sql = "SELECT COUNT(*) AS num FROM book";
        
         
        
        Connection con= ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();  
        
        
        int booksCount = 0;
        
        while(rs.next()){            
            
            booksCount = rs.getInt("num");         
         }         
         con.close();
        
         return booksCount;
    }
    
    
    
    public static List<Book> getRecordSearch(int start,int total,String keyword) throws SQLException, ClassNotFoundException{ 
        //String sql = "SELECT * FROM product LIMIT "+(start-1)+","+total;
        String sql = "SELECT * FROM book WHERE LOCATE(?, title) > 0  OR LOCATE(?, author) > 0 OR LOCATE(?, genre) > 0 LIMIT "+(start-1)+","+total;
        
        
        
        List<Book> list = new ArrayList<>(); 
        
        Connection con = ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, keyword);
        ps.setString(2, keyword);
        ps.setString(3, keyword);
        ResultSet rs=ps.executeQuery();  
        
        while(rs.next()){            
            Book b=new Book();  
            b.setBook_id(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setPublisher(rs.getString("publisher"));
            b.setPublished_year(rs.getString("published_year"));
            b.setPrice(rs.getDouble("price"));
            b.setGenre(rs.getString("genre"));
            b.setBook_desc(rs.getString("book_desc"));
            b.setArrival_date(rs.getString("arrival_date"));
            b.setImg(rs.getBlob("img"));
            list.add(b);   
         }        
         con.close();
        
         return list;
    }
    
    
     public static int getRecordSearchCount(String keyword) throws SQLException, ClassNotFoundException{ 
        //String sql = "SELECT * FROM product LIMIT "+(start-1)+","+total;
        String sql = "SELECT COUNT(*) AS num FROM book WHERE LOCATE(?, title) > 0  OR LOCATE(?, author) > 0 OR LOCATE(?, genre) > 0";
        
        
        Connection con = ConnectionManager.getConnection();
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1, keyword);
        ps.setString(2, keyword);
        ps.setString(3, keyword);
        ResultSet rs=ps.executeQuery();  
        
        int booksCount = 0;
        
        while(rs.next()){            
            
            booksCount = rs.getInt("num");         
         }         
         con.close();
        
         return booksCount;
    }
    
}