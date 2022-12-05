package com.hust.shopcardbackend.dto.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import lombok.Data;

import java.util.Date;
import java.util.List;

public class OrderRequest {

    @JsonProperty("orderBy")
    @JsonUnwrapped
    private UserDto user;

    private String note;
    private Date orderDate;
    private Boolean status;

    @JsonUnwrapped
    private List<OrderDetailDto> orderDetails;

    @Data
    private static class UserDto {
        private String fullName;
        private String email;
        private String phone;
        private String address;

    }

    @Data
    private static class OrderDetailDto {

        @JsonUnwrapped
        private ProductDto product;

        @JsonProperty("count")
        private Integer countProduct;

        @Data
        private static class ProductDto {
            private String title;
            private Integer salePrice;

        }
    }
}
