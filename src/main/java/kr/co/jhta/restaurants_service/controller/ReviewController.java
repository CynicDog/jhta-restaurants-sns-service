package kr.co.jhta.restaurants_service.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.vo.review.ReviewPicture;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@GetMapping("")
	public String review(Model model) {
		
		return "review";
	}
	
	@GetMapping("/detail")
	public String reviewDetail(Model model, int ReviewId) {
		 
		 List<ReviewPicture> reviewPictures = reviewService.getReviewPicturesByReviewId(ReviewId);
		 model.addAttribute("reviewPicture", reviewPictures);
		
		return "reviewDetail";
	}
	
	@GetMapping("/follower")
	public String followerReview(){
		return "followerReview";
	}
}
