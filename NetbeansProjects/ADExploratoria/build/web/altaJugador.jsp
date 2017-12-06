<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Register Player</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
            <form action="altaJugador" method="post">
                <fieldset>
                    <legend>Register a new player:</legend>
                    Player first name:<br>
                    <input type="text" name="nombre" required><br><hr>
                    Player last name:<br>
                    <input type="text" name="apellidos" required><br><hr>
                    Nationality:<br>
                    <input type="text" name="pais" required><br><hr>
                    Number:<br>
                    <input type="number" name="dorsal" required min="1" max="99"><br><br>
                    Position:<br>
                    <input type="radio" name="posicion" value="porter" checked required> Goalkeeper<br>
                    <input type="radio" name="posicion" value="defensa"> Defender<br>
                    <input type="radio" name="posicion" value="migcampista"> Midfielder<br>
                    <input type="radio" name="posicion" value="davanter"> Striker<br><hr>
                    Left/Right-footed:<br>
                    <input type="radio" name="piernabuena" value="esquerra" checked required> Left-footed<br>
                    <input type="radio" name="piernabuena" value="dreta"> Right-footed<br>
                    <input type="radio" name="piernabuena" value="ambdues"> Both<br><hr>
                    <button type="submit">Register Player</button>
                </fieldset>
            </form>
        <% } %>
    </body>
</html>
