<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Register</title>
    </head>
    <body>
         <form action="registerservlet">
            <fieldset>
              <legend>Welcome! Register here:</legend>
              Username:<br>
              <input type="text" name="username" required><br>
              Password:<br>
              <input type="password" name="password" required><br><br>
              <button type="submit">Register</button>
            </fieldset>
          </form> 
    </body>
</html>
