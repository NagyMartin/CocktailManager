<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page errorPage="error.jsp"%>


<html>
<head>
<title>Cocktail Manager - Admin Login</title>
</head>
<body>
<h1>Login</h1>
    <form action="getAdmin.jsp">
    <strong>User ID:</strong><input type="text" name="id"/><br/><br/>
    <strong>Password:</strong><input type="password" name="password"/><br/><br/>
    <input type="submit" value="Log in!" class="btn btn-primary btn-block"/>
    </form>
    <input type="button" value="Return to main page!" onclick="window.location='index.jsp'">
</body>


</html>