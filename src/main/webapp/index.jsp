<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title>Cocktail Manager</title>
</head>
<body>
<h1>Login</h1>
    <input type="button" value="🔑 Login" onclick="window.location='logIn.jsp'" >
    <input type="button" value="🔐 Admins Login" onclick="window.location='logInAdmin.jsp'"><br/><br/>
<h2>New? Register below!</h2>
    <input type="button" value="📋 Register" onclick="window.location='register.jsp'" >
</body>
</html>
