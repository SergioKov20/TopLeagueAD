<%-- 
    Document   : menu
    Created on : 06-dic-2017, 15:38:37
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel='stylesheet' href='menu.css'>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>TopLeague | Menu</title>
    </head>
    <body>
        
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
        <div style="text-align: center; font-size: 24px; font-family: Roboto; font-style: bold;">
            <% out.print("Welcome, " + session.getAttribute("user") + '!'); %>
            </div><br><br>
            
            
            <div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-3" col-xs-4 col-xs-offset-2" id="main">
            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
            <div id="sidebar" class="well sidebar-nav">
                <h5><i class="glyphicon glyphicon-home"></i>
                    <small><b>MENÚ</b></small>
                </h5>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="altaJugador.jsp">Register Player</a></li>
                    <li><a href="busquedaJugador.jsp">Search Player</a></li>
                    <li><a href="altaEquipo.jsp">Register Team</a></li>
                    <li><a href="busquedaEquipo.jsp">Search Team</a></li>
                </ul>
                <h5><i class="glyphicon glyphicon-user"></i>
                    <small><b>USER</b></small>
                </h5>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="login.jsp">Log out</a></li>
                    <!--Faltaria tancar la sessió-->
                </ul>
            </div>
        </div>
    </div>
</div>
        <% } %>
    </body>
</html>
