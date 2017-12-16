<%-- 
    Document   : altaJugador
    Created on : 06-dic-2017, 15:39:16
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
        <title>TopLeague | Register Player</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
                <div>
<form class="form-horizontal" action="altaJugador" method="post">
    <fieldset>

        <!-- Form Name -->
        <legend style="text-align: center; font-size: 24px">Register Player</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="name">Player</label>  
          <div class="col-md-4">
          <input id="name" name="nombre" type="text" placeholder="First Name" class="form-control input-md" pattern=".{2,}" required title="2 characters minimum"> 
          </div>
        </div>
        
        <div class="form-group">
            <label class="col-md-4 control-label" for="name"></label>
          <div class="col-md-4">
          <input id="name" name="apellidos" type="text" placeholder="Last Name" min="3" class="form-control input-md" pattern=".{3,}" required title="3 characters minimum"> 
          </div>
        </div>

        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="city">Nationality</label>  
          <div class="col-md-4">
          <input id="city" name="pais" type="text" placeholder="Nationality" class="form-control input-md" pattern=".{3,}" required title="3 characters minimum">
    
          </div>
        </div>

        <div class="form-group">
          <label class="col-md-4 control-label" for="number">Number</label>  
          <div class="col-md-4">
          <input id="number" name="dorsal" type="number" placeholder="Number" min="1" max="99" class="form-control input-md" required title="Introduce a number">
    
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label" for="posicion">Choose Position</label>
          <div class="col-md-4">
            <select id="selectbasic" name="posicion" class="form-control">
		        <option value="goalkeeper">Goalkeeper</option>
		        <option value="defender">Defense</option>
		        <option value="midfielder">Midfielder</option>
		        <option value="striker">Striker</option>	
            </select>
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-4 control-label" for="Left/Right-footed">Left/Right-footed</label>
          <div class="col-md-4">
            <select id="selectbasic" name="piernabuena" class="form-control">
		        <option value="right">Right-footed</option>
                        <option value="left">Left-footed</option>		        
                        <option value="both">Both</option>	
            </select>
          </div>
        </div>

        <!-- Button (Double) -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="save"></label>
          <div class="col-md-8">
            <button id="save" name="save" type="submit" class="btn btn-success">Save</button>
            <button id="cancel" name="cancel" type="button" class="btn btn-danger" onclick="if (confirm('Are you sure you want to discard the changes?')) {  window.location.href = 'menu.jsp'; } else { return false; }">Cancel</button>
          </div>
        </div>
        </fieldset>
        </form>
</div>
           
        <% } %>
    </body> 
</html>