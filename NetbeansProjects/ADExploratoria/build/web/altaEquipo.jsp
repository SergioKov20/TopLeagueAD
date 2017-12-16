<%-- 
    Document   : altaEquipo
    Created on : 06-dic-2017, 18:19:54
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
        <title>TopLeague | Register Team</title>
    </head>
    <body>
        <% if (session.getAttribute("user") == null) { %>
            <% response.sendRedirect("login.jsp"); %>
        <% } else {%>
            <% out.print("Logged in as: " + session.getAttribute("user") + '.'); %>
            <br><br>
                <div>
<form class="form-horizontal" action="altaEquipo" method="post">
    <fieldset>

        <!-- Form Name -->
        <legend style="text-align: center; font-size: 24px">Register Team</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="name">Team Name</label>  
          <div class="col-md-4">
          <input id="name" name="teamname" type="text" placeholder="Team Name" class="form-control input-md" required> 
          </div>
        </div>
             
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="city">Three-Letter Code</label>  
          <div class="col-md-4">
          <input id="city" name="abreviatura" type="text" placeholder="(Example: FCB)" minlength="3" maxlength="3" class="form-control input-md" required>
    
          </div>
        </div>
        
        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="city">League</label>  
          <div class="col-md-4">
          <input id="city" name="lliga" type="text" placeholder="League" class="form-control input-md" required>
    
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="city">City</label>  
          <div class="col-md-4">
          <input id="city" name="ciutat" type="text" placeholder="City" class="form-control input-md" required>
    
          </div>
        </div>
        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="city">Country</label>  
          <div class="col-md-4">
          <input id="city" name="pais" type="text" placeholder="Country" class="form-control input-md" required>
    
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
