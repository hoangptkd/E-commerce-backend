package com.example.mmo_shop.service;

import com.example.mmo_shop.dao.model.entity.CartItem;
import com.example.mmo_shop.dao.model.entity.Shop;

import java.util.List;
import java.util.Map;

public interface CartService {
    Map<Shop, List<CartItem>> findByUser();

    CartItem save(CartItem cartItem);

    CartItem updateQuantity(int id, int quantity);

    CartItem deleteByID(int id);
}
