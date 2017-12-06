<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Menu</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Welcome, " + session.getAttribute("user") + '!'); %>
            <br><br>
            <fieldset>
                <legend>Select an option to manage:</legend>
                <a href="altaJugador.jsp">Register player</a><br>
                <a href="detectarJugadores">Search player</a><br>
                <a href="altaEquipo.jsp">Register team</a><br>
                <a href="detectarEquipos">Search team</a><br>
            </fieldset><br>
            <a href="login.jsp">Log out</a>
        <% } %>
    </body>
</html>
