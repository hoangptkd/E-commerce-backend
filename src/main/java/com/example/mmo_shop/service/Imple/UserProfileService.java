package com.example.mmo_shop.service.Imple;

import com.example.mmo_shop.dao.model.dto.UserDTO;
import com.example.mmo_shop.dao.model.entity.Address;
import com.example.mmo_shop.dao.model.entity.User;
import com.example.mmo_shop.dao.repository.AddressRepository;
import com.example.mmo_shop.dao.repository.UserRepository;
import com.example.mmo_shop.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

@Service
public class UserProfileService {
    
    
    @Autowired
    private AddressRepository addressRepository;
    @Autowired
    private UserRepository userRepository;
    public User changePass(String currentPass, String newPass) {
        User user = SecurityService.getAuth();

        // Kiểm tra mật khẩu hiện tại (bỏ phần {noop} nếu có)
        String currentStoredPass = user.getPassword().replace("{noop}", "");
        if (!currentPass.equals(currentStoredPass)) {
            throw new BadCredentialsException("Current password is incorrect");
        }

        // Đặt mật khẩu mới với {noop}
        user.setPassword("{noop}" + newPass);

        // Lưu vào database
        return userRepository.save(user);
    }

    public Address getAddress() {
        User user = SecurityService.getAuth();
        return user != null ? user.getAddress() : null;
    }
    
    public User updateProfile(UserDTO userDTO){
        User user = SecurityService.getAuth();
        if (!user.getName().equalsIgnoreCase(userDTO.getName())) {
            user.setName(userDTO.getName());
        }
        if (user.getPhone() == null) {
            user.setPhone(userDTO.getPhone());
        } else {
            if (!user.getPhone().equalsIgnoreCase(userDTO.getPhone())){
                user.setPhone(userDTO.getPhone());
            }
        }

        if (!user.getUsername().equalsIgnoreCase(userDTO.getUsername())) {
            user.setUsername(userDTO.getUsername());
        }
        if (user.getAddress() == null) {
            Address existingAddress = user.getAddress();
            Address newAddress = userDTO.getAddress();
            if (newAddress != null) {
                if (existingAddress == null) {
                    newAddress.setUser(user);
                    user.setAddress(newAddress);
                } else {
                    if (newAddress != null) {
                        existingAddress.setStreet(newAddress.getStreet());
                        existingAddress.setDistrict(newAddress.getDistrict());
                        existingAddress.setCity(newAddress.getCity());
                    }
                }
            }
        } else {
            if (!user.getAddress().equals(userDTO.getAddress())) {
                Address existingAddress = user.getAddress();
                Address newAddress = userDTO.getAddress();
                if (existingAddress == null) {
                    newAddress.setUser(user);
                    user.setAddress(newAddress);
                } else {
                    if (newAddress != null) {
                        existingAddress.setStreet(newAddress.getStreet());
                        existingAddress.setDistrict(newAddress.getDistrict());
                        existingAddress.setCity(newAddress.getCity());
                    }
                }
            }
        }

        return userRepository.save(user);
    }

}
