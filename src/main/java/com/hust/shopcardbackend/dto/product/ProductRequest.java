package com.hust.shopcardbackend.dto.product;

import com.fasterxml.jackson.annotation.JsonUnwrapped;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductRequest {


    private String title;
    private Integer price;
    private Float discount;
    private String description;
    private String category;

    @JsonUnwrapped
    private List<ImageProduct> images;

    @Data
    public static class ImageProduct {
        String url;
    }
}
