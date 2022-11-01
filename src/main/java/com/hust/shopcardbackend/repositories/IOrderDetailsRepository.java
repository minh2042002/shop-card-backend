package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.Order;
import com.hust.shopcardbackend.entities.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IOrderDetailsRepository extends JpaRepository<OrderDetails, Integer> {
    List<OrderDetails> findByOrder(Order order);
}
