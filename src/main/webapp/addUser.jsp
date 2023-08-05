<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.project.CocktailManager.model.User, com.project.CocktailManager.repositoryDao.JdbcUserRepository" %>
<%@ page import="com.project.CocktailManager.model.dto.UserDto" %>
<%@ page import="com.project.CocktailManager.service.UserService" %>
<%@ page errorPage="error.jsp"%>
<html>
<head>
<title>Cocktail Manager New User</title>
</head>
<body>
        <script> alert("User created!") </script>
       <%
         String userName = request.getParameter("userName");
         String firstName = request.getParameter("firstName");
         String lastName = request.getParameter("lastName");
         String emailAddress = request.getParameter("emailAddress");
         String userType = "USER";
         String password = request.getParameter("password");
         String rePassword = request.getParameter("rePassword");
         if(userName == null || "".equals(userName) || firstName == null || "".equals(firstName) ||
            lastName == null || "".equals(lastName) || emailAddress == null || "".equals(emailAddress) ||
            password == null || "".equals(password)){
                    throw new ServletException("Data entered is empty");
         }
         if(password != rePassword){
            throw new RuntimeException("Password does not match");
         }
         User user = new User(userName, firstName, lastName, emailAddress, password, userType);
         UserDto userDto = new UserDto();
         userDto = userDto.createUserDto(user);
         UserService service = new UserService();
         service.addUserFromUserService(userDto);
       %>
       <input type="button" style="text-align: center;" value="Return" onclick="window.location='index.jsp'" </button>
</body>
</html>
