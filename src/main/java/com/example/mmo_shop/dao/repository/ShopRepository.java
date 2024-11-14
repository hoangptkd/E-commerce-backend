package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Shop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShopRepository extends JpaRepository<Shop,Integer> {

}
