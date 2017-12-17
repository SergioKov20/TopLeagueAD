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
        <title>TopLeague | Team finder</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
            <form class="form-horizontal" action="buscarEquipo" method="post">
                <fieldset>

                <!-- Form Name -->
                <legend style="text-align: center; font-size: 24px">Search Team</legend>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="nom_equip">Team Name</label>  
                  <div class="col-md-4">
                      <select id="nom_equip" name="nom_equip" class="form-control">
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
                      </select>
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="liga">League</label>
                  <div class="col-md-4">
                    <select id="liga" name="liga" class="form-control">
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
                    </select>
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="city">City</label>
                  <div class="col-md-4">
                    <select id="city" name="city" class="form-control">
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
                    </select>
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="pais">Country</label>
                  <div class="col-md-4">
                    <select id="pais" name="pais" class="form-control">
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
                    </select>
                  </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="submit"></label>
                  <div class="col-md-4">
                      <button id="submit" type="submit" name="submit" class="btn btn-primary">Search</button>
                  </div>
                </div>
                </fieldset>                 
            </form>
        <% } %>
    </body>
</html>
