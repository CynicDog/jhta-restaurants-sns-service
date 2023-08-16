package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.repository.composites.FollowCompositePrimaryKeys;
import kr.co.jhta.restaurants_service.vo.socials.Follow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FollowsRepository extends JpaRepository<Follow, FollowCompositePrimaryKeys> {

    List<Follow> findFollowsByCompositePrimaryKeys_FollowedId(int followedId);
}
