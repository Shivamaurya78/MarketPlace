package com.marketplace.marketplace.controller;

import com.marketplace.marketplace.entity.Listing;
import com.marketplace.marketplace.service.ListingService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.Authentication;
import java.util.List;

@Valid
@RestController
@RequestMapping("/api/listings")
public class ListingController {

    @Autowired
    private ListingService listingService;

    // Create Listing

    @PostMapping
    public Listing createListing(
            @Valid @RequestBody Listing listing,
            Authentication authentication) {

        String currentUserEmail =
                authentication.getName();

        return listingService.createListing(
                listing,
                currentUserEmail
        );
    }


    // Get All Listings

    @GetMapping
    public List<Listing> getAllListings() {
        return listingService.getAllListings();
    }


    // Get Listing By ID

    @GetMapping("/{id}")
    public Listing getListingById(@PathVariable Long id) {
        return listingService.getListingById(id);
    }

    // Delete Listing

    @DeleteMapping("/{id}")
    public String deleteListing(
            @PathVariable Long id,
            Authentication authentication) {

        String currentUserEmail =
                authentication.getName();

        boolean isAdmin =
                authentication.getAuthorities()
                        .stream()
                        .anyMatch(authority ->
                                authority.getAuthority()
                                        .equals("ROLE_ADMIN"));

        listingService.deleteListing(
                id,
                currentUserEmail,
                isAdmin
        );

        return "Listing deleted successfully";
    }

    // Update Listing
    @PutMapping("/{id}")
    public Listing updateListing(
            @PathVariable Long id,
            @RequestBody Listing listing,
            Authentication authentication) {

        String currentUserEmail =
                authentication.getName();

        boolean isAdmin =
                authentication.getAuthorities()
                        .stream()
                        .anyMatch(authority ->
                                authority.getAuthority()
                                        .equals("ROLE_ADMIN"));

        return listingService.updateListing(
                id,
                listing,
                currentUserEmail,
                isAdmin
        );
    }


    // Get Listings By City

    @GetMapping("/city/{city}")
    public List<Listing> getListingsByCity(
            @PathVariable String city) {

        return listingService.getByCity(city);
    }


    // Get Listings By Category

    @GetMapping("/category/{categoryName}")
    public List<Listing> getListingsByCategory(
            @PathVariable String categoryName) {

        return listingService.getByCategory(categoryName);
    }

    // Get Listings By City + Category

    @GetMapping("/city/{city}/category/{categoryName}")
    public List<Listing> getListingsByCityAndCategory(
            @PathVariable String city,
            @PathVariable String categoryName) {

        return listingService.getByCityAndCategory(
                city,
                categoryName
        );
    }
    @GetMapping("/search")
    public List<Listing> searchListings(@RequestParam String keyword)
        {
            return listingService.searchByName(keyword);
        }
    }
