<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TopLeague | Team finder</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
            <form action="buscarEquipo" method="post">
                <fieldset>
                    <legend>Search team:</legend>
                    Team name:<br>
                    <select name="nom_equip">
                    <% String team = (String) session.getAttribute("nom_equip");
                       String[] cmps2 = team.split("/");
                       for(int i = 0; i < cmps2.length; ++i) {
                          out.println("<option value=");
                          out.println('\"' + cmps2[i] + '\"' + '>');
                          out.println(cmps2[i]);
                          out.println("</option>");
                        }
                       out.println("<option value=\"\"></option>");
                    %>
                    </select><br><hr>
                    
                                        
                    League:
                    <select name="liga">
                    <% String c = (String) session.getAttribute("lliga");
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
                    
                    
                    
                    City:
                    <select name="city">
                    <% String o = (String) session.getAttribute("ciutat");
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
                    
                    
                    
                    Country:
                    <select name="pais">
                    <% String p = (String) session.getAttribute("pais");
                       String[] pais = p.split("/");
                       for(int i = 0; i < pais.length; ++i) {
                          out.println("<option value=");
                          out.println('\"' + pais[i] + '\"' + '>');
                          out.println(pais[i]);
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
