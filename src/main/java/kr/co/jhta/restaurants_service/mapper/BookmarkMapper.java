package kr.co.jhta.restaurants_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.store.Bookmark;

@Mapper
public interface BookmarkMapper {
	
	void insertBookmark(int customerId, int storeId);

	void deleteBookmark(int customerId, int storeId);
	
	List<Bookmark> getBookmarksByCustomerId(int customerId);
}
