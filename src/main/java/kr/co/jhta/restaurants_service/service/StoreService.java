package kr.co.jhta.restaurants_service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.vo.Store;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StoreService {
	
	@Autowired
	private final StoreMapper storeDao;
	
	public List<Store> getAllStores() {
		List<Store> stores = storeDao.getAllStores();
		return stores;
	}
	
}
