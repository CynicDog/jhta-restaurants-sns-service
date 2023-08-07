package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import kr.co.jhta.restaurants_service.dto.SearchedStore;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagedStores {

	private Pagination pagination;
	private List<SearchedStore> stores;
}
