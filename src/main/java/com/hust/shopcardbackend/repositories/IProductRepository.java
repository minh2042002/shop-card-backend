package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByCategory(Category category);

    List<Product> findByTitleContainsIgnoreCase(String title);
}
