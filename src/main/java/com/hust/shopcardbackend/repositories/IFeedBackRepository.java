package com.hust.shopcardbackend.repositories;

import com.hust.shopcardbackend.entities.FeedBack;
import com.hust.shopcardbackend.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IFeedBackRepository extends JpaRepository<FeedBack, Integer> {
    List<FeedBack> findByUser(User user);
}
