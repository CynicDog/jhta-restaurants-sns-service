package kr.co.jhta.restaurants_service.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.Review;

@Mapper
public interface ReviewMapper {

	Review getReviewByNo(int id);
	Review getReviewByUserId(int customerId);
	
}
