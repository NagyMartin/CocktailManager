<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page errorPage="error.jsp"%>


<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/fresh-cocktails-wooden-table-with-leafs-generative-ai_188544-12374.jpg?w=826&t=st=1691196534~exp=1691197134~hmac=ef402351e301fe10b0ae7754c9b9b3cacc93c77d614aa5b0e23f25a796c2862a');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.container .btn:hover {
  background-color: orange;
  color: white;
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Cocktail Manager - Admin Login</title>
</head>
<body>
    <div id="login">
        <h3 class="text-center text-white pt-5"> </h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form action="getAdmin.jsp" id="login-form" class="form">
                            <h1 class="text-center text-info">💻 Login Admin</h1>
                            <div class="form-group">
                                <label for="userName" class="text-info"><strong>Username:</strong></label><br>
                                <input type="text" name="userName" id="userName" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info"><strong>Password:</strong></label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                            <input type="submit" value="🔑 Login" class="btn"/>
                            </div>
                        </form>
                        <input type="button" value="Return 🔙" onclick="window.location='index.jsp'" class="btn">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</body>


</html>