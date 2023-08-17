package kr.co.jhta.restaurants_service.service;

import java.security.Principal;
import java.util.List;


// import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;

import kr.co.jhta.restaurants_service.controller.command.ReviewDataCommand;
import kr.co.jhta.restaurants_service.mapper.ReviewKeywordMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewPictureMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.UserMapper;
import kr.co.jhta.restaurants_service.repository.UserRepository;
import kr.co.jhta.restaurants_service.security.service.UserService;
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
	  
	  @Autowired
	  private UserRepository userRepository;
	  
	  // 새 리뷰 등록하기
	  public void createReview(ReviewDataCommand form) {
		  
		  Review review = new Review();
		  
		  review.setRating(form.getRating());
		  review.setContent(form.getContent());
		  review.setStore(storeMapper.getStoreById(form.getStoreId()));
		  review.setCustomer(userRepository.getReferenceById(form.getUserId()));
		  
		  reviewMapper.insertReview(review);
		  
		  if(form.getReviewKeyword() != null) {
			  for (String keyword : form.getReviewKeyword()) {
				  ReviewKeyword reviewKeyword = new ReviewKeyword();
				  reviewKeyword.setKeyword(keyword);	
				  reviewKeyword.setReview(review);
				  reviewKeywordMapper.insertReveiwKeyword(reviewKeyword);
			  }
		  }
		  
		  if (!form.getChooseFile().isEmpty()) {
			  ReviewPicture reviewPciture = new ReviewPicture();
			  MultipartFile chooseFile = form.getChooseFile();
			  reviewPciture.setPictureName(chooseFile.getOriginalFilename());
			  reviewPciture.setReview(review);
			  reviewPictureMapper.insertReveiwPicture(reviewPciture);
		  }
		  
//		  review.setRating(3);
//		  review.setContent("bbbbb");
//		  reviewPciture.setPictureName(null);
//		  reviewKeyword.setKeyword("청결해요");
//		  review.setStore(storeMapper.getStoreById(21));
		  
		  
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
