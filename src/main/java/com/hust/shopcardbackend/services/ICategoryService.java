package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.category.CategoryResponse;
import com.hust.shopcardbackend.entities.Category;

public interface ICategoryService {

    abstract CategoryResponse findById(Integer categoryId) throws NullPointerException;

    abstract CategoryResponse findByName(String nameCategory) throws NullPointerException;

    abstract CategoryResponse addCategory(String nameCategory) throws Exception;

    abstract void updateCategory(Integer categoryId, Category category) throws NullPointerException;

    abstract void deleteCategoryByName(String nameCategory) throws NullPointerException;
}
