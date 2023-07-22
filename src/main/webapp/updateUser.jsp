<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repository.JdbcUserRepository" %>
<%@ page session="true"%>
<html>
<head>
<title>Cocktail Manager Edit User</title>
</head>
<body>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = (Integer)session.getAttribute("id");
        User user = jdbcUserRepository.getUser(id);
        %>
<h1> Hello there, <%= user.getUserName() %> </h1>
    <p>Complete the below form to update the user</p>
    <form action="updateUser.jsp">
        <div class="form-outline mb-4">
            <input type="text" name="userName" value="Change User Name to..." onclick="this.value=''"/><br/>
            <%
             String newUserName = request.getParameter("userName");
             %>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="emailAddress"  value="Change Email to..." onclick="this.value=''"/><br/>
            <%
             String newEmailAddress = request.getParameter("emailAddress");
             %>
        </div>
    <br/>
            <input type="submit" value="Update user" class="btn btn-primary btn-block"/>
            <%
            User updatedUser = new User(id, newUserName, newEmailAddress);
            jdbcUserRepository.updateUser(updatedUser);
            %>
    </form>
    <br>
    </br>
    <input type="button" value="Click here to return to main page!" onclick="window.location='index.jsp'">
</body>
</html>