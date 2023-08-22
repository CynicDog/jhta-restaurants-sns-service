package kr.co.jhta.restaurants_service.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import kr.co.jhta.restaurants_service.controller.command.ReviewCommentCommand;
import kr.co.jhta.restaurants_service.dto.PostDto;
import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.PostRepository;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;

import org.jboss.logging.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;

import kr.co.jhta.restaurants_service.mapper.PostMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.PostCommentMapper;
import kr.co.jhta.restaurants_service.mapper.PostDataMapper;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostComment;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.review.Review;
import kr.co.jhta.restaurants_service.vo.review.ReviewComment;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostService {

	private final Logger logger = Logger.getLogger(PostService.class);

	private final PostMapper postmapper;
	private final StoreMapper storeMapper;
	private final PostDataMapper postDataMapper;
	private final PostCommentMapper postCommentMapper;
	private final PostRepository postRepository;

	public List<Post> getAllPosts(){
		List<Post> posts = postmapper.getAllPosts();
		return posts;
	}
	
	public List<Store> getStoresByKeyword(String keyword) {

		return storeMapper.getStoreByName(keyword);
    }

	public void insertPost(Post post, List<PostDataCommand> postDataCommands) throws IOException {

		postmapper.insertPost(post);

		postDataCommands.stream()
				.map(postDataCommand -> {
					Store store = storeMapper.getStoreById(postDataCommand.getStoreId());
          
					return new PostData(post, store, postDataCommand.getContent(), postDataCommand.getChooseFile().getOriginalFilename());
				})
				.forEach(postData -> {
					postDataMapper.insertPostData(postData);
				});
    }

	public PostDto selectPost(int postId) {
		PostDto dto = new PostDto();

		Post post = postmapper.getPostById(postId);
		List<PostData> postDatas = postDataMapper.getPostDataByPostId(postId);
		List<PostComment> postComments = postCommentMapper.getCommentsByPostId(postId);

		dto.setPost(post);
		dto.setPostData(postDatas);
		dto.setPostComments(postComments);

		return dto;
	}

	public void updatePost(String title, String content, String pictureName) {

	}

	public List<Post> getPostsByCustomerId(int id) {
		return postRepository.findPostsByCustomerId(id);
	}

    public Page<Projection.Post> getNonBlockedPostsByCustomerIdOrderByCreateDate(int id, Post.BLOCKED no, Integer page, Integer limit) {

		Page<Projection.Post> postsPaginated = postRepository.findPostsByCustomerIdAndBlockedOrderByCreateDate(id, no, PageRequest.of(page, limit));

		return postsPaginated;
    }

	public void insertPostComment(PostComment form, SecurityUser securityUser) {
		PostComment postComment = new PostComment();
		postComment.setContent(form.getContent());
		
		Post post = postmapper.getPostById(form.getPost().getId());
		postComment.setPost(post);
		postComment.setCustomer(securityUser.getUser());
		
		postCommentMapper.insertComment(postComment);
		
	}
}
