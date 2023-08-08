package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import kr.co.jhta.restaurants_service.dto.SearchedStore;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagedStores {

	private Pagination pagination;
	private List<SearchedStore> stores;
}
