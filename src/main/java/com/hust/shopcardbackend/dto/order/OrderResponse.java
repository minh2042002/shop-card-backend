package com.hust.shopcardbackend.dto.order;

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
public class OrderResponse {

    private Integer orderId;

    private String orderToken;

    @JsonProperty("orderBy")
    @JsonUnwrapped
    private UserDto user;

    @JsonUnwrapped
    private List<OrderDetailDto> orderDetails;

    private String note;
    private Date orderDate;
    private Boolean status;


    @Data
    private static class UserDto {
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

        @JsonProperty("count")
        private Integer countProduct;

        @Data
        private static class ProductDto {
            private Integer productId;
            private String title;
            private Integer price;
            private String imageProduct;
        }
    }


}
