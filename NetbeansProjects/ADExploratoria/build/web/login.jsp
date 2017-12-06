<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
        <link rel='stylesheet' href='login.css'>
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>TopLeague | Log in</title>
    </head>
   
    <body>
        <% session.invalidate(); %>
        <form action="loginservlet">
        <div class="container">
            <div class="row main">
                <div class="main-login main-center">           
                        <div class="form-group">
                                <label for="username" class="cols-sm-2 control-label">Username</label>
                                <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="username" id="us"  placeholder="Enter your Username" required/><span class="erroruserpass" hidden>ERROR: Username already in use.</span>
                                        </div>
                                </div>
                        </div>

                        <div class="form-group">
                                <label for="password" class="cols-sm-2 control-label">Password</label>
                                <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <input type="password" class="form-control" name="password" id="pw"  placeholder="Enter your Password" required/>
                                        </div>
                                </div>
                        </div>
                                    
                        <div class="form-group">
                            <button type="submit" id="button" class="btn btn-primary btn-lg btn-block login-button" name="button">Log in</button>
                        </div>

                        <div class="form-group">
                             <p class="create">Don't have an account? Create one <a href="register.jsp">here</a>.</p>
                        </div>       
                </div>
            </div>
        </div>
        </form>
    </body>
</html>
