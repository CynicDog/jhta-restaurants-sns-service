package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("")
	public String Post() {
		return "post/posting";
	}
	
	@GetMapping("/postRegFormPageFirst")
	public String RegFormFirst() {
		return "post/postRegFormPageFirst";
	}
	
}
