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
        <title>TopLeague | Player finder</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
            <form class="form-horizontal" action="buscarJugador" method="post">
                <fieldset>

                <!-- Form Name -->
                <legend style="text-align: center; font-size: 24px">Search Player</legend>

                <!-- Text input-->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="nom">First Name</label>  
                  <div class="col-md-4">
                  <input id="nom" name="nom" type="text" placeholder="First name" class="form-control input-md"> 
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="cognom">Last Name</label>
                  <div class="col-md-4">
                    <select id="cognom" name="cognom" class="form-control">
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
                    </select>
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="nacionalitat">Nationality</label>
                  <div class="col-md-4">
                    <select id="nacionalitat" name="nacionalitat" class="form-control">
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
                    </select>
                  </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                  <label class="col-md-4 control-label" for="posicio">Position</label>
                  <div class="col-md-4">
                    <select id="posicio" name="posicio" class="form-control">
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
