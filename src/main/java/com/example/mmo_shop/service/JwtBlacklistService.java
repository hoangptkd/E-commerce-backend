package com.example.mmo_shop.service;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
public class JwtBlacklistService {
    private final RedisTemplate<String, Object> redisTemplate;

    public JwtBlacklistService(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void blacklistToken(String token, long expTime) {
        String key = "blacklisted:" + token;
        long ttl = expTime - System.currentTimeMillis();
        redisTemplate.opsForValue().set(key, "1", Duration.ofMillis(ttl));
    }

    // kiểm tra jwt xem bị khóa không
    public boolean isTokenBlacklisted(String token) {
        String key = "blacklisted:" + token;
        return Boolean.TRUE.equals(redisTemplate.hasKey(key));
    }
}
