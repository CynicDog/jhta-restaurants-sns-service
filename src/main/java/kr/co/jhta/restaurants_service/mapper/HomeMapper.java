package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.dto.HomeAnonymousFeed;
import kr.co.jhta.restaurants_service.dto.HomeContent;

@Mapper
public interface HomeMapper {

	List<HomeContent> getHomeFeedsByFollowerId(int userId);

	List<HomeAnonymousFeed> getAnonymousFeeds();
}
