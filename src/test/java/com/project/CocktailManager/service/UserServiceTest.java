package com.project.CocktailManager.service;

import com.project.CocktailManager.model.User;
import com.project.CocktailManager.model.dto.UserDto;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test class for methods from the UserService class.
 */
class UserServiceTest {
    UserService service = new UserService();
    UserDto userDto = new UserDto();
    @Test
    void validateCorrectUserDataHappyFlow(){
        User user = new User("User", "John","Doe",
                "johndoe@yahoo.com","Pa$$word1","USER");
        userDto = UserDto.createUserDto(user);
        assertFalse(service.validateUserData(userDto));
    }
    @Test
    void validateNullUserData(){
        userDto = null;
        assertThrows(RuntimeException.class, () -> {service.validateUserData(userDto);},
                "User name is incorrect. User name length should be at least 3 characters.");
    }
    @Test
    void validateIncorrectUserData(){
        User user = new User("Us", "Jo","Do",
                "jhndyahoo.com","aword","USE");
        userDto = UserDto.createUserDto(user);
        assertThrows(RuntimeException.class, () -> {service.validateUserData(userDto);});
    }
    @Test
    void validateCorrectAdminUserType(){
        User user = new User("User", "John","Doe",
                "johndoe@yahoo.com","Pa$$word1","ADMIN");
        assertTrue(service.validateUserType(user));
    }
    @Test
    void validateIncorrectAdminUserType(){
        User user = new User("User", "John","Doe",
                "johndoe@yahoo.com","Pa$$word1","USER");
        assertThrows(RuntimeException.class, () -> {service.validateUserType(user);});
    }
}