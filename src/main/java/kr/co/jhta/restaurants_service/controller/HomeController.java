package kr.co.jhta.restaurants_service.controller;

import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.vo.post.Post;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomeController {
	
	public final PostService postService;

	
	@GetMapping
	public String home() {
		return "home";
	}
	
	@GetMapping("/contents")
	public String contents(Model model, @AuthenticationPrincipal SecurityUser securityUser) {
		List<Post> recentPosts = postService.getRecentPosts();
		List<Post> recentPostsOfFollowersByFollowed = new ArrayList<>();  // 초기화된 리스트 생성

	    if (securityUser != null && securityUser.getUser() != null) {
	        recentPostsOfFollowersByFollowed = postService.getRecentPostsThreeOfFollowersByFollowed(securityUser);
	        model.addAttribute("recentPostsOfFollower", recentPostsOfFollowersByFollowed);
	    }
		model.addAttribute("recentPosts", recentPosts);
		
		return "contents";
	}
}
