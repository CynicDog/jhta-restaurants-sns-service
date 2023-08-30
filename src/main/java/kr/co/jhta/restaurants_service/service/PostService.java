package kr.co.jhta.restaurants_service.service;

import java.io.IOException;
import java.util.List;

import kr.co.jhta.restaurants_service.controller.command.PostCommentCommand;
import kr.co.jhta.restaurants_service.controller.command.PostDataCommand;
import kr.co.jhta.restaurants_service.dto.PostDto;
import kr.co.jhta.restaurants_service.projection.Projection;
import kr.co.jhta.restaurants_service.repository.FollowsRepository;
import kr.co.jhta.restaurants_service.repository.PostDataRepository;
import kr.co.jhta.restaurants_service.repository.PostRepository;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;

import org.jboss.logging.Logger;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.mapper.PostMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.BookmarkMapper;
import kr.co.jhta.restaurants_service.mapper.PostCommentMapper;
import kr.co.jhta.restaurants_service.mapper.PostDataMapper;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostComment;
import kr.co.jhta.restaurants_service.vo.post.PostData;
import kr.co.jhta.restaurants_service.vo.store.Bookmark;
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
	private final BookmarkMapper bookmarkMapper;
	private final PostRepository postRepository;
	private final FollowsRepository followsRepository;
	private final PostDataRepository postDataRepository;
	
	public List<Post> getThreeRecentPosts(){
		List<Post> posts = postmapper.getRecentPostsThree();
		return posts;
	}
	
	public List<Post> getRecentPostsThreeOfFollowersByFollowed(SecurityUser securityUser){
		logger.info(securityUser.getUser());
		List<Post> posts = postmapper.getRecentPostsThreeOfFollowersByFollowed(securityUser.getUser().getId());
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

	public PostDto selectPost(int postId, SecurityUser securityUser) {
		PostDto dto = new PostDto();

		Post post = postmapper.getPostById(postId);
		
		List<PostData> postDatas = postDataMapper.getPostDataByPostId(postId);
		List<PostComment> postComments = postCommentMapper.getCommentsByPostId(postId);
		
		if(securityUser != null) {
			List<Bookmark> bookmarks = bookmarkMapper.getBookmarksByCustomerId(securityUser.getUser().getId());
			dto.setBookmark(bookmarks);
		}

		dto.setPost(post);
		dto.setPostData(postDatas);
		dto.setPostComments(postComments);

		return dto;
	}

	public void updatePost(String title, String content, String pictureName) {

	}

    public Page<Projection.Post> getNonBlockedPostsByCustomerIdOrderByCreateDate(int id, Post.BLOCKED no, Integer page, Integer limit) {

		Page<Projection.Post> postsPaginated = postRepository.findPostsByCustomerIdAndBlockedOrderByCreateDate(id, no, PageRequest.of(page, limit));

		return postsPaginated;
    }


	public void insertPostComment(PostCommentCommand form, SecurityUser securityUser) throws IOException{
		PostComment postComment = new PostComment();
		postComment.setContent(form.getContent());
		
		Post post = postmapper.getPostById(form.getPostId());
		postComment.setPost(post);
		postComment.setCustomer(securityUser.getUser());
		
		postCommentMapper.insertComment(postComment);
		
	}

    public long getPostsCountByCustomerId(Integer customerId) {
		return postRepository.countByCustomerId(customerId);
    }
    
    public List<Post> getAllPosts(int page, int limit){
    	int start = (page - 1) * limit;
    	int end = start + limit;
    	
    	return postmapper.getAllPosts(start, end);
    }

    public List<Post> getPostsPaginatedOfFollowersByFollowed(int page, int limit, SecurityUser securityUser) {

		int start = (page - 1) * limit;
		int end = start + limit;

		return postmapper.getPostsPaginatedOfFollowersByFollowed(start, end, securityUser.getUser().getId());
    }

	public Page<PostData> getPostDataByCustomerIdOrderByCreateDateDesc(int id, Integer page, Integer limit) {

		return postDataRepository.findByUserIdOrderByCreateDateDesc(id, PageRequest.of(page, limit));
	}
}
