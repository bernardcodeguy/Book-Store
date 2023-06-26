
<%@page import="model.OrderList"%>
<%@page import="controller.OrderDao"%>
<%@page import="controller.CartDao"%>
<%@page import="controller.CustomerDao"%>
<%@page import="controller.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! 
    String title = "Orders";
    String user = "";
    
    int pageid;
    int total;
    List<OrderList> list;
    int count;
    int pages;
    
    int pageNumber;
     int cartNumber;
    int customer_id;
%>

<%@ include file="header.jsp" %>

<% 
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
    if(session.getAttribute("user") == null){
        
       response.sendRedirect("index.jsp");
            
    }else{
        
        user = String.valueOf(session.getAttribute("user")); 
            
        
    }
    
    pageid = Integer.parseInt(request.getParameter("page"));  
        
    pageNumber = Integer.parseInt(request.getParameter("page"));  

    total=4;

    if(pageid==1){
    }else{  
        pageid=pageid-1;  
        pageid=pageid*total+1;  
    }
       
    customer_id = CustomerDao.customerID(user);
        
    cartNumber = CartDao.cartCount(customer_id);  

    count = OrderDao.orderCount(customer_id);
    
    list = OrderDao.orderList(customer_id, pageid, total);
    
   
     
%>



<header>
    
    
   
         
             
            
 <%                               
                double a = ((double) count)/total;
                pages = (int)Math.ceil(a);            
%>
 
            
   
    
    
    
    
            
  <!-- Navigation Bar -->
  
  <div class="container">
     <div class="navbar">
 	<nav>
            <div class="nav-wrapper nav1" style="background-color: #000000;">
        	<div class="container">
        	<a href="home.jsp?page1" class="brand-logo">Books.</a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li>
                    <a href="cart.jsp?page=1"><i class="material-icons left">shopping_cart</i>
                        <% if(!(cartNumber < 1)){ %>
                        
                            <span class="new badge white-text" style="background-color: #FF5C00;">
                                <%=cartNumber %>    
                            </span>
                        
                        <% } %>
                        
                        
                        
                    </a>
                </li>
                <li><a href="profile.jsp"><i class="material-icons left">person</i></a></li>
                <li><a href="logout"><i class="material-icons left">logout</i></a></li>
            </ul>
            <ul class="side-nav" id="mobile-demo">
                <li>
                    <a href="cart.jsp?page=1">Cart  
                        <% if(!(cartNumber < 1)){ %>
                        
                            <span class="new badge white-text" style="background-color: #FF5C00;">
                                <%=cartNumber %>    
                            </span>
                        
                        <% } %>
                    </a>
                </li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="logout">Log out</a></li>
            </ul>
        	
        	</div>
            
        </div>
    </nav>
     
    </div>  
       <div class="navbar">
 	<nav class="nav-center">
            <div class="nav-wrapper " style="background-color: #FF5C00;">
        	<div class="container">
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                          <ul class=" hide-on-med-and-down" style=" display:flex; justify-content:center;">
                                <li class="home"><a href="home.jsp?page=1">Home</a></li>
                                <li class="new"><a href="new.jsp?page=1">New </a></li>
                                <li class="genre"><a href="genre.jsp">Genres</a></li>                
                                <li class="order"><a href="orders.jsp?page=1">Orders</a></li>    
                            </ul>
                            <ul class="side-nav" id="mobile-demo">
                                <li class="home"><a href="home.jsp?page=1">Home</a></li>
                                <li class="new"><a href="new.jsp?page=1">New </a></li>
                                <li class="genre"><a href="genre.jsp">Genres</a></li>                
                                <li class="order"><a href="orders.jsp?page=1">Orders</a></li>    
                                <li ><a href="logout">Log out</a></li>
                           </ul>
                    
            
        	
        	</div>
            
        </div>
    </nav>
     
    </div> 
      
  </div>
	

    
</header>

