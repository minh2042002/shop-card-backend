package com.hust.shopcardbackend.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class UserLogin {

    @NotBlank(message = "Email is empty!")
    private String email;

    @NotBlank(message = "Password is empty!")
    private String password;
}
