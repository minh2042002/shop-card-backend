package com.hust.shopcardbackend.controllers;

import com.hust.shopcardbackend.dto.product.ProductRequest;
import com.hust.shopcardbackend.dto.product.ProductResponse;
import com.hust.shopcardbackend.dto.product.ProductResponseAdmin;
import com.hust.shopcardbackend.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/v1/products")
public class ProductController {

    @Autowired
    ProductService service;

    @PostMapping(value = "/add")
    public ResponseEntity<?> addProduct(@RequestBody ProductRequest productRequest) {
        try {
            service.createProduct(productRequest);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>("Add product is success", HttpStatus.OK);
    }

    @GetMapping(value = "/find")
    public ResponseEntity<?> findAllProduct(
            @RequestParam(value = "name", required = false, defaultValue = "name of product")
            String nameProduct) {

        List<ProductResponse> productResponses;

        try {
            productResponses = service.findAllByName(nameProduct);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(productResponses, HttpStatus.OK);
    }

    @GetMapping(value = "/get")
    public ResponseEntity<?> getProduct(@RequestParam(value = "name") String nameProduct) {

        ProductResponseAdmin product;

        try {
            product = service.getByName(nameProduct);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PutMapping(value = "/update")
    public ResponseEntity<?> updateProduct(@RequestBody ProductRequest productRequest) {

        try {
            service.updateProduct(productRequest);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>("Update is success!", HttpStatus.OK);
    }

    @DeleteMapping(value = "/delete")
    public ResponseEntity<?> deleteProduct(@RequestParam String nameProduct) {

        try {
            service.deleteProduct(nameProduct);
        } catch (NullPointerException e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>("Delete is success!", HttpStatus.OK);
    }
}
