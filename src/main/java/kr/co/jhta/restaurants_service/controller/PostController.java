package kr.co.jhta.restaurants_service.controller;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;

import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.co.jhta.restaurants_service.form.AddPostForm;
import kr.co.jhta.restaurants_service.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

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

	@ResponseBody
	@PostMapping("/register-post-data")
	public ResponseEntity insertPostData(PostDataCommand postDataCommand, HttpSession httpSession) throws IOException{

		List<PostDataCommand> postDataCommands = (List<PostDataCommand>) httpSession.getAttribute("postData");

		if (postDataCommands.size() == 0) {
			postDataCommands = new ArrayList<>();
		}

		postDataCommands.add(postDataCommand);

		httpSession.setAttribute("postData", postDataCommands);

		return ResponseEntity.ok().body("Success!");
	}

	@PostMapping("/register-post")
	public String insertPost(@RequestParam("title") String title,
							 @RequestParam("subTitle") String subTitle,
							 @AuthenticationPrincipal SecurityUser securityUser,
							 HttpSession httpSession) throws IOException {

		List<PostDataCommand> postDataCommand = (List<PostDataCommand>) httpSession.getAttribute("postData");

		postService.insertPost(new Post(title, subTitle, securityUser.getUser()), postDataCommand);

		// TODO: Session Clear

		return null;
	}

	@GetMapping("/followerPost")
	public String followerPost() {
		return "post/followerPost";
	}

}
