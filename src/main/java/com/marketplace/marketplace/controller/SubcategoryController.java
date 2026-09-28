package com.marketplace.marketplace.controller;

import com.marketplace.marketplace.entity.Subcategory;
import com.marketplace.marketplace.service.SubcategoryService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subcategories")
public class SubcategoryController {

    private final SubcategoryService subcategoryService;

    public SubcategoryController(SubcategoryService subcategoryService) {
        this.subcategoryService = subcategoryService;
    }

    // Create Subcategory
    @PostMapping
    public Subcategory createSubcategory(@RequestBody Subcategory subcategory) {
        return subcategoryService.createSubcategory(subcategory);
    }

    // Get All Subcategories
    @GetMapping
    public List<Subcategory> getAllSubcategories() {
        return subcategoryService.getAllSubcategories();
    }

    // Get Subcategory By ID
    @GetMapping("/{id}")
    public Subcategory getSubcategoryById(@PathVariable Long id) {
        return subcategoryService.getSubcategoryById(id);
    }

    // Delete Subcategory
    @DeleteMapping("/{id}")
    public String deleteSubcategory(@PathVariable Long id) {
        subcategoryService.deleteSubcategory(id);
        return "Subcategory deleted successfully";
    }
}