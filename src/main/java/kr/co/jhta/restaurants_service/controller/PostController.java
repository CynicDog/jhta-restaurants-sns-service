package kr.co.jhta.restaurants_service.controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.form.PostData;
import kr.co.jhta.restaurants_service.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/post")
@RequiredArgsConstructor
@Slf4j
public class PostController {

	public final PostService postService;
	
	@GetMapping("")
	public String Post() {
		return "post/posting";
	}
	
	@GetMapping("/register")
	public String RegFormFirst() {
		return "post/register";
	}
	
//	@PostMapping("/register")
//	public List<PostData> insertPost(String title, String subTitle, List<PostData> postData){
//		List<PostData> savedPostDataList = new ArrayList<>();
//
//        
//        PostData savedPostData = postService.insertPosts(title, subTitle, postData);
//        savedPostDataList.add(savedPostData);
//        
//
//        return savedPostDataList;
//	}
	
	@GetMapping("/followerPost")
	public String followerPost() {
		return "post/followerPost";
	}
	
}
