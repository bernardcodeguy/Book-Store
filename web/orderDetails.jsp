
<%@page import="controller.OrderDao"%>
<%@page import="model.OrderDetails"%>
<%@page import="controller.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%!
   
    OrderDetails details = null;
     int book_id;

%>




<%
	int customer_id = Integer.parseInt(request.getParameter("cus_id"));
        book_id = Integer.parseInt(request.getParameter("book_id"));
        int order_id = Integer.parseInt(request.getParameter("order_id"));       
	
	
	details = (OrderDetails) OrderDao.orderDetails(customer_id, book_id, order_id);    
%>


 <div class="col s12">
     
                <div class="row">
                    <div class="col s3 l3">  
                        
                         <% if(details.getImg() == null){ %>
                                <img src="action.png" alt="alt" width="223" height="332" style="border-radius: 10%;"/>
                         <% }else{ %>
                                     <img src="bookimage?id=<%=book_id %>" alt="alt" width="223" height="332" style="border-radius: 10%;"/>
                         <% } %>                               
                    </div>
                    <div class="col s9 l9">                               
                        <h3 style="font-size: 2em;" class="white-text"><%= details.getTitle() %> </h3>
                        <p style="font-size: 1.25em;" class="white-text">Author: <%= details.getAuthor() %> </p>
                        <p style="font-size: 1.25em;" class="white-text">Genre: <%= details.getGenre() %>  </p>   
                        <div class="divider white-text" style="margin-bottom: 10px;"></div>
                        <h3 style="font-size: 2em;" class="white-text"> $<%= details.getPrice() %>0</h3>
                        <p style="font-size: 1.25em;" class="white-text">Quantity: <%= details.getQuantity() %>  </p>
                        <p style="font-size: 1.25em;" class="white-text">Total Price: $<%= details.getTotalPrice() %>  </p>
                        <p style="font-size: 1.25em;" class="white-text">Date of Order: <%= details.getOrder_date() %>  </p>
                        <p style="font-size: 1.25em;" class="white-text">Delivery Status: <span style="font-style: italic"><%= details.getStatus() %></span>  </p>
                    </div>

                </div>
                                             
</div>
                  
<div class="col s12"  style="margin-top: 50px;">
                     <h3 style="font-size: 2em;" class="white-text" > Book Description</h3> 
                      <p style="font-size: 1.25em;" class="white-text"><%= details.getBook_desc() %> </p>
</div>