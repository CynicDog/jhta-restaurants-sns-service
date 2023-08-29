package kr.co.jhta.restaurants_service.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dto.HomeContent;
import kr.co.jhta.restaurants_service.dto.HomeAnonymousFeed;
import kr.co.jhta.restaurants_service.mapper.HomeMapper;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@ToString
@RequiredArgsConstructor

public class HomeService {

	private final HomeMapper homeMapper;
	public List<HomeContent> getFeeds(int userId) {
		List<HomeContent> result = homeMapper.getHomeFeedsByFollowerId(userId);
		return result;
	}
	public List<HomeAnonymousFeed> getAnonymousFeeds() {
		List<HomeAnonymousFeed> result = homeMapper.getAnonymousFeeds();
		return result;
	}


}
