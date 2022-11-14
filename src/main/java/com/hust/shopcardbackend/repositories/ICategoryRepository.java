package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ICategoryRepository extends JpaRepository<Category, Integer> {

    Optional<Category> findByName(String nameCategory);
}
