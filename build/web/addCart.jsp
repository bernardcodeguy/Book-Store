
<%@page import="controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        int pag = Integer.parseInt(request.getParameter("page"));       
	
	
	
	
        String sql = "INSERT INTO shopping_cart(customer_id,book_id,quantity) SELECT * FROM (SELECT ? AS customer_id, ? AS book_id, ? AS quantity) AS new_value WHERE NOT EXISTS (SELECT book_id FROM shopping_cart WHERE book_id = ?) LIMIT 1;";
       
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
        
	ps.setInt(1, customer_id);
	ps.setInt(2, book_id);
        ps.setInt(3, 1);
        ps.setInt(4, book_id);
        
 	ps.executeUpdate();

        
        response.sendRedirect("home.jsp?page="+pag);
        
       
%>

