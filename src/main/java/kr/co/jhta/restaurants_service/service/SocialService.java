package kr.co.jhta.restaurants_service.service;

import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.FollowsRepository;
import kr.co.jhta.restaurants_service.repository.UserRepository;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.jboss.logging.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SocialService {
    private final Logger logger = Logger.getLogger(SocialService.class);

    private final FollowsRepository followsRepository;
    private final UserRepository userRepository;

    public SocialService(FollowsRepository followsRepository, UserRepository userRepository) {
        this.followsRepository = followsRepository;
        this.userRepository = userRepository;
    }

    public List<Projection.User> getNonDisabledFollowersByCustomerIdOrderByCreateDate(int customerId, User.DISABLED disabled, Integer page, Integer limit) {

        return followsRepository
                .findFollowsByCompositePrimaryKeys_FollowedIdOrderByCreateDateDesc(customerId, PageRequest.of(page, limit))
                .stream()
                .map(follow -> follow.getCompositePrimaryKeys().getFollowerId())
                .map(followerId -> userRepository.findUserProjectionByIdAndDisabled(followerId, disabled))
                .collect(Collectors.toList());
    }
}
