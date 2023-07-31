package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.restaurants_service.service.TestService;
import kr.co.jhta.restaurants_service.vo.Test;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

public class SearchResultController {

	private final TestService testService;
	
	@GetMapping("/search")
	public String searchResult(Model model) {
		model.addAttribute("store", "가게 정보");
		
		Test test = new Test();
		test.setId(11);
		test.setName("park");
		testService.insertTest(test);
		
		return "search";
	}
	
	
	
}
