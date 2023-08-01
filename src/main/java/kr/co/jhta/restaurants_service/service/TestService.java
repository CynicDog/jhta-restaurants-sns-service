package kr.co.jhta.restaurants_service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dao.CustomerDao;
import kr.co.jhta.restaurants_service.vo.Test;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TestService {
	@Autowired
	private final CustomerDao customerDao;
	
	public void insertTest(Test test) {
		//customerDao.insertTest(test);
	}
	
}
