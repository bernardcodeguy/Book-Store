<%-- 
    Document   : signup
    Created on : Sep 3, 2022, 12:45:25 PM
    Author     : Kornell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! 
    String title = "Sign Up";
    String username = "";
%>

<%@ include file="header.jsp" %>

<% 
//    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//    if(session.getAttribute("username") == null){
//    
//        response.sendRedirect("start");
//    }else{     
//        username = String.valueOf(session.getAttribute("username"));
//    }

%>


    <div class="container" id="reg-container" style="margin-top: 0px;"> 
            <div class="card signlog">
                  <div class="card-content">	       
                   <div class="row center-align">
                           <div class="col s12">
                                   <img src="cart.png" >
                           </div>
                   </div>	

                   <form action="signup" method="post">
                   <div class="row center-align">
                              
                                   <div class="col s12">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">person</i>
                                                   <input type="text" id="username" name="username" class="validate" placeholder="USERNAME" required>
                                                   
                                           </div>
                                   </div>    

                                   <div class="col s12 m6 l6">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">person</i>
                                                   <input type="text" id="fname" name="fname" class="validate"  placeholder="FIRSTNAME" required>
                                                   
                                           </div>
                                   </div>

                                   <div class="col s12 m6 l6">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">person</i>
                                                   <input type="text" id="lname" name="lname" class="validate" placeholder="LASTNAME" required>
                                                  
                                           </div>
                                   </div>

                                   <div class="col s12">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">email</i>
                                                   <input type="email" id="email" name="email" class="validate"  placeholder="EMAIL" required>
                                                   
                                           </div>
                                   </div>

                                   <!-- Password -->

                                   <div class="col s12 m6 l6">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">https</i>
                                                   <input type="password" id="passwd" name="passwd" class="validate"  placeholder="PASSWORD" required>
                                                   
                                           </div>
                                   </div>

                                   <div class="col s12 m6 l6">
                                           <div class=input-field>
                                                   <i class="material-icons prefix">https</i>
                                                   <input type="password" id="passwd2" name="passwd2" class="validate"  placeholder="CONFIRM" required>
                                                   
                                           </div>
                                   </div>
                                   
                                   <div class="col s12">
                                        
                                       <div class=input-field>
                                            <i class="material-icons prefix">home</i>
                                            <input type="text" id="passwd2" name="address" class="validate"  placeholder="ADDRESS" required>
                                                   
                                        </div>                                
                                    </div>
                                   
                                    <div class="col s12">
                                        
                                       <div class=input-field>
                                            <i class="material-icons prefix">call</i>
                                            <input type="text" id="passwd2" name="phone" class="validate"  placeholder="PHONE NUMBER" required>
                                                   
                                        </div>                                
                                    </div>
                                           
                                   </div>
                                   
                                   

                                   <div class="col s12 center-align">
                                           <div class=input-field>	       					
                                                   <input type="submit" class="btn submitbtn" value="SIGNUP">		       					
                                           </div>
                                   </div>
                   </div>

                </form>

                   <div class="row center-align">
                       <p class="white-text">Have an account already?</p>
                       <p><a href="login.jsp" class="black-text">Login</a></p>
                   </div>


                  </div>

           </div>	 

    </div>

<%@ include file="mid.jsp" %>


    <script type="text/javascript">
        
        
        $(document).ready(function(){
            M.updateTextFields();
	});
    
    
           
           
       

    </script>

<%@ include file="footer.jsp" %>
