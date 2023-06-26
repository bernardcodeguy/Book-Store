<%@page import="controller.ConnectionManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 



<html> 
<head> 
<title>MySql Connection</title> 
</head> 
<body>
<h1>Connection Status </h1>
	<% 
	try {	
	
	Connection connection = null; 
	
	
	
	connection = ConnectionManager.getConnection();
	
	if(!connection.isClosed())
	%>
	<font size="+3" color="yellow"></b>
	<% 
	out.println("Connection Success");
	connection.close();
	}
	catch(Exception ex){
	%>
    </font>
    <font size="+3" color="red"></b>
	<%
	out.println("Connection Failed");
	}
	%>
    </font>
</body> 
</html>