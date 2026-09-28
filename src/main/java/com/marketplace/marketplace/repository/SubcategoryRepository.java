package com.marketplace.marketplace.repository;

import com.marketplace.marketplace.entity.Subcategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubcategoryRepository extends JpaRepository<Subcategory, Long> {
}