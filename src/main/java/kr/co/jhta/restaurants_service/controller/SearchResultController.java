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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.restaurants_service.dto.PagedStores;
import kr.co.jhta.restaurants_service.service.StoreService;
import kr.co.jhta.restaurants_service.util.FormatUtils;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/search")
@Slf4j
public class SearchResultController {

	private final StoreService storeService;

	@GetMapping("/stores")
	@ResponseBody
	public PagedStores searchResult(
							   @RequestParam(name="sort", required = false, defaultValue="rating") String sort,
							   @RequestParam(name="page", required = false, defaultValue="1") int page,
							   @RequestParam(name="category", required = false, defaultValue="") String category,
							   @RequestParam(name="keyword", required = false, defaultValue="") String keyword,
							   @RequestParam(name="xStart", required = false) Double xStart,
							   @RequestParam(name="xEnd", required = false) Double xEnd,
							   @RequestParam(name="yStart", required = false) Double yStart,
							   @RequestParam(name="yEnd", required = false) Double yEnd) {
		log.info("sort='{}', page='{}', category='{}', keyword='{}'", sort, page, category, keyword);
		log.info("xStart='{}', xEnd='{}', yStart='{}', yEnd='{}'", xStart, xEnd, yStart, yEnd);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("sort", sort);
		param.put("page", page);
		
		if(xStart!= null) {
			log.info("xStart='{}', xEnd='{}', yStart='{}', yEnd='{}'", xStart, xEnd, yStart, yEnd);

			param.put("xStart", xStart);
			param.put("xEnd", xEnd);
			param.put("yStart", yStart);
			param.put("yEnd", yEnd);
		}

		if (StringUtils.hasText(keyword)) {
			param.put("keyword", keyword);
		}
		if (StringUtils.hasText(category)) {
			param.put("category", category);
		}
		
		return storeService.getStores(param);

	}

	@GetMapping("/list")
	public String search(@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
						 Model model) {
		model.addAttribute("keyword",keyword);

		return "search";
	}
	



}
