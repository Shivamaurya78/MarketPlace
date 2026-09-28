package com.marketplace.marketplace.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @GetMapping("/me")
    public Map<String, Object> currentUser(
            Authentication authentication) {

        Map<String, Object> response = new HashMap<>();

        if (authentication == null) {
            response.put("loggedIn", false);
            return response;
        }

        String role = authentication.getAuthorities()
                .stream()
                .map(authority -> authority.getAuthority())
                .findFirst()
                .orElse("");

        response.put("loggedIn", true);
        response.put("email", authentication.getName());
        response.put("role", role);

        return response;
    }
}

