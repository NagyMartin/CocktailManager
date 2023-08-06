<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User" %>
<%@ page import="com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/barman-preparing-alcoholic-cocktail-multicolored-neon-light-focus-glass_155003-42954.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.main{
  text-align: center;
  color: white;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cocktail Manager Edit User</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
</head>
<body>
        <script> alert("User is updated!") </script>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = jdbcUserRepository.getUserByID(id);
        String newUserName = request.getParameter("userName");
        String newEmailAddress = request.getParameter("emailAddress");
        String password = request.getParameter("password");
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

        <meta http-equiv="Refresh" content="0; url=/CocktailManager/index.jsp" />
</body>
</html>