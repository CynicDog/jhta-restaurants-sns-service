package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.post.PostComment;

@Mapper
public interface PostCommentMapper {

	void insertComment(PostComment postComment);
	List<PostComment> getCommentsByPostId(int postId);
}
