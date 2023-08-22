package kr.co.jhta.restaurants_service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bookmark")
@Slf4j
public class BookmarkController {
	private final BookmarkService bookmarkService;

	@GetMapping("")
	public void insertBookmark(int customerId, int storeId) {
		bookmarkService.insertBookmark(customerId,storeId);
	}
}
