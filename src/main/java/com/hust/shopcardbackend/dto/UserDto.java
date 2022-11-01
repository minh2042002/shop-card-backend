package com.hust.shopcardbackend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

    private Integer userId;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String avatarLink;
}
