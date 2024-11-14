package com.example.mmo_shop.dao.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "authorities")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String role;
    @ManyToOne()
    @JoinColumn(name = "username", referencedColumnName = "username")
    @JsonBackReference
    private User user;

    public Role() {
    }

    public Role(User user, String role) {
        this.user = user;
        this.role = role;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
