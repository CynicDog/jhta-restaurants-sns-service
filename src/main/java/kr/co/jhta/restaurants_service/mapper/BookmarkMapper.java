package kr.co.jhta.restaurants_service.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {
	
	void insertBookmark(int customerId, int storeId);

	void deleteBookmark(int customerId, int storeId);

}
