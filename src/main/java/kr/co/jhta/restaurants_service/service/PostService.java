package kr.co.jhta.restaurants_service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public void insertPost(String title, String content, String pictureName) {
		Post post = new Post();
		post.setTitle(title);
		post.setContent(content);
		
		postmapper.insertPost(post);
		
		PostPicture postPicture = new PostPicture();
		postPicture.setPictureName(pictureName);
		postPicture.setPost(post);
		
		postPictureMapper.insertPostPicture(postPicture);
	}
	
	public void updatePost(String title, String content, String pictureName) {
		
	}
	
}
