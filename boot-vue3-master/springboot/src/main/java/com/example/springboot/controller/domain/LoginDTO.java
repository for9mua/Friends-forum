package com.example.springboot.controller.domain;

import com.example.springboot.entity.Permission;
import com.example.springboot.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private User user;
    private String token;
    private List<Permission> menus;
    private List<Permission> auths;
}
