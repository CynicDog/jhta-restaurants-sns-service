package kr.co.jhta.restaurants_service.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.review.Review;

@Mapper
public interface ReviewMapper {

	void insertReview(Review review);
	Review getReviewById(int id);
	Review getReviewByCustomerId(int customerId);
	Review getReviewByStoreId(int storeId);
	List<Review> getAllReviews();
	
}
