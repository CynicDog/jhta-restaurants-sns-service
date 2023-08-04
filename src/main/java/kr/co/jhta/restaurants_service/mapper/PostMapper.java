package kr.co.jhta.restaurants_service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.Post;

@Mapper
public interface PostMapper {
	void insertPost(Post post);
	
	void updatePost(int postId);
	
	void deletePost(int postId);
	
	List<Post> getAllPost();
	
	Post getPostById(int postId);
	
	int getTotalRows(Map<String,Object> param);
}
