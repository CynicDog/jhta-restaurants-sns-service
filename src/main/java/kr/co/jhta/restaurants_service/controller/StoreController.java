package kr.co.jhta.restaurants_service.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.restaurants_service.dto.PagedStores;
import kr.co.jhta.restaurants_service.dto.ReviewDetailDto;
import kr.co.jhta.restaurants_service.dto.StoreDetailDto;
import kr.co.jhta.restaurants_service.service.ReviewService;
import kr.co.jhta.restaurants_service.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
@Slf4j
public class StoreController {

	public static final String SEARCH = "/store/search";
	private final StoreService storeService;
	private final ReviewService reviewService;

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

	@GetMapping("/search")
	public String search(@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
						 Model model) {
		model.addAttribute("keyword",keyword);

		return "search";
	}

	
	@GetMapping("/storeDetail")
    public String detail(@RequestParam int storeId, Model model) {
        StoreDetailDto dto = storeService.getStoreDetail(storeId);
        ReviewDetailDto reviewDto = reviewService.getReivewsByStoreId(storeId);
        // 모델에 가게 정보를 추가합니다.
        model.addAttribute("store", dto.getStore());
        model.addAttribute("foods", dto.getFoods());
        model.addAttribute("storeOpenTimes", dto.getOpenTimes());
        
        // 모델에 리뷰 정보를 추가합니다.
        model.addAttribute("review", reviewDto.getAllReviewsByStoreId());
        model.addAttribute("storeAvg", reviewDto.getStoreReviewAvg());
//        log.info("리뷰 -> [] ", reviewDto.getAllReviewsByStoreId().get(0).getCustomer().getFullName());
//        log.info("가게 평점 -> [] ", reviewDto.getStoreReviewAvg());
        log.info("스토어 -> {}", reviewDto.getAllReviewsByStoreId().get(0).getCustomer().getFullName());
        return "storeDetail";
    }
}
