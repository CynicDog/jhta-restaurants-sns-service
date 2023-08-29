package kr.co.jhta.restaurants_service.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
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

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
@Slf4j
public class HomeController {
	
	private final HomeService homeService;
	
	
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
}
