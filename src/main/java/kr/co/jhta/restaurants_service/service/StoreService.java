package kr.co.jhta.restaurants_service.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import kr.co.jhta.restaurants_service.controller.command.FoodCommand;
import kr.co.jhta.restaurants_service.controller.command.StoreCommand;
import kr.co.jhta.restaurants_service.controller.command.StoreOpenTimeCommand;
import kr.co.jhta.restaurants_service.repository.FoodRepository;
import kr.co.jhta.restaurants_service.repository.StoreOpenTimeRepository;
import kr.co.jhta.restaurants_service.repository.StoreRepository;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dto.Pagination;
import kr.co.jhta.restaurants_service.dto.SearchedStore;
import kr.co.jhta.restaurants_service.dto.StoreDetailDto;
import kr.co.jhta.restaurants_service.dto.VisitedStore;
import kr.co.jhta.restaurants_service.dto.BookmarkedStore;
import kr.co.jhta.restaurants_service.dto.PagedStores;
import kr.co.jhta.restaurants_service.mapper.FoodMapper;
import kr.co.jhta.restaurants_service.mapper.ReviewMapper;
import kr.co.jhta.restaurants_service.mapper.StoreMapper;
import kr.co.jhta.restaurants_service.mapper.StoreOpenTimeMapper;
import kr.co.jhta.restaurants_service.vo.store.Bookmark;
import kr.co.jhta.restaurants_service.vo.store.Food;
import kr.co.jhta.restaurants_service.vo.store.Store;
import kr.co.jhta.restaurants_service.vo.store.StoreOpenTime;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@ToString
@Transactional
public class StoreService {

	private final StoreMapper storeMapper;
	private final FoodMapper foodMapper;
	private final StoreOpenTimeMapper storeOpenTimeMapper;
	private final StoreRepository storeRepository;
	private final FoodRepository foodRepository;
	private final StoreOpenTimeRepository storeOpenTimeRepository;

	public StoreService(StoreMapper storeMapper,
						FoodMapper foodMapper,
						StoreOpenTimeMapper storeOpenTimeMapper,
						StoreRepository storeRepository,
						FoodRepository foodRepository,
						StoreOpenTimeRepository storeOpenTimeRepository) {
		this.storeMapper = storeMapper;
		this.foodMapper = foodMapper;
		this.storeOpenTimeMapper = storeOpenTimeMapper;
		this.storeRepository = storeRepository;
		this.foodRepository = foodRepository;
		this.storeOpenTimeRepository = storeOpenTimeRepository;
	}

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

	public void insertStore(StoreCommand storeCommand, List<FoodCommand> foods, List<StoreOpenTimeCommand> storeOpenTimes, SecurityUser securityUser) {

		Store store = storeCommand.toStore(storeCommand);
		store.setOwner(securityUser.getUser());
		storeRepository.save(store);

		foods.stream()
				.map(FoodCommand::toFood)
				.forEach(food -> {
					food.setStore(store);
					foodRepository.save(food);
				});

		storeOpenTimes.stream()
				.map(StoreOpenTimeCommand::toStoreOpenTime)
				.forEach(storeOpenTime -> {
					storeOpenTime.setStore(store);
					storeOpenTimeRepository.save(storeOpenTime);
				});
	}
	
	public StoreDetailDto getStoreDetail(int storeId) {
		StoreDetailDto dto = new StoreDetailDto();
		
		Store store = storeMapper.getStoreById(storeId);
		dto.setStore(store);
		
		List<Food> foods = foodMapper.getFoodsByStoreId(storeId);
		dto.setFoods(foods);
		
		List<StoreOpenTime> openTimes = storeOpenTimeMapper.getStoreOpenTimesByStoreId(storeId);
		dto.setOpenTimes(openTimes);
		
		Map<String, Object> map = getXY(store.getLatitude(), store.getLongitude());
		map.put("storeId", storeId);
		List<Store> stores = storeMapper.getStoresByXY(map);
		
		dto.setStores(stores);
		
		return dto;
	}
	
	private Map<String, Object> getXY(double lat, double lon) {
		Map<String, Object> map = new HashMap<>();
		
		double mForLatitude =(1 /(6371* 1 *(Math.PI/ 180)))/ 1000;
		  //m당 x 좌표 이동 값
		double mForLongitude =(1 /(6371* 1 *(Math.PI/ 180)* Math.cos(Math.toRadians(lat))))/ 1000;

	  //현재 위치 기준 검색 거리 좌표
		double maxY = lat +(getDistance(lat)* mForLatitude);
		double minY = lat -(getDistance(lat)* mForLatitude);
		double maxX = lon +(getDistance(lat)* mForLongitude);
		double minX = lon -(getDistance(lat)* mForLongitude);

		map.put("minX", minX);
		map.put("maxX", maxX);
		map.put("minY", minY);
		map.put("maxY", maxY);
		
		return map;
	}
	
	private double getDistance(double lat) {
		return 6371*Math.cos(lat)*(Math.PI/ 180);
	}
	
	
  
	public List<Store> getStoresByUserId(int userId) {
		List<Store> stores = storeRepository.findStoresByOwnerId(userId);
		stores.forEach(store -> {
			log.info(store.getName());
		});
		return storeRepository.findStoresByOwnerId(userId);
	}

	public List<BookmarkedStore> getBookmarkedStore(Integer customerId) {
		log.info("가게서비스 getBookmarkedStore : ");
		List<BookmarkedStore> stores = storeMapper.getBookmarkedStoresByUserId(customerId);
		return stores;
	}

	public List<VisitedStore> getVisitedStore(Map<String,Object> param) {
		List<VisitedStore> stores;
		if(param.get("customerId")==null) {
			log.info("param.get(\"customerId\") : " + param.get("customerId"));
			stores = storeMapper.getVisitedStores(param);
		}else {
			stores = storeMapper.getVisitedStoresById(param);
		}
		
		log.info("가게서비스 getVisitedStore 결과 stores : '{}'",stores);
		return stores;
	}
	
	public List<StoreOpenTime> getStoreOpenTimesById(int storeId) {
		
		return storeOpenTimeMapper.getStoreOpenTimesByStoreId(storeId);
	}

	public void updateReadCount(int storeId) {
		Store store = storeMapper.getStoreById(storeId);
		store.setReadCount(store.getReadCount() + 1);
		
		storeMapper.updateStore(store);

	}

	public Object changeBookmark(int storeId, String job, SecurityUser securityUser) {
		
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("storeId", storeId);
	    paramMap.put("customerId", securityUser.getUser().getId());

	    if ("Y".equals(job)) {
	        // 북마크 추가 로직
	        storeMapper.insertBookmark(paramMap);
	    } else if ("N".equals(job)) {
	        // 북마크 삭제 로직
	        storeMapper.deleteBookmark(paramMap);
	    }

	    // 변경된 북마크 상태를 반환
	    return getUpdatedBookmarkStatus(storeId, securityUser);
	}

	private Object getUpdatedBookmarkStatus(int storeId, SecurityUser securityUser) {
		return null;
	}

	public List<BookmarkedStore> getBookmarkedStoresByUserId(int id) {
		return null;
	}
	
	public Bookmark getBookmark(int storeId, int customerId) {
	    Bookmark bookmark = storeMapper.getBookmarkByStoreIdAndCustomerId(storeId, customerId);
	    return bookmark;
	}

}
