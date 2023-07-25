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
        if(id == 0 || "".equals(id)){
           throw new ServletException("User ID does not exist.");
        }
        User user = jdbcUserRepository.getUserByID(id);
        %>
<h1> Hello there, <%= user.getUserName() %> </h1>
    <p>Complete the below form to update your profile</p>
    <form action="updateUser.jsp">
        <div class="form-outline mb-4">
            <input type="text" name="userName" value="New User Name..." onclick="this.value=''"/><br/>
            <%
             String newUserName = request.getParameter("userName");
             %>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="emailAddress"  value="New Email..." onclick="this.value=''"/><br/>
            <%
             String newEmailAddress = request.getParameter("emailAddress");
             %>
        </div>
        <div class="form-outline mb-4">
             <input type="text" name="password"  value="New password..." onclick="this.value=''"/><br/>
             <%
             String password = request.getParameter("password");
             %>
             </div>
    <br/>
            <input type="submit" value="Update" class="btn btn-primary btn-block"/>
            <%
            if(newUserName == null || "".equals(newUserName) || newEmailAddress == null ||
            "".equals(newEmailAddress) || password == null || "".equals(password)){
                throw new ServletException("Data entered is empty.");
            }
            User updatedUser = new User(id, newUserName, newEmailAddress, password);
            jdbcUserRepository.updateUser(updatedUser);
            %>
    </form>
    <br>
    </br>
    <input type="button" value="Click here to return to main page!" onclick="window.location='index.jsp'">
</body>
</html>