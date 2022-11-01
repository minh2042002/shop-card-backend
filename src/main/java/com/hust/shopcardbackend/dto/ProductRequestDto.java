package com.hust.shopcardbackend.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductRequestDto {

    private Integer productId;
    private String title;
    private Integer price;
    private Float discount;
    private String description;

    @JsonUnwrapped
    private Category category;

    @JsonProperty("images")
    @JsonUnwrapped
    private List<ImageProduct> imageProducts;

    @Data
    private static class Category {
        private String name;
    }

    @Data
    private static class ImageProduct {
        private String imageLink;
    }

}
