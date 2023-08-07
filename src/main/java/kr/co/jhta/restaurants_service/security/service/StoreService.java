package kr.co.jhta.restaurants_service.security.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dto.Pagination;
import kr.co.jhta.restaurants_service.dto.SearchedStore;
import kr.co.jhta.restaurants_service.dto.PagedStores;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.vo.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class StoreService {
	
	@Autowired
	private final StoreMapper storeMapper;

	
	
	public List<Store> getAllStores() {
		List<Store> stores = storeMapper.getAllStores();
		return stores;
	}
	
	public PagedStores getStores(Map<String,Object> param){
		
		int totalRows = storeMapper.getTotalRows(param);
		// 요청한 페이지를 pagination 객체에 저장
		int page = (int)param.get("page");
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		
		PagedStores result = new PagedStores();
		param.put("begin", begin);
		param.put("end", end);
		
		List<SearchedStore> stores = storeMapper.getStores(param);
		log.info("서비스 : '{}'",stores);
		result.setPagination(pagination);
		result.setStores(stores);;
		
	
		return result;
	}
	
}
