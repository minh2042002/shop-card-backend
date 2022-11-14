package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.entities.Category;

public interface ICategoryService {
    abstract Category findById(Integer categoryId) throws NullPointerException;

    abstract void addCategory(Category category) throws Exception;

    abstract void updateCategory(Integer categoryId, Category category) throws NullPointerException;

    abstract void deleteCategory(Category category);
}
