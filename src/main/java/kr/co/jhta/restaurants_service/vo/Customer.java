package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("Customer")
public class Customer {

    private int id;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private Date birthday;
    private String gender;
    private String grade;
    private Date createDate;
    private Date updateDate;
    private String disabled;
    private String nickname;
    private String profilePictureName;

}