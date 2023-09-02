package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.service.HomeService;
import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/message")
@Slf4j
public class MessageController {
	
	
	@GetMapping
	public String message() {
		return "message";
	}
	
	
}
