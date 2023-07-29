<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title>Cocktail Manager Users</title>
</head>
<body>
<h1>Users from Cocktail Manager</h1>
    <table border="1" class = "table table-striped table-hover w-50 p-3">
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Password</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email Address</th>
            <th>User Type</th>
            <th>Account Operations</th>
        </tr>
        <% JdbcUserRepository repository = new JdbcUserRepository();
            List<User> users = repository.getAllUsers();
            for (User user: users){
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getUserName() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmailAddress() %></td>
                <td><%= user.getUserType() %></td>
                <td>
                <% Integer id = user.getId(); %>
                <input type="button" name ="id" value="Edit user" onclick="window.location='updateUser.jsp'"
                <% session.setAttribute("id", id); %> >
                <input type="button" name ="id" value="Delete user" onclick="window.location='deleteUser.jsp'"
                <% session.setAttribute("id", id); %> >
                </td>
            </tr>
            <% } %>
    </table>
    <br>
    </br>
    <input type="button" value="Return to main page!" onclick="window.location='index.jsp'">
</body>
</html>
