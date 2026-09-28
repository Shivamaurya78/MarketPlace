package com.marketplace.marketplace.repository;

import com.marketplace.marketplace.entity.Listing;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListingRepository extends JpaRepository<Listing, Long> {
    List<Listing> findByCityIgnoreCase(String city);
    List<Listing> findByCategory_NameIgnoreCase(String categoryName);
    List<Listing> findByCityIgnoreCaseAndCategory_NameIgnoreCase
            (String city,
             String categoryName
            );
    List<Listing> findByNameContainingIgnoreCase(String keyword);
}