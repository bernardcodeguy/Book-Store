<%@page import="controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
    
    String sql= "";
%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        
	if(qty > 1){
            sql = "UPDATE shopping_cart SET quantity=? WHERE shopping_card_id=?";
            
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            int qtyNew = qty - 1;
            ps.setInt(1, qtyNew);
            ps.setInt(2, id);


            ps.executeUpdate();
            
        }else{
            String sql = "DELETE FROM shopping_cart WHERE shopping_card_id=?";
        
            Connection con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);


            ps.executeUpdate();
        }
        
        
	

%>
