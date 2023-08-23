package kr.co.jhta.restaurants_service.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import kr.co.jhta.restaurants_service.controller.command.PostCommand;
import kr.co.jhta.restaurants_service.controller.command.PostCommentCommand;
import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewCommentCommand;
import kr.co.jhta.restaurants_service.dto.PostDto;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostComment;
import kr.co.jhta.restaurants_service.vo.store.Store;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.co.jhta.restaurants_service.service.PostService;
import kr.co.jhta.restaurants_service.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
@Slf4j
@RequiredArgsConstructor
public class PostController {

    public final Logger logger = Logger.getLogger(PostController.class);
    public final PostService postService;
    public final StoreService storeService;
    private final Storage storage;

    @GetMapping("")
    public String Post(int id, Model model) {

        PostDto dto = postService.selectPost(id);
        model.addAttribute("post", dto);

        return "post/posting";
    }

    @GetMapping("/register")
    public String RegFormFirst(Model model) {
        List<Store> store = storeService.getAllStores();
        model.addAttribute("store", store);

        return "post/register";
    }


    @ResponseBody
    @GetMapping("/getStores")
    public List<Store> getStores(@RequestParam String keyword) {
        return postService.getStoresByKeyword(keyword);
    }


    @SuppressWarnings("unchecked")
    @ResponseBody
    @PostMapping("/register-post-data")
    public ResponseEntity<String> insertPostData(MultipartFile chooseFile, int storeId, String content, @RequestParam(name = "data-id") int toBeDeleted, HttpSession httpSession) throws IOException {

        try {
            String bucketName = "jhta-restaurant-service";
            String objectName = "post/" + chooseFile.getOriginalFilename();

            BlobId blobId = BlobId.of(bucketName, objectName);
            BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType(chooseFile.getContentType()).build();

            Blob blob = storage.create(blobInfo, chooseFile.getBytes());

        } catch (IOException e) {
            e.printStackTrace();
        }

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
    public ResponseEntity<String> deletePostData(@RequestParam(name = "data-id") int toBeDeleted, HttpSession httpSession) throws IOException {

        List<PostDataCommand> postDataList = (List<PostDataCommand>) httpSession.getAttribute("postData");
        PostDataCommand toDelete = postDataList.stream().filter(postData -> postData.getDataId() == toBeDeleted).findFirst().orElse(null);

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
    public ResponseEntity<String> insertPost(@RequestBody PostCommand postCommand, @AuthenticationPrincipal SecurityUser securityUser, HttpSession httpSession) throws IOException {

        @SuppressWarnings("unchecked") List<PostDataCommand> postDataCommands = (List<PostDataCommand>) httpSession.getAttribute("postData");

        postService.insertPost(new Post(postCommand.getPostTitle(), postCommand.getPostSubtitle(), securityUser.getUser()), postDataCommands);

        httpSession.setAttribute("postData", null);

        return ResponseEntity.ok().body("Success!");
    }

    @GetMapping("/followerPost/detail")
    public String followerPost(@RequestParam("id") int id, Model model) {
        PostDto dto = postService.selectPost(id);
        model.addAttribute("post", dto);

        return "post/posting";
    }

    @GetMapping("/followerPost")
    public String followerPost() {

        return "post/followerPost";
    }
    
    @PostMapping("/CommentRegister")
	public String PostCommentRegister(PostCommentCommand form, @AuthenticationPrincipal SecurityUser securityUser) throws IOException {
    	log.info("포스트 아이디 -> {}", form.getPostId());
    	log.info("댓글 신규 등록 -> {}", form.getContent());
    	log.info("유저 아이디 -> {}", form.getUserId());
    	postService.insertPostComment(form, securityUser);
		return "redirect:/post/followerPost/detail?id=" + form.getPostId();
	}


}
