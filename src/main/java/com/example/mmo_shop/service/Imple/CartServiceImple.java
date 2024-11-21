package com.example.mmo_shop.service.Imple;


import com.example.mmo_shop.dao.model.entity.Cart;
import com.example.mmo_shop.dao.model.entity.CartItem;
import com.example.mmo_shop.dao.model.entity.Shop;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.dao.repository.CartItemRepository;
import com.example.mmo_shop.dao.repository.CartRepository;
import com.example.mmo_shop.service.CartService;
import com.example.mmo_shop.service.SecurityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CartServiceImple implements CartService {
    private final CartItemRepository cartItemRepository;
    private final CartRepository cartRepository;

    public CartServiceImple(CartItemRepository cartItemRepository, CartRepository cartRepository) {
        this.cartRepository = cartRepository;
        this.cartItemRepository = cartItemRepository;
    }

    public Cart getCardFromAuthentication() {
        User user = SecurityService.getAuth();
        assert user != null;
        Cart cart = user.getCart();
        if (cart == null) {
            cart = new Cart();
            user.setCart(cart);
            cartRepository.save(cart);
        }
        return cart;
    }

    @Override
    public Map<Shop, List<CartItem>> findByUser() {
        Cart cart = getCardFromAuthentication();
        List<CartItem> cartItems = cart.getCartItems().stream().filter(cartItem -> cartItem.getProductVersion().getStatus() != 0).toList();
        Map<Shop, List<CartItem>> groupCartItem = cartItems.stream().collect(Collectors.groupingBy(
                cartItem -> cartItem.getProductVersion().getProduct().getShop(),
                LinkedHashMap::new,
                Collectors.toList()
        ));

        return groupCartItem;
    }

    @Override
    public CartItem save(CartItem cartItem) {
        Cart cart = getCardFromAuthentication();
        cartItem.setCart(cart);
        Optional<CartItem> findCartItem = cart.getCartItems().stream().filter(cartItem1 -> cartItem1.getProductVersion().getId() == cartItem.getProductVersion().getId()).findFirst();
        if (findCartItem.isPresent()) {
            findCartItem.get().setQuantity(findCartItem.get().getQuantity() + cartItem.getQuantity());
            return cartItemRepository.save(findCartItem.get());
        }

        return cartItemRepository.save(cartItem);
    }

    @Override
    public CartItem updateQuantity(int id, int quantity) {
        Map<Shop, List<CartItem>> groupCartItem = findByUser();
        CartItem updateCartItem = null;
        for (Map.Entry<Shop, List<CartItem>> shopMap : groupCartItem.entrySet()) {
            List<CartItem> cartItems = shopMap.getValue();
            for (CartItem item : cartItems) {
                if (item.getId() == id) {
                    updateCartItem = item;
                    break;
                }
            }
        }
        if (updateCartItem != null) {
            updateCartItem.setQuantity(quantity);
            return cartItemRepository.save(updateCartItem);
        } else {
            return null;
        }
    }

    @Override
    @Transactional

    public CartItem deleteByID(int id) {
        cartItemRepository.deleteById(id);
        return null;
//        CartItem item = cartItemRepository
//                .findById(id)
//                .orElseThrow(() -> new Error("Cart item not found"));
//
//        try {
//            // Xóa item
//            cartItemRepository.delete(item);
//            return item;
//        } catch (DataAccessException e) {
//            throw new RuntimeException("Error deleting cart item", e);
//        }
    }
}
