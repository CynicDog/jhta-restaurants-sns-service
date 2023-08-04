package kr.co.jhta.restaurants_service.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.restaurants_service.dto.StoresPage;
import kr.co.jhta.restaurants_service.service.StoreService;
import kr.co.jhta.restaurants_service.vo.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/search")
@Slf4j
public class SearchResultController {
	
	private final StoreService storeService;
	
//	@GetMapping("/list")
//	public String searchResult(@RequestParam(name="sort", required = false, defaultValue="rating") String sort,
//							   @RequestParam(name="page", required = false, defaultValue="1") int page,
//							   @RequestParam(name="category", required = false, defaultValue="") String category,
//							   @RequestParam(name="keyword", required = false, defaultValue="") String keyword,
//							   Model model) {
//		log.info("sort='{}', page='{}', category='{}', keyword='{}'", sort, page, category, keyword);
//
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("sort", sort);
//		param.put("page", page);
//		
//		if (StringUtils.hasText(keyword)) {
//			param.put("keyword", keyword);
//		}
//		if (StringUtils.hasText(category)) {
//			param.put("category", category);
//		}
//		
//		
//		StoresPage result = storeService.getStores(param);
//		
//		model.addAttribute("result",result);
//		
//		return "search";
//	}
	
	@GetMapping("/list")
	public String searchBasic(Model model) {
		
		List<Store> stores = storeService.getAllStores();
		model.addAttribute("stores", stores);
		return "search";
	}
	

	
}
