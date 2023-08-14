package kr.co.jhta.restaurants_service.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

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
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
@Slf4j
public class PostController {

	public final Logger logger = Logger.getLogger(PostController.class);
	public final PostService postService;
	
	public PostController(PostService postService) {
		this.postService = postService;
	}

	@GetMapping("")
	public String Post() {
		return "post/posting";
	}

	@GetMapping("/register")
	public String RegFormFirst() {
		return "post/register";
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/register-post-data")
	public ResponseEntity<String> insertPostData(
			MultipartFile chooseFile, int storeId, String content, @RequestParam(name = "data-id") int toBeDeleted,
			HttpSession httpSession) throws IOException{

		List<PostDataCommand> postDataCommands = (List<PostDataCommand>) httpSession.getAttribute("postData");

		if (postDataCommands == null) {
			postDataCommands = new ArrayList<>();
		}

		postDataCommands.add(new PostDataCommand(chooseFile, storeId, content, toBeDeleted));

		httpSession.setAttribute("postData", postDataCommands);
		
		System.out.println("저장 후 ----------------" + postDataCommands);
		return ResponseEntity.ok().body("Success!");

		// if failed
		// `ResponseEntity.badRequest()
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/delete-post-data")
	public ResponseEntity<String> deletePostData(
			@RequestParam(name = "data-id") int toBeDeleted, 
			HttpSession httpSession) throws IOException{

		    List<PostDataCommand> postDataList = (List<PostDataCommand>) httpSession.getAttribute("postData");
		    PostDataCommand toDelete = postDataList.stream()
		                                            .filter(postData -> postData.getDataId() == toBeDeleted)
		                                            .findFirst()
		                                            .orElse(null);

		    if (toDelete != null) {
		        postDataList.remove(toDelete); // 해당 데이터 삭제
		        // 성공적으로 삭제한 경우
		        return ResponseEntity.ok("Data deleted successfully");
		    } else {
		        // 해당 데이터를 찾을 수 없는 경우
		        return ResponseEntity.badRequest().body("Data not found");
		    }

	}

	@ResponseBody
	@PostMapping("/register-post")
	public ResponseEntity<String> insertPost(@RequestBody PostCommand postCommand,
									 @AuthenticationPrincipal SecurityUser securityUser,
									 HttpSession httpSession) throws IOException {

		@SuppressWarnings("unchecked")
		List<PostDataCommand> postDataCommand = (List<PostDataCommand>) httpSession.getAttribute("postData");
		postService.insertPost(new Post(postCommand.getPostTitle(), postCommand.getPostSubtitle(), securityUser.getUser()), postDataCommand);

		// TODO: Exception handling in insertion operation
		httpSession.setAttribute("postData", null);

		return ResponseEntity.ok().body("Success!");
	}

	@GetMapping("/followerPost")
	public String followerPost() {
		return "post/followerPost";
	}

}
