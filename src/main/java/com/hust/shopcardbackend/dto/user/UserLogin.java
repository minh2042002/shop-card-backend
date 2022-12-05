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
//    @Pattern(regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
//            message = """
//                    Password:
//                    - must be 8 characters
//                    - at least one uppercase character
//                    - include both numbers and letters
//                    - at least one special character
//                    """)
    private String password;
}
