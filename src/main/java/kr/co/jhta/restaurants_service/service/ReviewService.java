package kr.co.jhta.restaurants_service.service;

import java.util.List;
import java.util.stream.Collectors;

// import java.util.stream.Collectors;

import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.ReviewRepository;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.restaurants_service.controller.command.ReviewCommentCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewDataCommand;
import kr.co.jhta.restaurants_service.dto.ReviewDetailDto;
import kr.co.jhta.restaurants_service.mapper.ReviewCommentMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewKeywordMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewPictureMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.repository.UserRepository;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewComment;
import kr.co.jhta.restaurants_service.vo.review.ReviewKeyword;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewService {

	@Autowired private ReviewMapper reviewMapper;

	@Autowired private ReviewPictureMapper reviewPictureMapper;

	@Autowired private ReviewCommentMapper reviewCommentMapper;

	@Autowired private ReviewKeywordMapper reviewKeywordMapper;

	@Autowired private StoreMapper storeMapper;

	@Autowired private UserRepository userRepository;

	@Autowired private ReviewRepository reviewRepository;

	// 새 리뷰 등록하기
	public void createReview(ReviewDataCommand form) {

		Review review = new Review();

		review.setRating(form.getRating());
		review.setContent(form.getContent());
		review.setStore(storeMapper.getStoreById(form.getStoreId()));
		review.setCustomer(userRepository.getReferenceById(form.getUserId()));

		reviewMapper.insertReview(review);

		if (form.getReviewKeyword() != null) {
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

	// 새 리뷰 답글 등록하기
	public void createReviewComment(ReviewCommentCommand form, SecurityUser securityUser) {
		ReviewComment reviewComment = new ReviewComment();
		
		reviewComment.setContent(form.getContent());

		Review review = reviewMapper.getReviewById(form.getReviewId());
		reviewComment.setReview(review);
		reviewComment.setOwner(securityUser.getUser());

		reviewCommentMapper.insertReviewComment(reviewComment);
	}

	public List<Review> getAllReviews(int customerId) {
		List<Review> reviews = reviewMapper.getAllReviewsByCustomerId(customerId);
		return reviews;
	}

	public ReviewDetailDto selectReview(int ReviewId){
		ReviewDetailDto dto = new ReviewDetailDto();

		Review review = reviewMapper.getReviewById(ReviewId);
		review.setStore(storeMapper.getStoreById(review.getStore().getId()));
		review.setCustomer(userRepository.getReferenceById(review.getCustomer().getId()));

		List<ReviewKeyword> reviewKeyword = reviewKeywordMapper.getReviewKeywordsByReviewId(ReviewId);

		List<Review> allReviewByCustomerId = reviewMapper.getAllReviewsByCustomerId(review.getCustomer().getId());
		Double reviewRatingByCustomerId = allReviewByCustomerId.stream().collect(Collectors.averagingDouble(rating -> rating.getRating()));
		
		dto.setReview(review);
		dto.setReviewKeywords(reviewKeyword);
		dto.setReviewRatingByCustomerId(reviewRatingByCustomerId);

		return dto;
	}
	
	public ReviewDetailDto getReivewsByStoreId(int storeId) {
		ReviewDetailDto reviewDto = new ReviewDetailDto();

		List<Review> getAllReviewsByStoreId = reviewMapper.getAllReviewByStoreId(storeId);
		List<Review> getAllReviewByStoreId = getAllReviewsByStoreId.stream().map(
				review -> {
					review.setStore(storeMapper.getStoreById(storeId));
					review.setCustomer(userRepository.getReferenceById(review.getCustomer().getId()));
					return review;
				}).collect(Collectors.toList());
		double allRatingByStoreId = getAllReviewByStoreId.stream().collect(Collectors.averagingDouble(rating -> rating.getRating())); 
		
		reviewDto.setStoreReviewAvg(allRatingByStoreId);
		reviewDto.setAllReviewsByStoreId(getAllReviewByStoreId);
		
		return reviewDto;
	}

//	  public List<Review> getAllReviews() {
//		  List<Review> reviews= reviewMapper.getAllReviews();
//		  return reviews;
//	  }

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

	public Page<Projection.Review> getNonBlockedReviewsByCustomerIdOrderByCreateDate(int customerId, Review.BLOCKED no, Integer page, Integer limit) {

		return reviewRepository.findReviewsByCustomerIdAndBlockedOrderByCreateDate(customerId, no, PageRequest.of(page, limit));
	}


}
