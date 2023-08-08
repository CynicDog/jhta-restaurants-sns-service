package kr.co.jhta.restaurants_service.vo.user;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;

@Getter @Setter
@Alias("Otp")
@Table("OTP")
public class Otp {

    @Id
    private int id;
    private String email;
    private String otpCode;
    private Date createDate;

    public Otp(String email) {
        this.createDate = new Date();
        this.email = email;
    }

    public Otp(String email, String otpCode) {
        this.createDate = new Date();
        this.email = email;
        this.otpCode = otpCode;
    }
}
