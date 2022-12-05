package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.order.OrderRequest;
import com.hust.shopcardbackend.dto.order.OrderResponse;
import com.hust.shopcardbackend.entities.Order;
import com.hust.shopcardbackend.entities.User;
import com.hust.shopcardbackend.repositories.IOrderDetailsRepository;
import com.hust.shopcardbackend.repositories.IOrderRepository;
import com.hust.shopcardbackend.repositories.IUserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService{

    final
    IUserRepository userRepo;

    final
    IOrderRepository orderRepo;

    final
    IOrderDetailsRepository orderDetailsRepo;

    public OrderService(IUserRepository userRepo, IOrderRepository orderRepo, IOrderDetailsRepository orderDetailsRepo) {
        this.userRepo = userRepo;
        this.orderRepo = orderRepo;
        this.orderDetailsRepo = orderDetailsRepo;
    }

    @Override
    public OrderResponse findOrderByUser(String email) throws NullPointerException{

        boolean userExists = userRepo.findByEmail(email).isPresent();
        if (!userExists) {
            throw new NullPointerException("User is not exist!");
        }

        User user = userRepo.findByEmail(email).get();

        List<Order> orders = orderRepo.findOrdersByUser(user);

        if (orders.isEmpty()) {
            throw new NullPointerException("User has no orders!");
        }



        return null;
    }

    @Override
    public void createOrder(OrderRequest order) {

    }

    @Override
    public void deleteOrder(String orderToken) {

    }
}
