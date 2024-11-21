package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, Integer> {
}
