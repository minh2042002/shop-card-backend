package com.hust.shopcardbackend.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {

    private Integer orderId;

    @JsonProperty("orderBy")
    @JsonUnwrapped
    private UserDto user;

    private String note;
    private Date orderDate;
    private Boolean status;

    @JsonProperty("productList")
    @JsonUnwrapped
    private List<OrderDetailDto> orderDetails;

    @Data
    private static class UserDto {
        private Integer userId;
        private String fullName;
        private String email;
        private String phone;
        private String address;

    }

    @Data
    private static class OrderDetailDto {

        private Integer orderDetailId;

        @JsonUnwrapped
        private ProductDto product;

        @Data
        private static class ProductDto {
            private Integer productId;
            private String title;
            private Integer price;

            @JsonUnwrapped
            @JsonProperty("image")
            private ImageProductDto imageProduct;

            @Data
            private static class ImageProductDto {
                private String imageLink;
            }
        }

        @JsonProperty("count")
        @JsonUnwrapped
        private Integer countProduct;
    }


}
