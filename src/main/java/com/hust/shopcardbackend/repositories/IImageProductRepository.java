package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.ImageProduct;
import com.hust.shopcardbackend.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IImageProductRepository extends JpaRepository<ImageProduct, Integer> {
    List<ImageProduct> findByProduct (Product product);
}
