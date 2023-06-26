


<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controller.ConnectionManager"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%!
    
    double totalAmount;
    List<Order> list = null;
    int customer_id;  
%>


<% 

    
    list = (List<Order>) session.getAttribute("orders");    
    totalAmount = Double.parseDouble(request.getParameter("total"));
    
    
    for(Order or: list){                
        String sql = "INSERT INTO orders(customer_id,book_id,price,quantity,shipping_address,billing_address,payment_method,order_date,status) VALUES(?,?,?,?,?,?,?,?,?)";
       
        Connection con = ConnectionManager.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setInt(1, or.getCustomer_id());
        ps.setInt(2, or.getBook_id());
        ps.setDouble(3, or.getPrice());
        ps.setInt(4, or.getQuantity());
        ps.setString(5, or.getShipping_address());
        ps.setString(6, or.getBilling_address());
        ps.setString(7, or.getPayment_method());
        ps.setString(8, String.valueOf(LocalDate.now()));
        ps.setString(9, or.getStatus());    
        ps.executeUpdate();
        con.close();
        
        customer_id = or.getCustomer_id();
    }
    
    

    String sql = "INSERT INTO order_checkout(customer_id,payment_date,total_amount) VALUES(?,?,?)";
    Connection con = ConnectionManager.getConnection();
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, customer_id);
    ps.setString(2, String.valueOf(LocalDate.now()));
    ps.setDouble(3, totalAmount);
    ps.executeUpdate();
    con.close();
    

    String sql1 = "DELETE FROM shopping_cart WHERE customer_id="+customer_id;
    Connection con1 = ConnectionManager.getConnection();
    PreparedStatement ps1 = con1.prepareStatement(sql1);
    ps1.executeUpdate();
    con1.close();

    
    
%>