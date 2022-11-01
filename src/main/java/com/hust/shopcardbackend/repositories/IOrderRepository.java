package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Order;
import com.hust.shopcardbackend.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IOrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByUser(User user);

}
