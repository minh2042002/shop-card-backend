package com.hust.shopcardbackend.dto.product;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductResponseAdmin {
    private String title;
    private Integer price;
    private Float discount;
    private String description;
    private String category;

    @JsonProperty("created")
    private Date createdTime;

    @JsonProperty("update")
    private Date updateTime;
    @JsonProperty("images")
    private List<String> images;

    public ProductResponseAdmin(String title, Integer price, Float discount, String description, String category, Date createdTime, Date updateTime, List<String> images) {
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.description = description;
        this.category = category;
        this.createdTime = createdTime;
        this.updateTime = updateTime;
        this.images = new ArrayList<>();
    }
}
