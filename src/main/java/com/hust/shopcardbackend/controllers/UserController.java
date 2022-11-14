package com.hust.shopcardbackend.controllers;

import com.hust.shopcardbackend.dto.user.UserLogin;
import com.hust.shopcardbackend.dto.user.UserRegistration;
import com.hust.shopcardbackend.dto.user.UserResponse;
import com.hust.shopcardbackend.dto.user.UserUpdate;
import com.hust.shopcardbackend.exceptions.EmailNotFoundException;
import com.hust.shopcardbackend.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping(value = "/api/v1/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // Chưa check password, chưa tạo pattern password
    @GetMapping(value = "/login")
    public ResponseEntity<?> login(@RequestBody @Valid UserLogin user) {

        UserResponse userLogin;
        try {
            userLogin = userService.login(user.getEmail(), user.getPassword());
        } catch (EmailNotFoundException emailNotFound) {
            return new ResponseEntity<>(emailNotFound.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(userLogin, HttpStatus.OK);
    }


    // Chưa check password, chưa tạo pattern password
    @PostMapping(value = "/register")
    public ResponseEntity<?> register(@RequestBody @Valid UserRegistration user) {

        UserResponse newUser;
        try {
            newUser = userService.addUser(user);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(newUser, HttpStatus.OK);
    }

    // Chưa check password, chưa tạo pattern password
    @DeleteMapping(value = "/delete")
    public ResponseEntity<?> removeUser(@RequestBody UserLogin user) {

        try {
            userService.deleteUser(user.getEmail(), user.getPassword());
        } catch (EmailNotFoundException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    public ResponseEntity<?> updateUser(@PathVariable(value = "id") Integer userId, @RequestBody UserUpdate user) {

        UserResponse userUpdated;

        try {
            userUpdated = userService.updateUser(userId, user);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(userUpdated, HttpStatus.OK);
    }
}
