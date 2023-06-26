<%-- 
    Document   : home
    Created on : Sep 3, 2022, 3:12:54 PM
    Author     : Kornell
--%>

<%@page import="controller.CartDao"%>
<%@page import="controller.CustomerDao"%>
<%@page import="controller.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! 
    String title = "New Arrivals";
    String user = "";
    
    int pageid;
    int total;
    List<Book> list;
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
        
        total=8;
        
        if(pageid==1){
        }else{  
            pageid=pageid-1;  
            pageid=pageid*total+1;  
        } 

        list=BookDao.getBooks(pageid,total);  

         customer_id = CustomerDao.customerID(user);
        
        cartNumber = CartDao.cartCount(customer_id);
    
     
%>



<header>
    
    
   
         
             
            
            <%              
//                count = (int) pageContext.getAttribute("coun");                
//                double a = ((double) count)/total;
//                pages = (int)Math.ceil(a);            
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
                                <li><a href="home.jsp?page=1">Home</a></li>
                                <li class="new"><a href="new.jsp?page=1">New </a></li>
                                <li><a href="genre.jsp">Genres</a></li>                
                                <li><a href="orders.jsp?page=1">Orders</a></li>    
                            </ul>
                            <ul class="side-nav" id="mobile-demo">
                                <li><a href="home.jsp?page=1">Home</a></li>
                                <li class="new"><a href="new.jsp?page=1">New </a></li>
                                <li><a href="genre.jsp">Genres</a></li>                
                                <li><a href="orders.jsp?page=1">Orders</a></li>    
                                <li><a href="logout">Log out</a></li>
                           </ul>
                    
            
        	
        	</div>
            
        </div>
    </nav>
     
    </div> 
      
  </div>
	

    
</header>

<main>
    <div class="container" style="background-color: #F8F8F8; height: 20vh; ">   
        <p class="center-align" style="color: #FF5C00; font-size: 2em; padding-top: 50px;">New Arrivals</p>     
        <div class="row center-align" style="margin-left: 28%;">
            <div class="col s8">
                <nav style="border-radius: 20px; border: 1px solid #F8F8F8; background-color: #F8F8F8;">
                <div class="nav-wrapper">
                  <form>
                    <div class="input-field">
                        <input id="search" type="search" placeholder="Search by title/author/genre" required>
                      <label class="label-icon" for="search"><i class="material-icons search">search</i></label>
                      
                    </div>
                  </form>
                </div>
              </nav>
            </div>
            
        </div>    
    </div>
            
   <div class=" container" style="height: 80vh; background-color: #FF5C00;">    
   
    <div class="container">  
        <h4 class="white-text" style="padding-top: 30px; font-size: 1.5em;">New Books</h1> 
        <div class="row">
            
            
                <div class="col s6 m6 l3">  
                    
                    <img src="img.jpg" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                    
                    <p class="white-text center-align" style="font-size: 1.25em;">$50.00  
                        <a class="btn-floating btn-small b waves-effect waves-light grey lighten-2 center-align">
                            <i class="material-icons black-text">add</i>
                        </a>
                    </p>       
                </div> 
            
             <div class="col s6 m6 l3">  
                    
                    <img src="img.jpg" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                    <p class="white-text center-align" style="font-size: 1.25em;">$50.00  
                        <a class="btn-floating btn-small b waves-effect waves-light grey lighten-2 center-align">
                            <i class="material-icons black-text">add</i>
                        </a>
                    </p>
                           
                </div> 
            
             <div class="col s6 m6 l3">  
                    
                    <img src="book.png" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                    <p class="white-text center-align" style="font-size: 1.25em;">$50.00  
                        <a class="btn-floating btn-small b waves-effect waves-light grey lighten-2 center-align">
                            <i class="material-icons black-text">add</i>
                        </a>
                    </p>
                           
                </div> 
             <div class="col s6 m6 l3">  
                    
                    <img src="img.jpg" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                    <p class="white-text center-align" style="font-size: 1.25em;">$50.00  
                        <a class="btn-floating btn-small b waves-effect waves-light grey lighten-2 center-align">
                            <i class="material-icons black-text">add</i>
                        </a>
                    </p>
                           
                </div> 
            
             <div class="col s6 m6 l3">  
                    
                    <img src="book.png" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                    <p class="white-text center-align" style="font-size: 1.25em;">$50.00  
                        <a class="btn-floating btn-small b waves-effect waves-light grey lighten-2 center-align">
                            <i class="material-icons black-text">add</i>
                        </a>
                    </p>
                           
                </div> 
            
            
                 
        </div>  
      
    </div>
   
</div> 
<div class="container" style="height: 5vh; background-color: #F8F8F8;">
  
  

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
                
                
                
                    
                $('#'+pageNo).attr('class','waves-effect  grey lighten-2');
                    
                $('.new').addClass("active");
                
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