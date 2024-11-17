package com.example.mmo_shop.security;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;


@SpringBootTest
class RedisConfigTest {
        @Autowired
        private RedisTemplate<String, Object> redisTemplate;
        @Test
        void redisTestCode() {
            String key = "validCode:123456";
            long ttl = 5 * 60 * 1000;
            redisTemplate.opsForValue().set(key, "1", ttl);
        }

}