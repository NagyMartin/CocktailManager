<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page errorPage="error.jsp"%>

<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/nightlife-celebration-multi-colored-bar-establishment-generative-ai_188544-12375.jpg?w=826&t=st=1691195301~exp=1691195901~hmac=49cf7ce50b81d0478bd03ec6649ac1a08df0e9bf2fc2593e9af8879248f6ca03');
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
<title>Cocktail Manager - Login</title>
</head>
<body>
    <div id="login">
    <h3 class="text-center text-white pt-5"> </h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form action="getUser.jsp" id="login-form" class="form">
                            <h1 class="text-center text-info">💻 Login</h1>
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
                        <input type="button" value="Return 🔙" onclick="window.location='index.jsp'" class="btn" >
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


</html>