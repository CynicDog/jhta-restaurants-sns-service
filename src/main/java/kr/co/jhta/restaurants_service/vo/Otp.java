package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Getter @Setter @Alias("Otp")
public class Otp {

    private int userId;
    private String otpCode;

    @CreatedDate
    private Date createDate;

    public Otp(int userId) {
        this.userId = userId;
    }
}
