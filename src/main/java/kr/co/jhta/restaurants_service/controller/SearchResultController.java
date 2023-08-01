package kr.co.jhta.restaurants_service.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jhta.restaurants_service.service.StoreService;
import kr.co.jhta.restaurants_service.service.TestService;
import kr.co.jhta.restaurants_service.vo.Store;
import kr.co.jhta.restaurants_service.vo.Test;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

public class SearchResultController {

	private final TestService testService;
	private final StoreService storeService;
	
	@GetMapping("/search")
	public String searchResult(Model model) {
		List<Store> stores = storeService.getAllStores();
		model.addAttribute("stores", stores);
		
		return "search";
	}
	
	
	
}
