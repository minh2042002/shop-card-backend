package com.hust.shopcardbackend.controllers;

import com.hust.shopcardbackend.dto.category.CategoryResponse;
import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/api/v1/categories")
public class CategoryController {

    @Autowired
    CategoryService service;

    @PostMapping(value = "/add")
    public ResponseEntity<?> addCategory(@RequestParam("name") String nameCategory) {

        CategoryResponse category;

        try {
            category = service.addCategory(nameCategory);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(category, HttpStatus.CREATED);
    }

    @GetMapping(value = "/get")
    public ResponseEntity<?> getCategoryByName(@RequestParam(value = "name", required = false) String nameCategory) {

        CategoryResponse category;

        try {
            category = service.findByName(nameCategory);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(category, HttpStatus.OK);
    }

    @SuppressWarnings(value = "Method is developing")
    @PutMapping(value = "/update")
    public ResponseEntity<?> updateCategory(@RequestParam("name") String nameCategory, @RequestBody Category category) {
        return new ResponseEntity<> (HttpStatus.HTTP_VERSION_NOT_SUPPORTED);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<?> deleteCategory(@RequestParam("id") String nameCategory) {

            try {
                service.deleteCategoryByName(nameCategory);
            } catch (NullPointerException e) {
                return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
            }

            return new ResponseEntity<>(HttpStatus.OK);
    }
}
