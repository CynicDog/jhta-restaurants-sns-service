package kr.co.jhta.restaurants_service.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.store.Store;

@Mapper
public interface ReviewMapper {

	void insertReview(Review review);
	Review getReviewById(int id);
	Review getReviewByCustomerId(int customerId);
	
}
