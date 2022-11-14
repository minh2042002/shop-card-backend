package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.user.UserRegistration;
import com.hust.shopcardbackend.dto.user.UserResponse;
import com.hust.shopcardbackend.dto.user.UserUpdate;
import com.hust.shopcardbackend.exceptions.EmailNotFoundException;

public interface IUserService {
    abstract UserResponse addUser(UserRegistration user) throws Exception;

    abstract UserResponse updateUser(Integer userId, UserUpdate user) throws EmailNotFoundException;

    abstract UserResponse login(String email, String password) throws EmailNotFoundException;

    abstract void deleteUser(String email, String password) throws EmailNotFoundException;
}
