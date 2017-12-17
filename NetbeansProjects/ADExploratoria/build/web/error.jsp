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
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>TopLeague | Error</title>
    </head>
    <body style="padding-top: 70px; background-color: mintcream">
        <div class="container">
            <div class="jumbotron" style="background-color: mintcream">
                <div class="text-center"><i class="fa fa-5x fa-frown-o" style="color:#d9534f;"></i></div>
                    <h1 class="text-center">                        
                        <% String error = (String) session.getAttribute("error"); %>
                            <% if (error.equals("1")) { %>
                             <h1>ERROR: Username does not exist.</h1>
                             <br>
                             <p class="text-center">Try pressing the back button or clicking on this button.</p>
                             <p class="text-center"><a class="btn btn-primary" href="login.jsp"><i class="fa fa-home"></i> Go Home</a></p>
                            <% } %>
                            <% if (error.equals("2")) { %>
                             <h1>ERROR: Incorrect password.</h1>
                             <br>
                             <p class="text-center">Try pressing the back button or clicking on this button.</p>
                             <p class="text-center"><a class="btn btn-primary" href="login.jsp"><i class="fa fa-home"></i> Go Home</a></p>
                            <% } %>
                            <% if (error.equals("3")) { %>
                             <h1>ERROR: Username already exists.</h1>
                             <br>
                             <p class="text-center">Try pressing the back button or clicking on this button.</p>
                             <p class="text-center"><a class="btn btn-primary" href="register.jsp"><i class="fa fa-home"></i> Go Home</a></p>
                            <% } %>
                            <% if (error.equals("4")) { %>
                             <h1>ERROR: Player not registered.</h1>
                             <br>
                             <p class="text-center">Try pressing the back button or clicking on this button.</p>
                             <p class="text-center"><a class="btn btn-primary" href="menu.jsp"><i class="fa fa-home"></i> Go Home</a></p>
                            <% } %>
                            <% if (error.equals("5")) { %>
                             <h1>ERROR: Team not registered.</h1>
                             <br>
                             <<p class="text-center">Try pressing the back button or clicking on this button.</p>
                             <p class="text-center"><a class="btn btn-primary" href="menu.jsp"><i class="fa fa-home"></i> Go Home</a></p>
                            <% } %>                                                                                
            </div>
        </div>
    </body>
</html>
