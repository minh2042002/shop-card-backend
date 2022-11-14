package com.hust.shopcardbackend.entities;

import com.hust.shopcardbackend.utilities.RoleUser;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="user")
@Data
@NoArgsConstructor
public class User implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "full_name", length = 50, nullable = false)
    private String fullName;

    @Column(name = "email", length = 150, unique = true)
    private String email;

    @Column(name = "phone", length = 10, unique = true)
    private String phone;

    @Column(name = "address", length = 150)
    private String address;

    @Column(name = "avatar_link", columnDefinition = "TEXT")
    private String avatarLink;

    @Column(name = "password", nullable = false, columnDefinition = "TEXT")
    private String password;

    @Column(name = "role", nullable = false)
    @Enumerated(EnumType.STRING)
    private RoleUser role;


    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, orphanRemoval = true)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<Order> orders;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, orphanRemoval = true)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<FeedBack> feedBacks;

    @Column(name = "created_at", updatable = false)
    @Temporal(value = TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date createdAt;

    @Column(name = "update_at")
    @Temporal(value = TemporalType.TIMESTAMP)
    @UpdateTimestamp
    private Date updateAt;

    public User(String fullName, String email, String phone, String address, String avatarLink, String password, RoleUser role, List<Order> orders, List<FeedBack> feedBacks) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.avatarLink = avatarLink;
        this.password = password;
        this.role = role;
        this.orders = orders;
        this.feedBacks = feedBacks;
    }


}
