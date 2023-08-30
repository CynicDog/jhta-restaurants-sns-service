package kr.co.jhta.restaurants_service.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewLikeMapper {

	void insertLike(int customerId, int reviewId);

	void deleteLike(int customerId, int reviewId);

}