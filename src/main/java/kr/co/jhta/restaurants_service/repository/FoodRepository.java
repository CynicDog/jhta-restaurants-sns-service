package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.store.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodRepository extends JpaRepository<Food, Integer> {
}
