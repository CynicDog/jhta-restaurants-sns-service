package kr.co.jhta.restaurants_service.mapper;

import kr.co.jhta.restaurants_service.vo.Otp;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OtpMapper {

    void insert(Otp otp);

    Otp findByUserId(int userId);

    void update(Otp otp);

    void delete(Otp otp);
}
