package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.user.Otp;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface OtpRepository extends PagingAndSortingRepository<Otp, Integer> {

    Otp findByEmail(String email);

    @Query("select exists (select 1 from OTP where otp_code = :otpCode and email = :email)")
    boolean validateByEmail(String otpCode, String email);
}
