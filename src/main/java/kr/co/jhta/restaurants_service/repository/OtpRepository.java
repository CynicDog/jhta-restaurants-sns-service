package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.user.Otp;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface OtpRepository extends PagingAndSortingRepository<Otp, Integer> {

    Otp findByEmail(String email);

//    boolean validateByEmail(Otp otp);
}
