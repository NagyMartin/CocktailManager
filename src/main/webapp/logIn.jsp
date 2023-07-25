<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<%@ page import = "java.io.*,java.util.*" %>

<html>
<head>
<title>Cocktail Manager - Login</title>
</head>
<body>
<h1>Login</h1>
    <form action="getUser.jsp">
    User ID:<input type="text" name="id"/><br/><br/>
    Password:<input type="password" name="password"/><br/><br/>
    <input type="submit" value="Log in!" class="btn btn-primary btn-block"/>
    </form>
</body>


</html>