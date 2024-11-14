package com.example.mmo_shop.rest;

import com.example.mmo_shop.service.Imple.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/api/images")
public class RestImage {
    private final ImageService imageService;

    @Autowired
    public RestImage(ImageService imageService) {
        this.imageService = imageService;
    }

    @PostMapping("/upload")
    public ResponseEntity<String> uploadImage(@RequestParam("image") MultipartFile file) {
        String imagePath = imageService.uploadImage(file);
        return ResponseEntity.ok(imagePath); // Trả về đường dẫn ảnh sau khi lưu
    }
}
