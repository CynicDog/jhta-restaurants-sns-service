package kr.co.jhta.restaurants_service.service;

import java.util.List;


// import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.restaurants_service.controller.command.ReviewDataCommand;
import kr.co.jhta.restaurants_service.mapper.ReviewKeywordMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewPictureMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewKeyword;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import kr.co.jhta.restaurants_service.vo.user.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewService {

	  @Autowired 
	  private ReviewMapper reviewMapper;
	  
	  @Autowired
	  private ReviewPictureMapper reviewPictureMapper;
	  
	  @Autowired
	  private ReviewKeywordMapper reviewKeywordMapper;
	  
	  @Autowired
	  private StoreMapper storeMapper;
	  
	  // 새 리뷰 등록하기
	  public void createReview(ReviewDataCommand form) {
		  
		  Review review = new Review();
		  ReviewPicture reviewPciture = new ReviewPicture();
		  ReviewKeyword reviewKeyword = new ReviewKeyword();
		  
		  review.setRating(form.getRating());
		  review.setContent(form.getContent());
		  review.setStore(storeMapper.getStoreById(form.getStoreId()));

		  User user = new User();
		  user.setId(76);
		  review.setCustomer(user);
		  
		  if (form.getKeyword() != null) {
			  reviewKeyword.setKeyword(form.getKeyword());			  
		  }
		  
		  if (form.getChooseFile() != null) {
			  MultipartFile chooseFile = form.getChooseFile();
			  reviewPciture.setPictureName(chooseFile.getOriginalFilename());
		  }
		  
//		  review.setRating(3);
//		  review.setContent("bbbbb");
//		  reviewPciture.setPictureName(null);
//		  reviewKeyword.setKeyword("청결해요");
//		  review.setStore(storeMapper.getStoreById(21));
		  
		  reviewMapper.insertReview(review);
		  reviewKeywordMapper.insertReveiwKeyword(reviewKeyword);
		  reviewPictureMapper.insertReveiwPicture(reviewPciture);
		  
		  
	  }
	  
	  public List<Review> getAllReviews() {
		  List<Review> reviews= reviewMapper.getAllReviews();
		  return reviews;
	  }
	 
	  // 리뷰아이디로 여러개의 리뷰사진 가져오기 
//	  public List<ReviewPicture> getReviewPicturesByReviewId(int ReviewId) {
//		  List<ReviewPicture> reviewPictures = reviewPictureMapper.getReviewPicturesByReviewId(ReviewId);
//		  List<ReviewPicture> reviewPicture = reviewPictures.stream()
//				  .map(review -> {
//					 review.setReview(reviewMapper.getReviewById(review.getReview().getId()));
//					 return review;
//				  }).collect(Collectors.toList());
		  
//		  return reviewPicture;
//	  }
	  
	
	
	
	
	
}	
