package com.example.mmo_shop.rest;

import com.example.mmo_shop.dao.model.dto.DtoMapper;
import com.example.mmo_shop.dao.model.dto.ShopCartDTO;
import com.example.mmo_shop.dao.model.entity.CartItem;
import com.example.mmo_shop.dao.model.entity.Shop;
import com.example.mmo_shop.dao.repository.CartItemRepository;
import com.example.mmo_shop.service.CartService;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/cart")
@PreAuthorize("hasAnyRole('CUSTOMER')")
public class RestCart {
    @Autowired
    private CartService cartService;
    @Autowired
    private CartItemRepository cartItemRepository;

    @GetMapping("/allByUser")
    public List<ShopCartDTO> findAllCartItem() {
        Map<Shop, List<CartItem>> groupCartItem = cartService.findByUser();
        List<ShopCartDTO> shopCartDTOS = new ArrayList<>();
        for (Map.Entry<Shop, List<CartItem>> shopMap : groupCartItem.entrySet()) {
            Shop shop = shopMap.getKey();
            List<CartItem> cartItems = shopMap.getValue();
            shopCartDTOS.add(
                    DtoMapper.toShopCartDTO(
                            shop, cartItems.stream().map(DtoMapper::toCartItemDto).toList()
                    )
            );
        }
        return shopCartDTOS;
    }

    @PutMapping("/add")
    public CartItem addItem(@RequestBody CartItem cartItem) {
        return cartService.save(cartItem);
    }

    @PutMapping("/updateQuantity")
    public CartItem updateQuantity(@RequestBody JsonNode request) {
        return cartService.updateQuantity(request.get("cardItemId").asInt(), request.get("quantity").asInt());
    }

    @DeleteMapping("/delete/{cardItemId}")
    public CartItem deleteItem(@PathVariable int cardItemId) {
        return cartService.deleteByID(cardItemId);
    }
}
