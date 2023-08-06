<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<style>
.main{
  text-align: center;
  color: white;
}
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/premium-photo/cyberpunk-colorful-bar-pub-painting_708558-202.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.main .table{
 color: white;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cocktail Manager Users</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
<div class="main" style="text-align: center;">
    <%  JdbcUserRepository repository = new JdbcUserRepository();
        int userAdminId = Integer.parseInt(request.getParameter("userId"));
        User admin = repository.getUserByID(userAdminId);
        String adminType = admin.getUserType();
        if(!adminType.equals("ADMIN")){
           throw new RuntimeException("User does not have permission");
        }
    %>
<h1>📋 Users from Cocktail Manager 📋</h1>
<br></br>
    <table border="1" class = "table w-50 p-3" style="margin: 0 auto;text-align:center">
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
                <td><strong>👤<%= user.getUserName() %></strong></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmailAddress() %></td>
                <td><%= user.getUserType() %></td>
                <td>
                <% int id = user.getId(); %>
                <form action ="updateUserForm.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <input type="submit" value="Update user 💾" class="btn btn-secondary">
                  </form>
                <form action ="deleteUser.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <input type="submit" value="Delete user 💣" class="btn btn-danger">
                  </form>
                </td>
                <td>
                <form action ="changeUserType.jsp">
                  <input type="hidden" id="id" name="id" value= <%= id %>>
                  <select id="userType" name="userType">
                      <option value="USER">USER</option>
                      <option value="ADMIN">ADMIN</option>
                  </select>
                  <input type="submit" value="Change type ⏫" class="btn btn-primary">
                  </form>
                </td>
            </tr>
            <% } %>
    </table>
    <br>
    </br>
    <input type="button" value="Main page 🏡" onclick="window.location='index.jsp'" class="btn btn-success">
    <input type="button" value="Back 🔙" class="btn btn-secondary" onclick="history.go(-1)" </button>
</div>
</body>
</html>
