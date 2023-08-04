package kr.co.jhta.restaurants_service.vo;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Getter @Setter @Alias("Otp")
public class Otp {

    private int id;
    private String email;
    private String otpCode;

    @CreatedDate
    private Date createDate;

    public Otp(String email) {
        this.email = email;
    }

    public Otp(String email, String otpCode) {
        this.email = email;
        this.otpCode = otpCode;
    }
}
