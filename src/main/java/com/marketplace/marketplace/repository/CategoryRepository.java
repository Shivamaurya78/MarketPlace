package com.marketplace.marketplace.repository;

import com.marketplace.marketplace.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}