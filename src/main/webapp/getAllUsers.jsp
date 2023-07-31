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
    <%  JdbcUserRepository repository = new JdbcUserRepository();
        int userAdminId = Integer.parseInt(request.getParameter("userId"));
        User admin = repository.getUserByID(userAdminId);
        String adminType = admin.getUserType();
        if(!adminType.equals("ADMIN")){
           throw new RuntimeException("User does not have permission");
        }
    %>
<h1>📋 Users from Cocktail Manager 📋</h1>
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
            <th>Change User Type</th>
        </tr>
        <%  List<User> users = repository.getAllUsers();
            for (User user: users){
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td>👤<%= user.getUserName() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmailAddress() %></td>
                <td><%= user.getUserType() %></td>
                <td>
                <% int id = user.getId(); %>
                <form action ="updateUser.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <input type="submit" value="Update user 💾" >
                  </form>
                <form action ="deleteUser.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <input type="submit" value="Delete user 💣" >
                  </form>
                </td>
                <td>
                <form action ="changeUserType.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <select id="userType" name="userType">
                      <option value="USER">USER</option>
                      <option value="ADMIN">ADMIN</option>
                  </select>
                  <input type="submit" value="Change type ⏫" >
                  </form>
                </td>
            </tr>
            <% } %>
    </table>
    <br>
    </br>
    <input type="button" value="Return to main page 🔙" onclick="window.location='index.jsp'">
</body>
</html>
