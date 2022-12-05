package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.product.ProductRequest;
import com.hust.shopcardbackend.dto.product.ProductResponse;
import com.hust.shopcardbackend.dto.product.ProductResponseAdmin;

import java.util.List;

public interface IProductService {

    abstract void createProduct(ProductRequest productRequest) throws Exception;

    abstract List<ProductResponse> findAllByName(String nameProduct) throws NullPointerException;

    abstract ProductResponseAdmin getByName(String nameProduct) throws NullPointerException;
    abstract void deleteProduct(String nameProduct) throws NullPointerException;

    abstract void updateProduct(ProductRequest productRequest) throws NullPointerException;
}
