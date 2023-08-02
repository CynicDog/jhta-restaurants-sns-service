package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

	@GetMapping("/review")
	public String review(Model model) {
		
		return "review";
	}
	
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model) {
		
		return "reviewDetail";
	}
}
