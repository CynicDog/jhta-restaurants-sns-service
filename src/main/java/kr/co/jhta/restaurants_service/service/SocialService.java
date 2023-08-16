package kr.co.jhta.restaurants_service.service;

import kr.co.jhta.restaurants_service.repository.FollowsRepository;
import kr.co.jhta.restaurants_service.security.service.UserService;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SocialService {
    private final Logger logger = Logger.getLogger(SocialService.class);

    private final FollowsRepository followsRepository;
    private final UserService userService;

    public SocialService(FollowsRepository followsRepository, UserService userService) {
        this.followsRepository = followsRepository;
        this.userService = userService;
    }

    public List<User> getFollowersByCustomerId(int customerId) {
        return followsRepository
                .findFollowsByCompositePrimaryKeys_FollowedId(customerId)
                .stream()
                .map(follow -> {
                    logger.info(follow.getCompositePrimaryKeys().getFollowerId());
                    return follow;
                })
                .map(follow -> follow.getCompositePrimaryKeys().getFollowerId())
                .map(followerId -> userService.findUserById(followerId))
                .collect(Collectors.toList());
    }
}
