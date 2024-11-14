package com.example.mmo_shop.dao.model.dto;

import com.example.mmo_shop.dao.model.entity.*;

import java.util.List;

public class DtoMapper {
    public static ProductDTO toDto(Product product){
        ProductDTO productDTO = new ProductDTO();
        productDTO.setId(product.getId());
        productDTO.setName(product.getName());
        productDTO.setDescription(product.getDescription());
        productDTO.setCategoryName(product.getCategory().getName());
        productDTO.setShopName(product.getShop().getName());
        productDTO.setRating((product.getRating()));
        productDTO.setBuyersCount(product.getBuyersCount());
        // convert versions to versions name
        productDTO.setVersionsName(
                product.getVersions().stream().map(
                        productVersion -> productVersion.getVersionName()
                ).toList()
        );
        return productDTO;
    }
    public static CartItemDTO toCartItemDto(CartItem cartItem){
        CartItemDTO cartItemDTO = new CartItemDTO();
        cartItemDTO.setId(cartItem.getId());
        cartItemDTO.setProductName(cartItem.getProductVersion().getProduct().getName());
        cartItemDTO.setProductVersion(cartItem.getProductVersion());
        cartItemDTO.setImagePath(cartItem.getProductVersion().getProduct().getImagePath());
        cartItemDTO.setPrice(cartItem.getProductVersion().getPrice());
        cartItemDTO.setQuantity(cartItem.getQuantity());
        return cartItemDTO;
    }
    public static ShopCartDTO toShopCartDTO(Shop shop, List<CartItemDTO> cartItemDTOS) {
        ShopCartDTO shopCartDTO = new ShopCartDTO();
        shopCartDTO.setShopId(shop.getId());
        shopCartDTO.setShopName(shop.getName());
        shopCartDTO.setItems(cartItemDTOS);
        return shopCartDTO;
    }



    private static OrderItemDTO toOrderItemDto(OrderItem orderItem){
        OrderItemDTO orderItemDTO = new OrderItemDTO();
        orderItemDTO.setId(orderItem.getId());
        orderItemDTO.setVersionName(orderItem.getProductVersion().getVersionName());
        orderItemDTO.setQuantity(orderItem.getQuantity());
        orderItemDTO.setPrice(orderItem.getPrice());
        return orderItemDTO;
    }

    public static OrderDTO toOrderDto(Order order){
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setId(order.getId());
        orderDTO.setUsername(order.getUser().getUsername());
        orderDTO.setStatus(order.getStatus());
        orderDTO.setOrderDate(order.getOrderDate());
        orderDTO.setOrderItems(
            order.getOrderItems().stream().map(DtoMapper::toOrderItemDto).toList()
        );
        orderDTO.setTotal(order.getTotal());
        orderDTO.setShippingAddress(order.getShippingAddress());
        orderDTO.setPickupAddress(order.getPickupAddress());
        return orderDTO;
    }

    public static UserDTO toUserDTO(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setUsername(user.getUsername());
        userDTO.setName(user.getName());
        userDTO.setGmail(user.getGmail());
        userDTO.setPhone(user.getPhone());
        userDTO.setBalance(user.getBalance());
        userDTO.setRegister_date(user.getRegister_date());
        userDTO.setAddress(user.getAddress());
        return userDTO;
    }
}
