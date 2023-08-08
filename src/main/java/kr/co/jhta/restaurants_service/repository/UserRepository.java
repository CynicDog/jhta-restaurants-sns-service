package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);
}
