package com.example.mmo_shop.service.Imple;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
@Service
public class ImageService {
    @Value("${upload.dir}")
    private String baseDir;
    private static final String UPLOAD_DIR= "product\\";

    public String uploadImage(MultipartFile file) {
        try {
            if (file.isEmpty()) {
                throw new IOException("File is empty");
            }
            //Tao đường dãn tới ảnh
            Path path = Paths.get(baseDir+ UPLOAD_DIR + file.getOriginalFilename());

            Files.write(path,file.getBytes());
            return UPLOAD_DIR + file.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
            return "File upload failed";
        }

    }
}
