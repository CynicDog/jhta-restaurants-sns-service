package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;
import lombok.Setter;

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
