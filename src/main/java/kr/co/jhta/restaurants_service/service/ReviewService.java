package kr.co.jhta.restaurants_service.service;

import java.util.Date;
import java.util.List;


import java.util.stream.Collectors;

// import java.util.stream.Collectors;

import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.ReviewPictureRepository;
import kr.co.jhta.restaurants_service.repository.ReviewRepository;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.restaurants_service.controller.command.ReviewCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewCommentCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewReportCommand;
import kr.co.jhta.restaurants_service.dto.ReviewDetailDto;
import kr.co.jhta.restaurants_service.dto.ReviewDto;
//import kr.co.jhta.restaurants_service.dto.ReviewListDto;
import kr.co.jhta.restaurants_service.dto.ReviewSummaryDto;
import kr.co.jhta.restaurants_service.mapper.ReviewCommentMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewKeywordMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewPictureMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewReportMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.repository.UserRepository;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewComment;
import kr.co.jhta.restaurants_service.vo.review.ReviewKeyword;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import kr.co.jhta.restaurants_service.vo.review.ReviewReport;
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

	@Autowired private ReviewPictureRepository reviewPictureRepository;
	
	@Autowired private ReviewReportMapper reviewReportMapper;

	private final Logger logger = Logger.getLogger(PostService.class);

	// 새 리뷰 등록하기
	public void createReview(ReviewCommand form, SecurityUser securityUser) {

		Review review = new Review();

		review.setRating(form.getRating());
		review.setContent(form.getContent());
		review.setStore(storeMapper.getStoreById(form.getStoreId()));
		review.setCustomer(userRepository.getReferenceById(securityUser.getUser().getId()));
		review.setCreateDate(new Date());

		reviewMapper.insertReview(review);

		if (form.getReviewKeyword() != null) {
			for (String keyword : form.getReviewKeyword()) {
				ReviewKeyword reviewKeyword = new ReviewKeyword();
				reviewKeyword.setKeyword(keyword);
				reviewKeyword.setReview(review);
				reviewKeywordMapper.insertReveiwKeyword(reviewKeyword);
			}
		}
		
		if (form.getChooseFile() != null) {
			for (MultipartFile fileName : form.getChooseFile()) {
				ReviewPicture reviewPicture = new ReviewPicture();
				reviewPicture.setPictureName(fileName.getOriginalFilename());
				reviewPicture.setReview(review);
				reviewPicture.setUser(securityUser.getUser());
				reviewPicture.setCreateDate(new Date());
				reviewPictureMapper.insertReveiwPicture(reviewPicture);
			}
		}		

//		if (!form.getChooseFile().isEmpty()) {
//			ReviewPicture reviewPciture = new ReviewPicture();
//			MultipartFile chooseFile = form.getChooseFile();
//			reviewPciture.setPictureName(chooseFile.getOriginalFilename());
//			reviewPciture.setReview(review);
//			reviewPictureMapper.insertReveiwPicture(reviewPciture);
//		}

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
		
		List<ReviewPicture> reviewPictures = reviewPictureMapper.getReviewPicturesByReviewId(ReviewId);
		
		dto.setReview(review);
		dto.setReviewKeywords(reviewKeyword);
		dto.setReviewRatingByCustomerId(reviewRatingByCustomerId);
		dto.setReviewPicturesByReviewId(reviewPictures);

		return dto;
	}
	
	public void createReviewReport(ReviewReportCommand form, SecurityUser securityUser) {
		ReviewReport reviewReport = new ReviewReport();
		
		 // 문자열 값을 enum 값으로 변환
	    ReviewReport.CATEGORY categoryEnum = ReviewReport.CATEGORY.valueOf(form.getCategory());
	    reviewReport.setCategory(categoryEnum);
	    reviewReport.setContent(form.getContent());
	    reviewReport.setCreateDate(new Date());
		reviewReport.setReporter(securityUser.getUser());
		reviewReport.setReview(reviewMapper.getReviewById(form.getReviewId()));
	    
	    reviewReportMapper.insertReveiwReport(reviewReport);
		
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

		return reviewRepository.findReviewsByCustomerIdAndBlockedOrderByCreateDateDesc(customerId, no, PageRequest.of(page, limit));
	}


	public long getReviewsCountByCustomerId(Integer customerId) {

		return reviewRepository.countByCustomerId(customerId);
	}

