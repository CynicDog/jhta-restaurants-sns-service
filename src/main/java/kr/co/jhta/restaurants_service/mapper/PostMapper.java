package kr.co.jhta.restaurants_service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.post.Post;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PostMapper {
	void insertPost(Post post);
	
	void updatePost(int postId);
	
	void deletePost(int postId);
	
	List<Post> getAllPosts();
	
	Post getPostById(int postId);
	
	int getTotalRows(Map<String,Object> param);
    List<Post> getPostsPaginatedOfFollowersByFollowed(@Param("start") int start, @Param("end") int end, @Param("followedId") int followedId);
}
