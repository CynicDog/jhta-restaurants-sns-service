package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.user.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Integer> {

    User findByUsername(String username);
}