<main>
    <div class="container" style="background-color: #F8F8F8; height: 20vh; ">   
        <p class="center-align" style="color: #FF5C00; font-size: 2em; padding-top: 50px;">Search for a book ...</p>     
        <div class="row center-align" style="margin-left: 28%;">
            <div class="col s8">
                <nav style="border-radius: 20px; border: 1px solid #F8F8F8; background-color: #F8F8F8;">
                <div class="nav-wrapper">
                    <form action="search.jsp?page=1" method="post">
                    <div class="input-field">
                        <input id="search" type="search" placeholder="Search by title/author/genre" name="keyword" required>
                      <label class="label-icon" for="search"><i class="material-icons search">search</i></label>
                      
                    </div>
                  </form>
                </div>
              </nav>
            </div>
            
        </div>    
    </div>
            
   <div class=" container" style="height: 100vh; background-color: #FF5C00;">    
   
       <div class="container" style="padding-top: 30px">  
       <h4 class="white-text center-align" style="padding-top: 30px; font-size: 1.5em;">List of Orders (<%=count %>)</h4>    
       
       <% if(list.isEmpty()){ %>
                    
                    <h4 class="white-text center-align" style="padding-top: 330px; font-size: 1.5em;">You have no orders yet!</h4> 
                
       <%}else{%>
       
       
            <% for(OrderList ls: list){ %>
            
                <div>
                    <div class="row">


                     <div class="col s2 l2">
                         
                         <% if(ls.getImg() == null){ %>
                                <img src="action.png" alt="alt" width="87px" height="130px" style="border-radius: 10%;"/>
                         <% }else{ %>
                                     <img src="bookimage?id=<%=ls.getBook_id() %>" alt="alt" width="87px" height="130px" style="border-radius: 10%;"/>
                         <% } %>
                          

                     </div>
                     <div class="col s4 l4">
                         <h3 style="font-size: 2em;" class="white-text"> <%= ls.getAuthor() %> </h3>
                         <p style="font-size: 1.25em;" class="white-text">Book: <%= ls.getTitle() %> </p>
                         <p style="font-size: 1.25em;" class="white-text">Genre:  <%= ls.getGenre() %> </p>
                         <a href="#" class="details" style="font-size: 1em; color: #391500; text-decoration: underline;" onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#391500'"" id="<%= ls.getCustomer_id() %> <%= ls.getBook_id() %> <%= ls.getOrder_id() %>">More Info -></a>
                     </div>

                     <div class="col s4 l4 offset-l2 offset-s2">
                         <h3 style="font-size: 2.25em;" class="white-text">$ <%= ls.getPrice() %> </h3>

                     </div>

                 </div>  

                     <div class="divider white-text" style="margin-bottom: 10px;"></div>
                </div>
            
            
            <%}%>
       
             
            <div class="row">
                
                
                    
                    <% if(total >= count){%>

                    <% }else{ %>

                    <div class="col s12 center-align" style=" position: absolute; top: 1230px; left: 0">
                         <ul class="pagination">
                         <% if(pageNumber-1 < 1){%>
                         <li class="disabled"><a href="#" ><i class="material-icons">chevron_left</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect" id="1"><a href="orders.jsp?page=<%= pageNumber-1%>" ><i class="material-icons">chevron_left</i></a></li>
                         <% } %>

                        <% for(int i=1; i<=pages; i++) {%>

                        <li class="waves-effect" id="p<%=i%>"><a href="orders.jsp?page=<%=i%>" class="white-text"><%=i%></a></li>   

                        <% } %>

                        <% if(pageNumber+1 > pages){%>
                         <li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect"><a href="orders.jsp?page=<%= pageNumber+1%>"><i class="material-icons">chevron_right</i></a></li>
                         <% } %>
                         </ul>
                       </div>


                    <% } %>
                    
                
                
            </div>
            
       <%}%>
       
       
      
        
         
         
        
           
      
      
    </div>
       
       
   
</div> 
    
    <div class="container" style="height: 20vh; background-color: #F8F8F8;">
  
    <p class="center-align" style="font-size: 2em; padding-top:20px; ">
        “A Reader lives a thousand lives before he dies . . . <br>
            The man who never reads lives only one.”
    </p>

</div>
    
</main>

            
<div class="container">

    <footer class="page-footer" style="background-color: #FF5C00;">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Books</h5>
                <p class="grey-text text-lighten-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
                    when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
              </div>
              
            </div>
              
              <div class="row">     
                  <div class="col l3 s12">
                    <h5 class="white-text">Contact Us</h5>
                    <ul>
                      <li><a class="grey-text text-lighten-3" href="#!">P.O. Box 565</a></li>
                      <li><a class="grey-text text-lighten-3" href="#!">United States</a></li>
                      <li><a class="grey-text text-lighten-3" href="#!">+235 021 5665 5665</a></li>

                    </ul>
                  </div>
                  <div class="col l3 s12">
                    <h5 class="white-text">Stay Connected</h5>
                    <ul>
                      <li><a class="grey-text text-lighten-3" href="#!"><i class="fa-brands fa-facebook"></i>      Facebook</a></li>
                      <li><a class="grey-text text-lighten-3" href="#!"><i class="fa-brands fa-twitter"></i>          Twitter</a></li>
                      <li><a class="grey-text text-lighten-3" href="#!"><i class="fa-brands fa-instagram"></i>          Instagram</a></li>
                    </ul>
                  </div>
                  <div class="col l5 s12">
                      <img src="sitting.png" style="margin-right: 10px;" height="339.19px" width="600px"/>
                  </div>
                  
              </div>
          </div>
          <div class="footer-copyright black">
            <div class="container">
            © 2022 Copyright Text
            <a class="grey-text text-lighten-4 right" href="#">More Info</a>
            </div>
          </div>
        </footer>


</div>
    



<%@ include file="mid.jsp" %>

<script>
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                
                
                var pageNo = "<%=pageNumber%>";
                var title = "<%= title%>";
                
                $('#modal').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
                
                
                $('.order').addClass("active");
                            
               
                    
                $('#p'+pageNo).css('background-color','red');
                  
    
                
                
                
                $(document).on('click', '.details', function(){
				
                    var id = $(this).attr('id');
                    var arr = id.split(' ');
                     
                    var cus_id = arr[0];
                    var book_id = arr[1];
                    var order_id = arr[2];
                    
                    
                    $.ajax({
                        url: "orderDetails.jsp",
                        type: "POST",
                        data:{cus_id:cus_id,book_id:book_id,order_id:order_id},
                        success:function(data){
                            $("#content").html(data);
                            $('#modal').modal('open');
                        }


                    }); 
                          
				
                });
                   
            });
                    
</script>



<%@ include file="footer.jsp" %>


<!-- Modal for Order Details-->
	  <div id="modal" class="modal modal-fixed-footer" style="width: 60%; background-color: #FF5C00; border-radius: 2%;">                
	    <div class="modal-content" >
	      <h4 class="center-align white-text">Details of Order</h4>
	      
              <div class="row white-text" id="content" style="margin-top: 30px;">
                    
	      	</div>
	      
	    </div>
              <div class="modal-footer" style="background-color: #391500;">
	      <a href="#" class="modal-close waves-effect waves-light btn-flat red white-text">Close</a>
	    </div>
	  </div>
