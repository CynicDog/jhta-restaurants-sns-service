package kr.co.jhta.restaurants_service.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.restaurants_service.dto.InquiryList;
import kr.co.jhta.restaurants_service.mapper.InquiryMapper;
import kr.co.jhta.restaurants_service.vo.inquiry.Inquiry;
@Service
public class inquiryService {
	@Autowired
	private InquiryMapper inquiryMapper;

	public static InquiryList getBoards(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void createBoard(Inquiry inquiry) {
		// TODO Auto-generated method stub
		
	}

	public static Inquiry getBoardByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void updateBoard(Inquiry inquiry) {
		// TODO Auto-generated method stub
		
	}

}
