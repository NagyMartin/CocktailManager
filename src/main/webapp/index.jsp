<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/cocktail-glass-with-colorful-fruity-drink-bar-generative-ai_188544-12378.jpg?w=826&t=st=1691114418~exp=1691115018~hmac=be0a2bd129c5b2ea75aec9274b1899ceeae7506e669e38d9c816ee84ee36db9a');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.container {
  max-width: 500px;
  margin: auto;
  padding: 10px;
}
.container .btn:hover {
  background-color: orange;
  color: white;
}
</style>
<title>Cocktail Manager</title>
</head>
<body >
          <div id="login">
          <h3 class="text-center text-white pt-5"> </h3>
              <div class="container">
                  <div id="login-row" class="row justify-content-center align-items-center">
                      <div id="login-column" class="col-md-6">
                          <div id="login-box" class="col-md-12">
                              <form id="login-form" class="form">
                                  <h1 class="text-center text-info"><strong>💻 Login</strong></h1>
                                  <br></br>
                                  <div class="form-group">
                                      <input type="button" value="🔑 Login" onclick="window.location='logIn.jsp'" class="btn">
                                  </div>
                              </form>
                              <form id="login-form" class="form">
                                  <div class="form-group">
                                      <input type="button" value="🔐 Admins Login" onclick="window.location='logInAdmin.jsp'" class="btn"><br/><br/>
                                  </div>
                              </form>
                                  <div class="form-group">
                                  <h3 style="color: white">New? Register below!</h3>
                                      <input type="button" value="📋 Register" onclick="window.location='register.jsp'" class="btn">
                                  </div>
                                  <p><a href="https://www.thecocktailservice.co.uk/cocktail-bar-equipment-for-beginners/" target="_blank" style="color: white"><strong>Cocktail Bar Equipment</strong></a></p>
                                  <p><a href="https://www.webstaurantstore.com/blog/2888/types-of-cocktail-glasses.html" target="_blank" style="color: white"><strong>Cocktail Glassware</strong></a></p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
</body>
</html>
