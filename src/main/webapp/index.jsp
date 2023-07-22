<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true"%>
<html>
<head>
<title>Cocktail Manager</title>
</head>
<body>
<h1>Log in</h1>>
    <form action ="getUser.jsp">
        <div class ="form-outline mb-4">
            <input type="text" name="id" value="User ID..." onclick="this.value=''"/><br/>
        </div>
    <br/>
    <input type="submit" value="Log in!" class="btn btn-primary btn-block"/>
    </form>
<h2>Add a user</h2>
    <input type="button" value="Add a user, from button!" onclick="window.location='addUser.jsp'" >
<h3>Get all users</h3>
    <input type="button" value="See all users" onclick="window.location='getAllUsers.jsp'" >
</body>
</html>
