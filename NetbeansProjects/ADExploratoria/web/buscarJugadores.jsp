<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Player finder</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
            <form action="buscarJugador" method="post">
                <fieldset>
                    <legend>Search player:</legend>
                    First Name:<br>
                    <input type="text" name="nom"><br><hr>
                    
                                        
                    Last Name:
                    <select name="cognom">
                    <% String c = (String) session.getAttribute("cognom");
                       String[] cmps = c.split("/");
                       for(int i = 0; i < cmps.length; ++i) {
                          out.println("<option value=");
                          out.println('\"' + cmps[i] + '\"' + '>');
                          out.println(cmps[i]);
                          out.println("</option>");
                        }
                       out.println("<option value=\"\"></option>");
                    %>
                    </select><br><hr>
                    
                    
                    
                    Nationality:
                    <select name="nacionalitat">
                    <% String o = (String) session.getAttribute("nacionalitat");
                       String[] origenes = o.split("/");
                       for(int i = 0; i < origenes.length; ++i) {
                          out.println("<option value=");
                          out.println('\"' + origenes[i] + '\"' + '>');
                          out.println(origenes[i]);
                          out.println("</option>");
                        }
                       out.println("<option value=\"\"></option>");
                    %>    
                    </select><br><hr>
                    
                    
                    
                    Position:
                    <select name="posicio">
                    <% String pos = (String) session.getAttribute("posicio");
                       String[] posit = pos.split("/");
                       for(int i = 0; i < posit.length; ++i) {
                          out.println("<option value=");
                          out.println('\"' + posit[i] + '\"' + '>');
                          out.println(posit[i]);
                          out.println("</option>");
                        }
                       out.println("<option value=\"\"></option>");
                    %>
                    </select><br><br>
                    <button type="submit">Search</button>
                </fieldset>
            </form>
        <% } %>
    </body>
</html>
