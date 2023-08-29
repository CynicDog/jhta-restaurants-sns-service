package kr.co.jhta.restaurants_service.controller;
import java.util.List;
import java.util.ArrayList;
import java.util.List;
import org.jboss.logging.Logger;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.restaurants_service.dto.HomeContent;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.HomeService;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
//import kr.co.jhta.restaurants_service.dto.ReviewListDto;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.review.Review;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
@Slf4j
public class HomeController {
	private final HomeService homeService;
	public final PostService postService;
	public final ReviewService reviewService;
	

	@GetMapping
	public String home() {
		return "home";
	}
	

	@GetMapping("/feed")
	@ResponseBody
	public List<HomeContent> getHomeFeeds(@AuthenticationPrincipal SecurityUser user){
		
		List<HomeContent> result = homeService.getFeeds(user.getUser().getId());
		
		return result;
  }

	@GetMapping("/contents")
	public String contents(Model model, @AuthenticationPrincipal SecurityUser securityUser) {
		List<Post> recentPosts = postService.getThreeRecentPosts();
		List<Post> recentPostsOfFollowersByFollowed = new ArrayList<>();  // 초기화된 리스트 생성
		List<Review> recentReviews = reviewService.getThreeRecentReview();
		List<Review> recentFollowerReivews = new ArrayList<>();

		for(Review review : recentReviews) {
    		System.out.println(review.getStore().getName());
    	}
		
	    if (securityUser != null && securityUser.getUser() != null) {
	        recentPostsOfFollowersByFollowed = postService.getRecentPostsThreeOfFollowersByFollowed(securityUser);
	        model.addAttribute("recentPostsOfFollower", recentPostsOfFollowersByFollowed);
	    }
	    if (securityUser != null && securityUser.getUser() != null) {
	    	recentFollowerReivews = reviewService.getThreeFollowerReview(securityUser);
	        model.addAttribute("recentFollowerReivews", recentFollowerReivews);
	    }
	    
		model.addAttribute("recentPosts", recentPosts);
		model.addAttribute("recentReviews", recentReviews);
		return "contents";

	}
}
