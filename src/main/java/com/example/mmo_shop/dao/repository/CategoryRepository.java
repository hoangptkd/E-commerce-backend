package com.example.mmo_shop.dao.repository;

import com.example.mmo_shop.dao.model.entity.Category;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer> {
    @Query("Select c from Category c left join c.products p group by c order by count(p) desc")
    List<Category> findTopCategoriesSortedByProductCount(Pageable pageable);
}
