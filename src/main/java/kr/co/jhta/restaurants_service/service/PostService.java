package kr.co.jhta.restaurants_service.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.form.PostData;
import kr.co.jhta.restaurants_service.mapper.PostMapper;
import kr.co.jhta.restaurants_service.mapper.PostPictureMapper;
import kr.co.jhta.restaurants_service.vo.post.Post;
import kr.co.jhta.restaurants_service.vo.post.PostPicture;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostService {
	
	@Autowired
	private final PostMapper postmapper;
	
	@Autowired
	private final PostPictureMapper postPictureMapper;
	
	public List<Post> getAllPosts(){
		List<Post> posts = postmapper.getAllPosts();
		return posts;
	}
	
//	public void insertPost(String title, String content, String pictureName) {
//		Post post = new Post();
//		post.setTitle(title);
//		post.setContent(content);
//		
//		postmapper.insertPost(post);
//		
//		PostPicture postPicture = new PostPicture();
//		postPicture.setPictureName(pictureName);
//		postPicture.setPost(post);
//		
//		postPictureMapper.insertPostPicture(postPicture);
//	}
	
//	public void insertPosts(String title, String subTitle, List<PostData> postData) {
//	    List<Post> posts = new ArrayList<>();
//	    List<PostPicture> postPictures = new ArrayList<>();
//
//	    for (int i=0; i < posts.size() ; i++) {
//	        Post post = new Post();
//	        post.setStore(posts.get(i).getStore());
//	        post.setContent(posts.get(i).getContent());
//	        posts.add(post);
//
//	        PostPicture postPicture = new PostPicture();
//	        postPicture.setPictureName(posts.get(i).getPictureName());
//	        postPicture.setPost(post);
//	        postPictures.add(postPicture);
//	    }
//	    
//	    postmapper.insertPost(posts);
//	    postPictureMapper.insertPostPicture(postPictures);
//	}
	
	public void updatePost(String title, String content, String pictureName) {
		
	}
	
}
