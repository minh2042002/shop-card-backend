package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.repositories.ICategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService implements ICategoryService {

    @Autowired
    private ICategoryRepository repository;

    @Override
    public Category findById(Integer categoryId) throws NullPointerException {

        boolean categoryExists = repository.findById(categoryId).isPresent();

        if (!categoryExists) {
            throw new NullPointerException("Category is not exists!");
        }

        return repository.findById(categoryId).get();
    }

    @Override
    public void addCategory(Category category) throws Exception{

        boolean categoryExists = repository.findByName(category.getName()).isPresent();
        if (categoryExists) {
            throw new Exception("Category is exists!");
        }

        repository.save(category);
    }

    @Override
    public void updateCategory(Integer categoryId, Category category) throws NullPointerException {

    }

    @Override
    public void deleteCategory(Category category) {

    }
}
