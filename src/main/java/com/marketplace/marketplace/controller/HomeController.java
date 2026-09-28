package com.marketplace.marketplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home()
    {
        return "index";
    }
    @GetMapping("/add-listing")
    public String addListing() {
        return "add-listing";
    }

    @GetMapping("/listing/{id}")
    public String listingDetails() {
        return "listing-details";
    }
    @GetMapping("/category")
    public String categoryPage() {
        return "category";
    }

    @GetMapping("/city")
    public String cityPage() {
        return "city";
    }

    @GetMapping("/city-category")
    public String cityCategoryPage() {
        return "city-category";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }


    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/my-listings")
    public String myListingsPage() {
        return "my-listings";
    }
}
