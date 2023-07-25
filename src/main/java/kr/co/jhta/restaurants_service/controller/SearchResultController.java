package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchResultController {

	@GetMapping("/search")
	public String searchResult(Model model) {
		model.addAttribute("store", "가게 정보");
		return "search";
	}
}
