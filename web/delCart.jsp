<%@page import="controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>



<%
	int del_id = Integer.parseInt(request.getParameter("id"));

        
	
        String sql = "DELETE FROM shopping_cart WHERE shopping_card_id=?";
        
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setInt(1, del_id);
        
	
	ps.executeUpdate();

%>


