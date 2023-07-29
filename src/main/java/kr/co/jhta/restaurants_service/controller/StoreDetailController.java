package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreDetailController {

	@GetMapping("/storeDetail")
	public String storeDetail(Model model) {
		
		return "storeDetail";
	}
}
