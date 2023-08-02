package com.project.CocktailManager.model.dto;

import com.project.CocktailManager.model.User;
import lombok.Data;

/**
 * POJO class of type UserDto which is used for some validations.
 */
@Data
public class UserDto {

    private String userName;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String password;
    private String userType;

    public UserDto(){

    }

    public static UserDto createUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setUserName(user.getUserName());
        userDto.setFirstName(user.getFirstName());
        userDto.setLastName(user.getLastName());
        userDto.setEmailAddress(user.getEmailAddress());
        userDto.setPassword(user.getPassword());
        userDto.setUserType(user.getUserType());
        return userDto;
    }
}