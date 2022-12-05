package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IProductRepository extends JpaRepository<Product, Integer> {

    Optional<Product> findByTitleEqualsIgnoreCase(String title);

    List<Product> findAllByTitleIsContainingIgnoreCase(String title);

    void deleteByTitleEqualsIgnoreCase(String title);
}
