package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.jhta.restaurants_service.vo.post.PostData;

@Mapper
public interface PostDataMapper {
	void insertPostData(PostData postData);
	
	List<PostData> getPostDataByPostId(int postId);
}
