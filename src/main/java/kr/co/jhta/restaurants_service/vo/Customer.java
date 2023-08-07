package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Getter
@Setter
@NoArgsConstructor
@Alias("Customer")
@Table("CUSTOMERS")
public class Customer {

    @Id
    private int id;
    private String username;
    private String password;

    @Column(value = "FULLNAME")
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

    public Customer(String username, String password, String fullName, String email, String phone, Date birthday, String gender) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.birthday = birthday;
        this.gender = gender;
        this.grade = GRADE.SILVER.toString();
        this.createDate = new Date();
        this.updateDate = new Date();
        this.disabled = "N";
    }

    public enum GRADE {
        SILVER, GOLD, PLATINUM
    }
}