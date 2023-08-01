package kr.co.jhta.restaurants_service.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dao.StoreDao;
import kr.co.jhta.restaurants_service.vo.Store;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {

	private final StoreDao storeDao;
	
	public List<Store> getAllStores() {
		List<Store> stores = storeDao.getAllStores();
		return stores;
	}
	
}