//	public ReviewDetailDto getReivewsByStoreId(int storeId) {
//		ReviewDetailDto reviewDto = new ReviewDetailDto();

//		List<Review> getAllReviewsByStoreId = reviewMapper.getAllReviewByStoreId(storeId);	
		
//		List<Review> allReviewsByStoreId = getAllReviewsByStoreId.stream().map(
//				review -> {
//					review.setCustomer(userRepository.getReferenceById(review.getCustomer().getId()));
//					return review;
//				}).collect(Collectors.toList());
//		double allRatingByStoreId = allReviewsByStoreId.stream().collect(Collectors.averagingDouble(rating -> rating.getRating())); 
		
//		reviewDto.setStoreReviewAvg(allRatingByStoreId);
//		reviewDto.setAllReviewsByStoreId(getAllReviewsByStoreId);
		
//		return reviewDto;
//	}
	
	// 가게별 리뷰 평균 가져오기 
	public ReviewDetailDto getRatingAvgByStoreId(int storeId) {
		ReviewDetailDto reviewDetailDto = new ReviewDetailDto();
		
		int reviewCount = storeMapper.getReviewCountByStoreId(storeId);
		int bookmarkCount = storeMapper.getBookmarkCountByStoreId(storeId);
		
		List<Review> getAllReviewsByStoreId = reviewMapper.getAllReviewsByStoreId(storeId);	
		double storeReviewAvg = getAllReviewsByStoreId.stream().collect(Collectors.averagingDouble(rating -> rating.getRating()));
		
		reviewDetailDto.setStoreReviewAvg(storeReviewAvg);
		reviewDetailDto.setReviewCount(reviewCount);
		reviewDetailDto.setBookmarkCount(bookmarkCount);
		
		return reviewDetailDto;
	}
	
	// 가게별 전체 리뷰 가져오기 
//	public List<ReviewDto> getReivewsByStoreId(int storeId) {

//		List<ReviewDto> getAllReviewsByStoreId = reviewMapper.getAllReviewsByStoreId(storeId);	
		
//		return getAllReviewsByStoreId;
//	}
	
	// 리뷰 rating가져오기
	public ReviewSummaryDto getAllReviewRatingByStoreId(int storeId) {
		ReviewSummaryDto reviewRating = reviewMapper.getAllReviewRatingByStoreId(storeId);
		return reviewRating;
	}

    public List<ReviewDto> getReviewsPaginatedByStoreId(int page, int limit, int storeId, String option) {

		int begin = (page - 1) * limit;
		int end = begin + limit;

		if (option.equals("all")) {
			return reviewMapper.getReviewsPaginatedByStoreId(begin, end, storeId);
		} else if (option.equals("good")) {
			return reviewMapper.getReviewsPaginatedByStoreIdAndRating(begin, end, storeId, 5);
		} else if (option.equals("soso")) {
			return reviewMapper.getReviewsPaginatedByStoreIdAndRating(begin, end, storeId, 3);
		} else { // bad
			return reviewMapper.getReviewsPaginatedByStoreIdAndRating(begin, end, storeId, 1);
		}
    }
    
    public List<Review> getThreeRecentReview(){
    	List<Review> reviews = reviewMapper.getThreeRecentReivews();
    	
    	return reviews;
    }
    
    public List<Review> getThreeFollowerReview(SecurityUser securityUser){
    	List<Review> reviews = reviewMapper.getThreeFollowerReivews(securityUser.getUser().getId());
    	
    	return reviews;
    }
    
    public List<Review> getAllReviewsPaginated(int page, int limit){
    	int start = (page - 1) * limit;
		int end = start + limit;
		
		return reviewMapper.getAllReivewsPaginated(start, end);
    }
    
    public List<Review> getFollowerReviewsPaginated(int page, int limit, SecurityUser securityUser){
    	int start = (page - 1) * limit;
		int end = start + limit;
		
		return reviewMapper.getFollowerReivewsPaginated(start, end, securityUser.getUser().getId());
    }

    public Page<ReviewPicture> getReviewPicturesByCustomerIdOrderByCreateDateDesc(int customerId, Integer page, Integer limit) {

		return reviewPictureRepository.findByUserIdOrderByCreateDateDesc(customerId, PageRequest.of(page, limit));
    }
}
