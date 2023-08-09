package kr.co.jhta.restaurants_service.controller;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.restaurants_service.form.AddPostForm;
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
	
	@PostMapping("/register")
	public String insertPost(AddPostForm form) throws IOException{
		postService.insertPost(form);
		
		return "redirect:post/register";
	}
	
	@GetMapping("/followerPost")
	public String followerPost() {
		return "post/followerPost";
	}
	
}
