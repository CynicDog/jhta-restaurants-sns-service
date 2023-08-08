package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.user.Role;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface RoleRepository extends PagingAndSortingRepository<Role, Integer> {

    // Cannot query by nested property: user.id
    @Query("SELECT * FROM ROLES WHERE user_id = :userId")
    List<Role> findByUserId(int userId);
}
