package kr.co.jhta.restaurants_service.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.restaurants_service.controller.command.ReviewDataCommand;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.vo.review.Review;
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
	public String review(Model model) {
		
		return "review";
	}
	
	// 리뷰 등록 요청 처리 
	@PostMapping
	public String reviewRegister(ReviewDataCommand form, @RequestParam int storeId, @RequestParam int customerId) {
	
		reviewService.createReview(form, storeId, customerId);
		log.info("리뷰 신규 등록 -> {}", form);
//		log.info("가게 아이디-> {}", storeId);
//		log.info("손님 아이디 -> {}", customerId);
		
		return "redirect:/store/detail";
	}
	
	@GetMapping("/detail")
	public String re(Model model) {
		 
//		 List<ReviewPicture> reviewPictures = reviewService.getReviewPicturesByReviewId(ReviewId);
//		 model.addAttribute("reviewPicture", reviewPictures);
		List<Review> reviews = reviewService.getAllReviews();
		 log.info("리뷰 -> {}", reviews);
		
		return "reviewDetail";
	}
	
	@GetMapping("/follower")
	public String followerReview(){
		return "followerReview";
	}

}
