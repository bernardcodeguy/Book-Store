<%-- 
    Document   : allogin
    Created on : Sep 3, 2022, 2:49:28 PM
    Author     : Kornell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! 
    String title = "Log In";
    String username = "";
%>

<%@ include file="header.jsp" %>

<div class="container" id="reg-container"> 
    <div class="card signlog " >
		       <div class="card-content">
                           <div class="row right">
                               <div class="col s12">
                                   <a class="btn black" href="signup.jsp">SIGNUP</a>
                                </div>
                           </div>
                        
		       	<div class="row center-align">
                                
		       		<div class="col s12">
                                    <img src="cart.png" >
		       		</div>
		       	</div>	
		       		       	
		       	<form action="login" method="post">
		       	<div class="row center-align">

		       			 <!-- Username -->
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">person</i>
		       					<input type="text" id="username" class="validate" name="user" placeholder="USERNAME/EMAIL">
		       					
		       				</div>
		       			</div>
		       			
		       			<!-- Password -->
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">https</i>
                                                        <input type="password" id="password" class="validate" name="password"  placeholder="PASSWORD" required>
		       					
		       				</div>
		       			</div>
		       				       			
		       			
		       			<div class="col s12" >
		       				<div class=input-field>	       					
		       					<input type="submit" class="btn submitbtn" value="LOGIN">		       					
		       				</div>
		       			</div>
		       	</div>
		       			       	
		     </form>
		     
		     	<div class="row center-align">
		     	
		     		<p> <a href="signup.jsp" class="white-text">Forgot Password?</a></p>
		     		
		     	</div>		               	         
		       </div>
        	
		</div>	 
	 
	 </div>




<%@ include file="mid.jsp" %>


<script>
	
        $(document).ready(function(){
                M.updateTextFields();
        })
        
</script>

<%@ include file="footer.jsp" %>