package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Getter @Setter
public class UserCommand {

    @NotBlank(message = "필수 입력 사항입니다.")
    private String username;

    @NotBlank(message = "필수 입력 사항입니다.")
    private String password;

    @Pattern(regexp = "^[가-힣]{2,5}$", message = "올바른 형식의 성함을 적어주세요.")
    private String fullName;

    @NotBlank(message = "필수 입력 사항입니다.")
    @Email(message = "올바른 형식의 이메일을 적어주세요.")
    private String email;

    @Pattern(regexp = "^010-[0-9]{4}-[0-9]{4}$", message = "올바른 형식의 전화번호를 적어주세요.")
    private String phone;

    @NotNull(message = "필수 입력 사항입니다.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    @NotBlank(message = "필수 입력 사항입니다.")
    private String gender;
}
