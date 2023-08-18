package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.review.ReviewComment;

@Mapper
public interface ReviewCommentMapper {

	void insertReviewComment(ReviewComment reviewComment);
	List<ReviewComment> getReviewCommentByReviewId(int reviewId);
}
