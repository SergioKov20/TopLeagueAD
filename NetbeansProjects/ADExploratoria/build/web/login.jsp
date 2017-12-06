<%-- 
    Document   : login
    Created on : 19-sep-2017, 16:11:32
    Author     : 1184521
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Log in</title>
    </head>
    <body>
        <% session.invalidate(); %>
         <form action="/ADExploratoria/loginservlet">
            <fieldset>
              <legend>Please, Log In:</legend>
              Username:<br>
              <input type="text" name="username" required><br>
              Password:<br>
              <input type="password" name="password" required><br><br>
              <button type="submit">Log In</button>
              <a href="/register.jsp">Click here to register.</a>
            </fieldset>
          </form> 
    </body>
</html>
