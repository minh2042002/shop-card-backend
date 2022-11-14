package com.hust.shopcardbackend.entities;

import lombok.*;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;

@Entity
@Table(name = "feedback")
@Data
@NoArgsConstructor
public class FeedBack implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

   @ManyToOne(targetEntity = User.class)
   @JoinColumn(referencedColumnName = "id", nullable = false)
   @EqualsAndHashCode.Exclude
   @ToString.Exclude
   private User user;

    @Column(name = "title", length = 100, nullable = false)
    private String title;

    @Column(name = "note", columnDefinition = "TEXT")
    private String note;

    public FeedBack(User user, String title, String note) {
        this.user = user;
        this.title = title;
        this.note = note;
    }
}
