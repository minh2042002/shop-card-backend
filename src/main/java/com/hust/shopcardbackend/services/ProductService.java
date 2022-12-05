package com.hust.shopcardbackend.services;

import com.hust.shopcardbackend.dto.product.ProductRequest;
import com.hust.shopcardbackend.dto.product.ProductResponse;
import com.hust.shopcardbackend.dto.product.ProductResponseAdmin;
import com.hust.shopcardbackend.entities.Category;
import com.hust.shopcardbackend.entities.ImageProduct;
import com.hust.shopcardbackend.entities.Product;
import com.hust.shopcardbackend.repositories.ICategoryRepository;
import com.hust.shopcardbackend.repositories.IImageProductRepository;
import com.hust.shopcardbackend.repositories.IProductRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService implements IProductService {

    final
    IProductRepository productRepo;

    final
    ICategoryRepository categoryRepo;

    final
    IImageProductRepository imageProductRepo;

    public ProductService(IProductRepository productRepo, ICategoryRepository categoryRepo, IImageProductRepository imageProductRepo) {
        this.productRepo = productRepo;
        this.categoryRepo = categoryRepo;
        this.imageProductRepo = imageProductRepo;
    }

    @Override
    public void createProduct(ProductRequest productRequest) throws Exception {

        boolean productExists = productRepo.findByTitleEqualsIgnoreCase(productRequest.getTitle()).isPresent();
        if (productExists) {
            throw new Exception("Product is exists!");
        } else {

            boolean categoryExists = categoryRepo.findByName(productRequest.getCategory()).isPresent();
            if (!categoryExists) {
                throw new Exception("Category is not exists!");
            }

            Product product = new Product(
                    productRequest.getTitle(),
                    productRequest.getPrice(),
                    productRequest.getDiscount(),
                    productRequest.getDescription()
            );

            Category category = categoryRepo.findByName(productRequest.getCategory()).get();
            product.setCategory(category);

            productRepo.save(product);
            List<ImageProduct> images = new ArrayList<>();
            for (ProductRequest.ImageProduct image : productRequest.getImages()) {
                images.add(new ImageProduct(product, image.getUrl()));
            }

            imageProductRepo.saveAll(images);
        }
    }

    @Override
    public List<ProductResponse> findAllByName(String nameProduct) throws NullPointerException {

        List<ProductResponse> productResponses = new ArrayList<>();

        List<Product> products = productRepo.findAllByTitleIsContainingIgnoreCase(nameProduct);

        if (products.isEmpty()) {
            throw new NullPointerException("Product is not found!");
        }

        for (Product product : products) {
            ProductResponse productRes = mapFromProductToProductResponse(product);
            productResponses.add(productRes);
        }

        return productResponses;
    }

    @Override
    public ProductResponseAdmin getByName(String nameProduct) throws NullPointerException {

        boolean productExists = productRepo.findByTitleEqualsIgnoreCase(nameProduct).isPresent();
        if (!productExists) {
            throw new NullPointerException("Product is not exists!");
        }

        Product product = productRepo.findByTitleEqualsIgnoreCase(nameProduct).get();

        ProductResponseAdmin responseAdmin = mapFromProductToProductResponseAdmin(product);

        return responseAdmin;
    }

    @Override
    public void deleteProduct(String nameProduct) throws NullPointerException {

        boolean productExists = productRepo.findByTitleEqualsIgnoreCase(nameProduct).isPresent();
        if (!productExists) {
            throw new NullPointerException("Product is not exists!");
        }

        productRepo.deleteByTitleEqualsIgnoreCase(nameProduct);
    }

    @Override
    public void updateProduct(ProductRequest productRequest) throws NullPointerException {

        boolean productExists = productRepo.findByTitleEqualsIgnoreCase(productRequest.getTitle()).isPresent();
        if (!productExists) {
            throw new NullPointerException("Product is not exists!");
        } else {

            boolean categoryExists = categoryRepo.findByName(productRequest.getCategory()).isPresent();
            if (!categoryExists) {
                throw new NullPointerException("Category is not exists!");
            }

            Product product = productRepo.findByTitleEqualsIgnoreCase(productRequest.getTitle()).get();
            Category category = categoryRepo.findByName(productRequest.getCategory()).get();

            List<ImageProduct> images = new ArrayList<>();
            for (ProductRequest.ImageProduct image : productRequest.getImages()) {
                images.add(new ImageProduct(product, image.getUrl()));
            }

            product.setTitle(productRequest.getTitle());
            product.setPrice(productRequest.getPrice());
            product.setDiscount(productRequest.getDiscount());
            product.setDescription(productRequest.getDescription());
            product.setCategory(category);
            product.setImageProducts(images);

            productRepo.saveAndFlush(product);
        }
    }

    public ProductResponse mapFromProductToProductResponse(Product product) {
        ProductResponse productRes = new ProductResponse(
                product.getTitle(),
                product.getPrice() * product.getDiscount(),
                product.getDescription(),
                product.getCategory().getName(),
                null
        );

        for (ImageProduct img : product.getImageProducts()) {
            productRes.getImages().add(img.getImageLink());
        }

        return productRes;
    }

    public ProductResponseAdmin mapFromProductToProductResponseAdmin(Product product) {
        ProductResponseAdmin productResAdmin = new ProductResponseAdmin(
                product.getTitle(),
                product.getPrice(),
                product.getDiscount(),
                product.getDescription(),
                product.getCategory().getName(),
                product.getCreatedAt(),
                product.getUpdateAt(),
                null
        );

        for (ImageProduct img : product.getImageProducts()) {
            productResAdmin.getImages().add(img.getImageLink());
        }

        return productResAdmin;
    }
}
