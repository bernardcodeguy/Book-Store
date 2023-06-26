
<%@page import="controller.CartDao"%>
<%@page import="controller.CustomerDao"%>
<%@page import="controller.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%! 
    String title = "Search";
    String user = "";
    
    int pageid;
    int total;
    List<Book> list;
    int count;
    int pages;
    int cartNumber;
    int pageNumber;
    int customer_id;
    String keyword = "";
%>

<%@ include file="header.jsp" %>

<% 
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
    if(session.getAttribute("user") == null){
        
       response.sendRedirect("index.jsp");
            
    }else{
        
        user = String.valueOf(session.getAttribute("user")); 
            
        
    }
        
        
        
        
        
        keyword = request.getParameter("keyword");
        
        pageid = Integer.parseInt(request.getParameter("page"));  
        
        pageNumber = Integer.parseInt(request.getParameter("page"));  
        
        total=8;
        
        if(pageid==1){
        }else{  
            pageid=pageid-1;  
            pageid=pageid*total+1;  
        } 

        list=BookDao.getRecordSearch(pageid,total,keyword);


        count = BookDao.getRecordSearchCount(keyword);
        
        customer_id = CustomerDao.customerID(user);
        
        cartNumber = CartDao.cartCount(customer_id);
     
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
                    <a href="cart.jsp"><i class="material-icons left">shopping_cart</i>
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
                    <a href="cart.jsp">Cart  
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
                                <li><a href="new.jsp?page=1">New </a></li>
                                <li><a href="genre.jsp">Genres</a></li>                
                                <li><a href="orders.jsp?page=1">Orders</a></li>    
                            </ul>
                            <ul class="side-nav" id="mobile-demo">
                                <li><a href="home.jsp?page=1">Home</a></li>
                                <li><a href="new.jsp?page=1">New </a></li>
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
   
    <div class="container">  
        <h4 class="white-text" style="padding-top: 30px; font-size: 1.5em;">Search Results</h4>                
       
        
            
            <% if(list.isEmpty()){ %>
            
                 <h4 class="white-text center-align" style="padding-top: 330px; font-size: 2.5em;">No result found!</h4>
            
            <% }else{ %>
                <div class="row">
            
                 <%  for(Book b:list){  %>
                        
                 <div class="col s6 m6 l3" style="margin-top: 20px">  
                             
                             <% if(b.getImg() == null){ %>
                                <img src="cover.png" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                           <% }else{ %>
                                <img src="bookimage?id=<%=b.getBook_id() %>" alt="alt" width="216px" height="289px" style="border-radius: 10%;"/>
                           <% } %>
                            <p class="white-text center-align" style="font-size: 1.25em;">$ <%= b.getPrice() %>  
                                <a class="btn-floating btn-small  waves-effect waves-light grey lighten-2 center-align submit <%=b.getBook_id()%>">
                                    <i class="material-icons black-text">add</i>
                                </a>
                                <form   method="post" action="addCart.jsp"  id="<%=b.getBook_id()%>">        
                                    <input type="hidden" name="customer_id" id="customer_id" value="<%= customer_id %>" 
                                     class="form-control" >
                                    <input type="hidden" name="book_id" id="book_id" value="<%= b.getBook_id() %>" 
                                         class="form-control" >
                                    <input type="hidden" name="page" id="page" value="<%= pageNumber %>" 
                                         class="form-control" >
                                </form>
                                
                                
                                
                            </p>

                        </div> 
            
                <% } %>
                
                    <% if(total >= count){%>

                    <% }else{ %>

                    <div class="col s12 center-align" style=" position: absolute; top: 1230px; left: 0">
                         <ul class="pagination">
                         <% if(pageNumber-1 < 1){%>
                         <li class="disabled"><a href="#" ><i class="material-icons">chevron_left</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect" id="1"><a href="home.jsp?page=<%= pageNumber-1%>" ><i class="material-icons">chevron_left</i></a></li>
                         <% } %>

                        <% for(int i=1; i<=pages; i++) {%>

                        <li class="waves-effect" id="p<%=i%>"><a href="home.jsp?page=<%=i%>" class="white-text"><%=i%></a></li>   

                        <% } %>

                        <% if(pageNumber+1 > pages){%>
                         <li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
                         <% }else{ %>
                         <li class="waves-effect"><a href="home.jsp?page=<%= pageNumber+1%>"><i class="material-icons">chevron_right</i></a></li>
                         <% } %>
                         </ul>
                       </div>


                    <% } %>
                </div>  
            
            <% } %>
           
        
      
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
                
                
                
                    
                $('#p'+pageNo).css('background-color','red');
                    
                
                
               $(document).on('click', '.submit', function(){
				
                   
                     var cl = $(this).attr('class');  
                     var arr = cl.split(' ');
                     
                     var id = arr[9];
                     
                    $('#'+id).submit();
				
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