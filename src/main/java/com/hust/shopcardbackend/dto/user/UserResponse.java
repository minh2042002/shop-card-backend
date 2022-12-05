package com.hust.shopcardbackend.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserResponse {

    private Integer userID;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String avatarLink;

}
