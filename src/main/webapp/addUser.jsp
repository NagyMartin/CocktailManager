<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User, com.project.CocktailManager.repository.JdbcUserRepository" %>
<html>
<head>
<title>Cocktail Manager New User</title>
</head>
<body>
    <h1>Complete the below form create a profile!</h1>
    <form action="addUser.jsp">
        <div class="form-outline mb-4">
            <input type="text" name="userName" value="User Name..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="firstName"  value="First Name..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="lastName"  value="Last Name..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="emailAddress"  value="Email..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="password"  value="Password..." onclick="this.value=''"/><br/>
            </div>
        <br/>
        <input type="submit" value="Create profile" class="btn btn-primary btn-block"/>
    </form>
    <input type="button" value="Click here to return to main page!" onclick="window.location='index.jsp'">
</body>
</html>
<%
  String userName = request.getParameter("userName");
  String firstName = request.getParameter("firstName");
  String lastName = request.getParameter("lastName");
  String emailAddress = request.getParameter("emailAddress");
  String password = request.getParameter("password");

  User user = new User(userName, firstName, lastName, emailAddress, password);

  JdbcUserRepository repository = new JdbcUserRepository();

  repository.addUser(user);

%>