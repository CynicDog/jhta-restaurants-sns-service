package kr.co.jhta.restaurants_service.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewPictureMapper;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class ReviewService {

	  @Autowired 
	  private ReviewMapper reviewMapper;
	  
	  @Autowired
	  private ReviewPictureMapper reviewPictureMapper;
	  
	  public List<ReviewPicture> getReviewPicturesByReviewId(int ReviewId) {
		  List<ReviewPicture> reviewPictures = reviewPictureMapper.getReviewPicturesByReviewId(ReviewId);
		  List<ReviewPicture> reviewPicture = reviewPictures.stream()
				  .map(review -> {
					 review.setReview(reviewMapper.getReviewById(review.getReview().getId()));
					 return review;
				  }).collect(Collectors.toList());
		  
		  return reviewPicture;
	  }
	  
	
	
	
	
	
}	
