package com.hust.shopcardbackend.dto.category;

import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.entities.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryResponse {

    private Integer categoryId;
    private String name;

    @JsonUnwrapped
    private List<ProductDto> products;

    public static CategoryResponse mapFromCategoryEntity(Category category) {

        CategoryResponse categoryResponse = new CategoryResponse();

        List<ProductDto> productList = new ArrayList<>();

        categoryResponse.setCategoryId(category.getId());
        categoryResponse.setName(category.getName());

        for (Product product : category.getProducts()) {
            ProductDto dto = new ProductDto(
                    product.getId(),
                    product.getTitle(),
                    product.getPrice(),
                    product.getDescription()
            );

            productList.add(dto);
        }

        categoryResponse.setProducts(productList);

        return categoryResponse;
    }

    @Data
    @AllArgsConstructor
    private static class ProductDto {
        private Integer productId;
        private String title;
        private Integer price;
        private String description;
    }
}
