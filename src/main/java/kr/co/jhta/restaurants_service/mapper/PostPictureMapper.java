package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.post.PostPicture;

@Mapper
public interface PostPictureMapper {
	void insertPostPicture(List<PostPicture> postPictures);
}
