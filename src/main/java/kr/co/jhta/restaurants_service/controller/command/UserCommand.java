package kr.co.jhta.restaurants_service.controller.command;

import kr.co.jhta.restaurants_service.vo.Customer;
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

    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private Date birthday;
    private String gender;

    public static Customer toCustomer(UserCommand userCommand) {
        return new Customer(
                userCommand.getUsername(),
                userCommand.getPassword(),
                userCommand.getFullName(),
                userCommand.getEmail(),
                userCommand.getPhone(),
                userCommand.getBirthday(),
                userCommand.getGender()
        );
    }
}
