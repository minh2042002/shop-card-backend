package com.hust.shopcardbackend.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;

@Entity
@Table(name = "image_product")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageProduct implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(targetEntity = Product.class)
    @JoinColumn(referencedColumnName = "id", nullable = false)
    private Product product;

    @Column(name = "image_link", columnDefinition = "TEXT", nullable = false)
    private String imageLink;

}
