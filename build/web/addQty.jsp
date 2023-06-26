<%@page import="controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>



<%
	int id = Integer.parseInt(request.getParameter("id"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        
	
        String sql = "UPDATE shopping_cart SET quantity=? WHERE shopping_card_id=?";
        
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
        
        int qtyNew = qty + 1;
	ps.setInt(1, qtyNew);
        ps.setInt(2, id);
        
	
	ps.executeUpdate();

%>



