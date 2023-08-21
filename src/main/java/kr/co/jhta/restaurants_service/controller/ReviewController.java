package kr.co.jhta.restaurants_service.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.restaurants_service.controller.command.ReviewCommentCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewDataCommand;
import kr.co.jhta.restaurants_service.dto.ReviewDetailDto;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewKeyword;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	

	// 리뷰 등록화면
	@PreAuthorize("isAuthenticated()")
	@GetMapping
	public String review(Model model, @RequestParam("storeId") int storeId ) {
		
		return "review";
	}
	
	// 리뷰 등록 요청 처리 
	@PostMapping
	public String reviewRegister(ReviewDataCommand form) throws IOException {
	
		reviewService.createReview(form);
		log.info("리뷰 신규 등록 -> {}", form);
		log.info("리뷰 키워드 -> {}", form.getReviewKeyword());
//		log.info("가게 아이디-> {}", storeId);
//		log.info("손님 아이디 -> {}", customerId);
		
		return "redirect:/store/storeDetail?storeId=" + form.getStoreId();
	}
	
	// 리뷰 답글 등록 요청 처리
		@PostMapping("/register")
		public String reviewCommentRegister(int storeId, ReviewCommentCommand form, @AuthenticationPrincipal SecurityUser securityUser) {
			reviewService.createReviewComment(form, securityUser);
			
			return "redirect:/store/detail?id=" + storeId;
		}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model) {
		 
		int reviewId = 101;
		ReviewDetailDto dto = reviewService.selectReview(reviewId);
		model.addAttribute("review", dto);
//		log.info("리뷰 -> {}", dto.getReview().getCustomer().getFullName());
//		log.info("리뷰 -> {}", dto.getReviewKeywords().get(0).getKeyword());
//		log.info("리뷰 -> {}", dto.getReviewKeywords().get(1).getKeyword());
//		log.info("리뷰 -> {}", dto.getReview().getRating());
//		log.info("리뷰 -> {}", dto.getReview().getContent());
//		log.info("리뷰 -> {}", dto.getReview().getStore().getAddress());
		log.info("리뷰 -> {}", dto.getReviewRatingByCustomerId());
		
		return "reviewDetail";
	}
	
	@GetMapping("/follower")
	public String followerReview(){
		return "followerReview";
	}

}
