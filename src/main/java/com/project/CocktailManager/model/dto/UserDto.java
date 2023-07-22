package com.project.CocktailManager.model.dto;

import com.project.CocktailManager.model.User;
import lombok.Data;

@Data
public class UserDto {

    private String userName;
    private String firstName;
    private String lastName;
    private String emailAddress;

    public UserDto(){

    }
    public static UserDto createUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setUserName(user.getUserName());
        userDto.setFirstName(user.getFirstName());
        userDto.setLastName(user.getLastName());
        userDto.setEmailAddress(user.getEmailAddress());
        return userDto;
    }
}
