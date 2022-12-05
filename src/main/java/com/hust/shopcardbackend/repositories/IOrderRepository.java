package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Order;
import com.hust.shopcardbackend.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IOrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findOrdersByUser(User user);

    Optional<Order> findByOrderToken(String orderToken);

    void deleteByOrderToken(String orderToken);
}
