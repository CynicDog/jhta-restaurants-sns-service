package kr.co.jhta.restaurants_service.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.form.ReviewData;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	// 리뷰 등록화면
	@GetMapping("")
	public String review(Model model) {
		
		return "review";
	}
	
	// 리뷰 등록 요청 처리 
	@PostMapping("")
	public String reviewRegister(ReviewData form) {
		
		reviewService.createReview(form);
		
		return "redirect:storeDetail";
	}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model) {
		 
//		 List<ReviewPicture> reviewPictures = reviewService.getReviewPicturesByReviewId(ReviewId);
//		 model.addAttribute("reviewPicture", reviewPictures);
		
		return "reviewDetail";
	}
	
	@GetMapping("/follower")
	public String followerReview(){
		return "followerReview";
	}
}
