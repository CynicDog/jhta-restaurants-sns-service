package kr.co.jhta.restaurants_service.dto;

import java.util.List;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PagedStores {

	private Pagination pagination;
	private List<SearchedStore> stores;
}