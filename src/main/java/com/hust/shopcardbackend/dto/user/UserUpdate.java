package com.hust.shopcardbackend.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserUpdate {

    @NotBlank(message = "Full name is empty!")
    private String fullName;

    @NotBlank(message = "Phone is empty!")
    private String phone;

    @NotBlank(message = "Address is empty!")
    private String address;

    private String avatarLink;
}
