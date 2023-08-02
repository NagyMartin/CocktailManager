package com.project.CocktailManager.service;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.model.dto.UserDto;
import com.project.CocktailManager.repositoryDao.JdbcUserRepository;
import lombok.Data;

import java.util.regex.Pattern;

/**
 * Class that has methods to validate a User input, in order to add a correct
 * User type witch correct fields.
 * If not correct the methods throw RuntimeExceptions to avoid the collapse of the app.
 */
@Data
public class UserService {

    private JdbcUserRepository jdbcUserRepository;

    public UserService(){

    }

    public boolean validateUserData(UserDto userDto){
        if (userDto.getUserName() != null && userDto.getUserName().length() < 3){
            throw new RuntimeException("User name is incorrect. User name length should be at least 3 characters.");
        }
        String nameValidationPattern = "^[A-Z](?=.{3,29}$)[A-Za-z]*(?:\\h+[A-Z][A-Za-z]*)*$";
        boolean firstNameIsOk = userDto.getFirstName() != null && Pattern.compile(nameValidationPattern)
                .matcher(userDto.getFirstName())
                .matches();
        boolean lastNameIsOk = userDto.getLastName() != null && Pattern.compile(nameValidationPattern)
                .matcher(userDto.getLastName())
                .matches();
        String emailValidationPattern = "^(.+)@(.+)$";
        boolean emailIsOk = userDto.getEmailAddress() != null && Pattern.compile(emailValidationPattern)
                .matcher(userDto.getEmailAddress())
                .matches();
        String passwordValidationPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\S+$).{5,20}$";
        boolean passwordIsOk = userDto.getPassword() != null && Pattern.compile(passwordValidationPattern)
                .matcher(userDto.getPassword())
                .matches();
        return firstNameIsOk && lastNameIsOk && emailIsOk && passwordIsOk;
    }

    public boolean validateUserType(User user) {
        String validUserType = "ADMIN";
        String userType = user.getUserType();
        if (!userType.equals(validUserType)) {
            throw new RuntimeException("User is not an " + validUserType);
        }
        return true;
    }

    public void addUserFromUserService(UserDto userDto){
        if(!validateUserData(userDto)){
            throw new RuntimeException("Invalid data for user: user name was " + userDto.getUserName() + ", first name was " + userDto.getFirstName() +
                    " ,last name was " + userDto.getLastName() + " email was " + userDto.getEmailAddress() + " ,password was " + userDto.getPassword());
        }
        User user = new User();
        user.setUserName(userDto.getUserName());
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setEmailAddress(userDto.getEmailAddress());
        user.setPassword(userDto.getPassword());
        user.setUserType(userDto.getUserType());
        jdbcUserRepository.addUser(user);
    }

}
