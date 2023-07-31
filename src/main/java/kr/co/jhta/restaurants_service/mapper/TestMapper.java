package kr.co.jhta.restaurants_service.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.jhta.restaurants_service.vo.Test;

@Mapper
public interface TestMapper {
	void insertTest(Test test);

}
