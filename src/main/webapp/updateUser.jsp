<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cocktail Manager Edit User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = jdbcUserRepository.getUserByID(id);
        %>
<div style="text-align:center">
<h1><strong>👋 Hello there, <%= user.getUserName() %> </strong></h1>
    <br></br>
    <p>-- Complete the below form to update your profile --</p>
    <form action="updateUser.jsp">
        <div class="form-outline mb-4">
            <strong>UserName:</strong><input type="text" name="userName" value="New User Name..." onclick="this.value=''"/><br/>
            <%
             String newUserName = request.getParameter("userName");
             %>
        </div>
        <div class="form-outline mb-4">
            <strong>Email:</strong><input type="text" name="emailAddress"  value="New Email..." onclick="this.value=''"/><br/>
            <%
             String newEmailAddress = request.getParameter("emailAddress");
             %>
        </div>
        <div class="form-outline mb-4">
             <strong>Password:</strong><input type="text" name="password"  value="New password..." onclick="this.value=''"/><br/>
             <%
             String password = request.getParameter("password");
             %>
             </div>
    <br/>
            <input type="submit" value="Update✔️" class="btn btn-outline-success" />
            <%
            try{
                if(newUserName == null || "".equals(newUserName) || newEmailAddress == null ||
                "".equals(newEmailAddress) || password == null || "".equals(password)){
                throw new ServletException("Data entered is empty.");
                }
                User updatedUser = new User(id, newUserName, newEmailAddress, password);
                jdbcUserRepository.updateUser(updatedUser);
                } catch (Exception e){
                  e.printStackTrace();
                }
            %>
    </form>
    <br>
    </br>
    <input type="button" value="Return to main page!🔙" onclick="window.location='index.jsp'" class="btn btn-outline-secondary">
</div>
</body>
</html>