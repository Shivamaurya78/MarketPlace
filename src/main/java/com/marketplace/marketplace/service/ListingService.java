package com.marketplace.marketplace.service;

import com.marketplace.marketplace.entity.Listing;
import com.marketplace.marketplace.entity.User;
import com.marketplace.marketplace.exception.ResourceNotFoundException;
import com.marketplace.marketplace.repository.ListingRepository;
import com.marketplace.marketplace.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ListingService {

    private final ListingRepository listingRepository;
    private final UserRepository userRepository;

    public ListingService(
            ListingRepository listingRepository,
            UserRepository userRepository) {

        this.listingRepository = listingRepository;
        this.userRepository = userRepository;
    }

    // Create Listing
    public Listing createListing(
            Listing listing,
            String currentUserEmail) {

        User currentUser = userRepository
                .findByEmail(currentUserEmail)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "User not found"));

        // Automatically assign logged-in user
        listing.setUser(currentUser);

        return listingRepository.save(listing);
    }

    // Get All Listings
    public List<Listing> getAllListings() {
        return listingRepository.findAll();
    }

    // Get Listing By ID
    public Listing getListingById(Long id) {

        return listingRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Listing not found with id: " + id));
    }

    // Delete Listing
    public void deleteListing(
            Long id,
            String currentUserEmail,
            boolean isAdmin) {

        Listing existingListing = listingRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Listing not found with id: " + id));

        // USER can delete only own listing
        // ADMIN can delete any listing
        if (!isAdmin &&
                !existingListing.getUser().getEmail()
                        .equals(currentUserEmail)) {

            throw new RuntimeException(
                    "You are not allowed to delete this listing");
        }

        listingRepository.delete(existingListing);
    }

    // Update Listing
    public Listing updateListing(
            Long id,
            Listing listing,
            String currentUserEmail,
            boolean isAdmin) {

        Listing existingListing = listingRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException(
                                "Listing not found with id: " + id));

        // USER can update only own listing
        // ADMIN can update any listing
        if (!isAdmin &&
                !existingListing.getUser().getEmail()
                        .equals(currentUserEmail)) {

            throw new RuntimeException(
                    "You are not allowed to update this listing");
        }

        existingListing.setType(listing.getType());
        existingListing.setName(listing.getName());
        existingListing.setDetail(listing.getDetail());
        existingListing.setCountry(listing.getCountry());
        existingListing.setState(listing.getState());
        existingListing.setCity(listing.getCity());
        existingListing.setArea(listing.getArea());
        existingListing.setPrice(listing.getPrice());

        existingListing.setCategory(listing.getCategory());
        existingListing.setSubcategory(listing.getSubcategory());

        return listingRepository.save(existingListing);
    }

    // Get Listings By City
    public List<Listing> getByCity(String city) {
        return listingRepository.findByCityIgnoreCase(city);
    }

    // Get Listings By Category
    public List<Listing> getByCategory(String categoryName) {
        return listingRepository
                .findByCategory_NameIgnoreCase(categoryName);
    }

    // Get Listings By City + Category
    public List<Listing> getByCityAndCategory(
            String city,
            String categoryName) {

        return listingRepository
                .findByCityIgnoreCaseAndCategory_NameIgnoreCase(
                        city,
                        categoryName);
    }

    // Search Listing By Name
    public List<Listing> searchByName(String keyword) {
        return listingRepository
                .findByNameContainingIgnoreCase(keyword);
    }
}