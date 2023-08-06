<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User, com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page session="true"%>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<style>
body {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/premium-photo/brick-wall-subway-facade-night_360032-798.jpg?size=626&ext=jpg&ga=GA1.2.124570723.1691114028&semt=ais');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.main{
  text-align: center;
  color: white;
}
</style>
</head>
<body>
<script> alert("User is deleted!") </script>
        <%
        JdbcUserRepository jdbcUserRepository = new JdbcUserRepository();
        int id = Integer.parseInt(request.getParameter("id"));
                try{
                jdbcUserRepository.deleteUser(id);
                } catch (Exception e){
                        e.printStackTrace();
                }
        %>
        <div class="main">
        <input type="button" value="RETURN" onclick="history.go(-2)" </button>
        </div>
</body>
</html>
