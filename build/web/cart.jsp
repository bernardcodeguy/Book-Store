
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Order"%>
<%@page import="model.Cart"%>
<%@page import="controller.CartDao"%>
<%@page import="controller.CustomerDao"%>
<%@page import="controller.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! 
    String title = "Cart";
    String user = "";
    
    int pageid;
    int total;
    List<Cart> list;
    int count;
    int pages;
    
    int pageNumber;
     int cartNumber;
    int customer_id;
    
    double checkoutPrice;
    
    List<Order> orders;
    
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
        
        total=3;
        
        if(pageid==1){
        }else{  
            pageid=pageid-1;  
            pageid=pageid*total+1;  
        }
    
       
      
    customer_id = CustomerDao.customerID(user);
        
    cartNumber = CartDao.cartCount(customer_id);
    
    count = cartNumber;

    list = CartDao.cartDetails(customer_id,pageid,total);
        
    
     checkoutPrice = CartDao.totalPrice(customer_id);
     
     orders = new ArrayList<>();
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
                    <a href="cart.jsp?page=1"><i class="material-icons left carti">shopping_cart</i>
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
    <div class="container" style="background-color: #F8F8F8; height: 10vh; ">   
        <p class="center-align" style="color: #FF5C00; font-size: 2em; padding-top: 20px;">Cart(<%=cartNumber %>)</p>     
        
    </div>
            
   <div class=" container" >  
       
       
       
       <div class="row">
           <div class="col s12 m12 l8">
               
               <div style="height: 120vh; background-color: #FF5C00; border-radius: 2%;">
                   
                   <% if(list.isEmpty()){ %>
                            <div class="row">
                
                            <div class="container" style="padding-top: 30px;">
                                    
                                        <h4 class="white-text center-align" style="padding-top: 330px; font-size: 2.5em;">Cart is Empty!</h4>
                                
                            </div>
                            
                            

                            </div>  
                    
                            </div>
                   <%}else{ %>
                         <%  for(Cart c:list){  %>
                            <div class="row">
                
                            <div class="container" style="padding-top: 30px;">
                            <div class="col s4 l4">
                                
                                <% if(c.getImg() == null){ %>
                                <img src="cover.png" alt="alt" width="190px" height="253px" style="border-radius: 10%;"/>
                                <% }else{ %>
                                     <img src="bookimage?id=<%=c.getBook_id() %>" alt="alt" width="190px" height="253px" style="border-radius: 10%;"/>
                                <% } %>
                                 
                            </div>
                                
                                <%
                                             Order order = new Order();
                                             
                                             order.setCustomer_id(c.getCustomer_id());
                                             order.setBook_id(c.getBook_id());
                                             order.setPrice(c.getPrice());
                                             order.setQuantity(c.getQuantity());
                                             order.setShipping_address(c.getAddress());
                                             order.setBilling_address(c.getAddress());
                                             order.setPayment_method("Pay Cash on Delivery");
                                             order.setOrder_date(String.valueOf(LocalDate.now()));
                                             order.setStatus("Pending Delivery");
                                             
                                             orders.add(order);
                                             
                                %>
                            
                            <div class="col s12 l4">
                                <h3 style="font-size: 1.5em;" class="white-text"><%=  c.getTitle() %> </h3>
                                <p style="font-size: 1em;" class="white-text">Author : <%=  c.getAuthor() %></p>
<!--                                <a href="#" style="font-size: 1em; color: #391500; text-decoration: underline;" 
                                   onMouseOver="this.style.color='#FFF'" onMouseOut="this.style.color='#391500'"">More Info -></a>-->
                                
                                <a class="btn-floating btn-small b waves-effect black center-align del" style="margin-top: 20px;" id="<%=c.getShopping_card_id()%> i">
                                    <i class="material-icons white-text">delete</i>
                                </a>
                            </div>

                            <div class="col s12 l4 ">
                                <h3 style="font-size: 2.25em;" class="white-text">$<%=  c.getPrice() %>0 </h3>
                                
                                <div class="row">
                                    <div class="col s4 l4">
                                         <a class="btn-floating btn-small b waves-effect black center-align plus" id="<%=c.getShopping_card_id()%> <%=c.getQuantity() %>">
                                            <i class="material-icons white-text">add</i>
                                        </a>
                                    </div>
                                    <div class="col s2 l2">
                                         <p class=" white-text center-align" style="font-size: 1.5em;">
                                            <%=  c.getQuantity() %>
                                        </p>
                                    </div>
                                    
                                    <div class="col s2 l2">
                                         <a class="btn-floating btn-small b waves-effect black center-align minus" id="<%=c.getShopping_card_id()%> <%=c.getQuantity() %>">
                                            <i class="material-icons white-text">remove</i>
                                        </a>
                                    </div>
                                </div>
                                
                                             
                                
                            </div>
                            
                            

                            </div>  
                    
                            </div>
                            
                         <div class="container">
                            <div class="divider white-text" style="margin-bottom: 10px;"></div> 
                        </div>
                    <% } %>
                    
                    
                    <% session.setAttribute("orders", orders); %>
                    
                    <% if(total >= count){%>

                    <% }else{ %>

                    <div class="col s12" style=" position: absolute; top: 1230px; margin-left: 330px">
                         <ul class="pagination">
                         <% if(pageNumber-1 < 1){%>
                         <li class="disabled"><a href="#" ><i class="material-icons">chevron_left</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect" id="1"><a href="cart.jsp?page=<%= pageNumber-1%>" ><i class="material-icons">chevron_left</i></a></li>
                         <% } %>

                        <% for(int i=1; i<=pages; i++) {%>

                        <li class="waves-effect" id="p<%=i%>"><a href="cart.jsp?page=<%=i%>" class="white-text"><%=i%></a></li>   

                        <% } %>

                        <% if(pageNumber+1 > pages){%>
                         <li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect"><a href="cart.jsp?page=<%= pageNumber+1%>"><i class="material-icons">chevron_right</i></a></li>
                         <% } %>
                         </ul>
                       </div>


                    <% } %>
                    
                   <%} %>
                   
                    
                    
                   
                   
                        
                            
                            
                   
               </div>
               
           </div>
                   
                   
            <% if(list.isEmpty()){ %>
                            
            <%}else{ %>
                   
                   
                   
           <div class="col s12 m12 l4">
                <div style="height: 25vh; background-color: #FF5C00; border-radius: 3% 3% 0 0;">
                    
                   
                   
                    <div class="row">
                
                        <div class="container">
                           
                                <p class=" white-text" style="font-size: 2em; padding-top: 20px;">Cart Summary</p>
                                <div class="row" style="margin-top: 30px;">
                                    <div class="col s12 l4">
                                         <p class=" white-text" style="font-size: 1em; margin-top: 10px;">Subtotal</p>
                                    </div>
                                    <div class="col s12 l6 offset-l2    ">
                                         <p style="font-size: 2em;" class="white-text">$<%= checkoutPrice %>0 </p>
                                    </div>
                                </div>
                            
                            </div>  
                            
                        
                    
                        </div>
                    
                    <a href="#" class="btn pay black" id="<%= checkoutPrice%>" style="width: 100%; height: 20%; margin-top: 15px; padding-top: 5px;">CHECKOUT($<%= checkoutPrice %>0)</a>
               </div>
           </div>
           
           <%} %>
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
                
                
                
                
                $('.cart').css('color','#FF5C00');
                $('.carti').addClass('red-text');
                                 
                $('#p'+pageNo).css('background-color','red');
                  
                 
                 
                $(document).on('click', '.del', function(){
                    
                    
                    var i = $(this).attr('id');
                    var arr = i.split(' ');
                     
                    var id = arr[0];
                    				
                    $.ajax({
                        url: "delCart.jsp",
                        type: "POST",
                        data:{id:id},
                        success:function(data){
                             window.location.reload(true);
                        }


                   }); 
               }); 
               
               
               $(document).on('click', '.plus', function(){               
                    var i = $(this).attr('id');
                    var arr = i.split(' ');
                     
                    var id = arr[0];
                    var qty = arr[1];
                    
                    //  alert(qty);
                    				
                    $.ajax({
                        url: "addQty.jsp",
                        type: "POST",
                        data:{id:id,qty:qty},
                        success:function(data){
                             window.location.reload(true);
                        }


                   }); 
               });
               
               $(document).on('click', '.minus', function(){               
                    var i = $(this).attr('id');
                    var arr = i.split(' ');
                     
                    var id = arr[0];
                    var qty = arr[1];
                    
                    //  alert(qty);
                    				
                    $.ajax({
                        url: "minusQty.jsp",
                        type: "POST",
                        data:{id:id,qty:qty},
                        success:function(data){
                             window.location.reload(true);
                        }


                   }); 
               });
               
               
               $(document).on('click', '.pay', function(){               
                    var total = $(this).attr('id');

                    
                     // alert(total);
                    				
                    $.ajax({
                        url: "orderBook.jsp",
                        type: "POST",
                        data:{total:total},
                        success:function(data){
                             window.location.reload(true);
                             //alert(data);
                        }


                   }); 
               });
                 
                 
                
//                $(document).on('click', '.add-to-cart', function(){
//				
//                    var musicid = $(this).attr('id');
//                    var userid = '${id}';
//                    $.ajax({
//                        url: "addCart.jsp",
//                        type: "POST",
//                        data:{musicid:musicid,userid:userid},
//                        success:function(data){
//                             window.location.reload(true);
//                        }
//
//
//                    }); 
//                          
//				
//                });
                   
            });
                    
</script>



<%@ include file="footer.jsp" %>