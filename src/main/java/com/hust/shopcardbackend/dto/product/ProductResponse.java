package com.hust.shopcardbackend.dto.product;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductResponse {

    private String title;
    private Float salePrice;
    private String description;
    private String category;

    @JsonProperty("images")
    private List<String> images;

    public ProductResponse(String title, Float salePrice, String description, String category, List<String> images) {
        this.title = title;
        this.salePrice = salePrice;
        this.description = description;
        this.category = category;
        this.images = new ArrayList<>();
    }
}
