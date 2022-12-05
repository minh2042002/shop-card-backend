package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.order.OrderRequest;
import com.hust.shopcardbackend.dto.order.OrderResponse;

public interface IOrderService {

    abstract OrderResponse findOrderByUser(String email) throws NullPointerException;

    abstract void createOrder(OrderRequest order);

    abstract void deleteOrder(String orderToken);
}
