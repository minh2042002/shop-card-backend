package com.hust.shopcardbackend.entities;

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
@AllArgsConstructor
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

    @ManyToOne(targetEntity = Role.class)
    @JoinColumn(referencedColumnName = "id", nullable = false)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Role role;

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

}
