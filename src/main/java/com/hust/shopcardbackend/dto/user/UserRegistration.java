package com.hust.shopcardbackend.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegistration {

    @NotBlank(message = "Full name is empty!")
    private String fullName;

    @NotBlank(message = "Email is empty!")
    @Pattern(regexp = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$")
    private String email;


    @NotBlank(message = "Password is empty!")
    private String password;

    @NotBlank(message = "Phone is empty!")
    @Pattern(regexp = "^\\d{10}$", message = "Phone must be 10 numbers")
    private String phone;

    @NotBlank(message = "Address is empty!")
    private String address;

    private String avatarLink;

    @NotBlank(message = "Role is empty!")
    private String role;
}
