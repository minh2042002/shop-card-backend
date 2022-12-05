package com.hust.shopcardbackend.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserUpdateRequest {

    @NotBlank(message = "Full name is empty!")
    private String fullName;

    @NotBlank(message = "Email is empty!")
    @Pattern(regexp = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$")
    private String email;

    @NotBlank(message = "Phone is empty!")
    private String phone;

    @NotBlank(message = "Address is empty!")
    private String address;

    private String avatarLink;
}
