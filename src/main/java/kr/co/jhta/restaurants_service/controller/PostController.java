package kr.co.jhta.restaurants_service.controller;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;

import kr.co.jhta.restaurants_service.controller.command.PostCommand;
import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.vo.post.Post;
import org.jboss.logging.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.co.jhta.restaurants_service.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
@RequiredArgsConstructor
@Slf4j
public class PostController {

	public final Logger logger = Logger.getLogger(PostController.class);
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
	public ResponseEntity<String> insertPostData(
			MultipartFile chooseFile, int storeId, String content,
			HttpSession httpSession) throws IOException{

		List<PostDataCommand> postDataCommands = (List<PostDataCommand>) httpSession.getAttribute("postData");

		if (postDataCommands == null) {
			postDataCommands = new ArrayList<>();
		}

		postDataCommands.add(new PostDataCommand(chooseFile, storeId, content));

		httpSession.setAttribute("postData", postDataCommands);

		return ResponseEntity.ok().body("Success!");

		// if failed
		// `ResponseEntity.badRequest()
	}

	@ResponseBody
	@PostMapping("/register-post")
	public ResponseEntity insertPost(@RequestBody PostCommand postCommand,
									 @AuthenticationPrincipal SecurityUser securityUser,
									 HttpSession httpSession) throws IOException {

		List<PostDataCommand> postDataCommand = (List<PostDataCommand>) httpSession.getAttribute("postData");
		postService.insertPost(new Post(postCommand.getPostTitle(), postCommand.getPostSubtitle(), securityUser.getUser()), postDataCommand);

		// TODO: Exception handling in insertion operation
		httpSession.setAttribute("postData", null);

		// if no error
		return ResponseEntity.ok().body("Success!");
	}

	@GetMapping("/followerPost")
	public String followerPost() {
		return "post/followerPost";
	}

}
