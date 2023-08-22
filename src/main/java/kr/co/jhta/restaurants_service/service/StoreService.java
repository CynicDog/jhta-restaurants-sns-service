package kr.co.jhta.restaurants_service.service;

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
		
		return dto;
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

}
