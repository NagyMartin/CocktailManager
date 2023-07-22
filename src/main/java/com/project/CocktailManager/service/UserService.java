package com.project.CocktailManager.service;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.model.dto.UserDto;
import com.project.CocktailManager.repository.JdbcUserRepository;
import lombok.RequiredArgsConstructor;

import java.util.regex.Pattern;
@RequiredArgsConstructor
public class UserService {

    private final JdbcUserRepository jdbcUserRepository;

    public void addUserFromUserService(UserDto userDto){
        if(!validateUserData(userDto)){
            throw new RuntimeException("Invalid data for user: user name was {}, first name was {}," + "" +
                    "last name was {}, email address was {}".formatted(userDto.getUserName(), userDto.getFirstName(),
                            userDto.getLastName(), userDto.getEmailAddress()));
        }
        User user = new User();
        user.setUserName(userDto.getUserName());
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setEmailAddress(userDto.getEmailAddress());
        jdbcUserRepository.addUser(user);
    }

    public boolean validateUserData(UserDto userDto){
        if (userDto.getUserName() != null && userDto.getUserName().length() < 3){
            throw new RuntimeException("User name is incorrect. User name length should be at least 3 characters.");
        }
        String nameValidationPattern = "^[A-Z](?=.{1,29}$)[A-Za-z]*(?:\\h+[A-Z][A-Za-z]*)*$";
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
        return firstNameIsOk && lastNameIsOk && emailIsOk;
    }

}
