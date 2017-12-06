<%-- 
    Document   : error
    Created on : 06-dic-2017, 15:41:14
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Error</title>
    </head>
    <body>
        <% String error = (String) session.getAttribute("error"); %>
        <% if (error.equals("1")) { %>
         <h1>ERROR: Username does not exist.</h1>
         <br>
         <a href="login.jsp">Back</a>
        <% } %>
        <% if (error.equals("2")) { %>
         <h1>ERROR: Incorrect password.</h1>
         <br>
         <a href="login.jsp">Back</a>
        <% } %>
        <% if (error.equals("3")) { %>
         <h1>ERROR: Username already exists.</h1>
         <br>
         <a href="register.jsp">Back</a>
        <% } %>
        <% if (error.equals("4")) { %>
         <h1>ERROR: Player not registered.</h1>
         <br>
         <a href="menu.jsp">Back</a>
        <% } %>
        <% if (error.equals("5")) { %>
         <h1>ERROR: Team not registered.</h1>
         <br>
         <a href="menu.jsp">Back</a>
        <% } %>
        
        
        
    </body>
</html>
