package kr.co.jhta.restaurants_service.dto;

import java.util.List;

import kr.co.jhta.restaurants_service.vo.Store;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoresPage {

	private Pagination pagination;
	private List<SearchedStore> stores;
}
