package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.user.UserRegistration;
import com.hust.shopcardbackend.dto.user.UserResponse;
import com.hust.shopcardbackend.dto.user.UserUpdateRequest;
import com.hust.shopcardbackend.config.exceptions.EmailNotFoundException;

public interface IUserService {
    abstract UserResponse addUser(UserRegistration user) throws Exception;

    abstract UserResponse updateUser(UserUpdateRequest user) throws EmailNotFoundException;

    abstract UserResponse login(String email, String password) throws EmailNotFoundException;

    abstract void deleteUser(String email, String password) throws EmailNotFoundException;
}
