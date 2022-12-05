package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.category.CategoryResponse;
import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.repositories.ICategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    private ICategoryRepository repository;

    @Override
    public CategoryResponse findById(Integer categoryId) throws NullPointerException {

        boolean categoryExists = repository.findById(categoryId).isPresent();

        if (!categoryExists) {
            throw new NullPointerException("Category is not exists!");
        }

        Category category = repository.findById(categoryId).get();

        return CategoryResponse.mapFromCategoryEntity(category);
    }

    @Override
    public CategoryResponse findByName(String nameCategory) throws NullPointerException {
        boolean categoryExists = repository.findByName(nameCategory).isPresent();

        if (!categoryExists) {
            throw new NullPointerException("Category is not exists!");
        }

        Category category = repository.findByName(nameCategory).get();

        return CategoryResponse.mapFromCategoryEntity(category);
    }

    @Override
    public CategoryResponse addCategory(String nameCategory) throws Exception{

        boolean categoryExists = repository.findByName(nameCategory).isPresent();
        if (categoryExists) {
            throw new Exception("Category is exists!");
        }

        Category newCategory = new Category(nameCategory, null);
        repository.save(newCategory);

        Category category = repository.findByName(nameCategory).get();

        return CategoryResponse.mapFromCategoryEntity(category);
    }

    @Override
    public void updateCategory(Integer categoryId, Category category) throws NullPointerException {
    }

    @Override
    public void deleteCategoryByName(String nameCategory) throws NullPointerException{

        boolean categoryExists = repository.findByName(nameCategory).isPresent();
        if (!categoryExists) {
            throw new NullPointerException("Category is not exists!");
        }

        repository.deleteCategoryByName(nameCategory);
    }
}
