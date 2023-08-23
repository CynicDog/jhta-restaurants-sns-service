package kr.co.jhta.restaurants_service.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bookmark")
@Slf4j
public class BookmarkController {
	private final BookmarkService bookmarkService;

	@GetMapping("/insert")
	@ResponseBody
	public void insertBookmark(@AuthenticationPrincipal SecurityUser user, int storeId) {
		bookmarkService.insertBookmark(user.getUser().getId(), storeId);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public void deleteBookmark(@AuthenticationPrincipal SecurityUser user, int storeId) {
		bookmarkService.deleteBookmark(user.getUser().getId(),storeId);
	}
	
}
