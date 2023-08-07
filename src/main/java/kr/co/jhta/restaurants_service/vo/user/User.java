package kr.co.jhta.restaurants_service.vo.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;

@Getter @Setter
@Alias("Customer")
@Table("CUSTOMERS")
public class User {

    @Id
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private Date birthday;
    private String gender;
    private Date createDate;
    private Date updateDate;
    private DISABLED disabled;
    private String nickname;
    private String profilePictureName;
    private TYPE type;

    public User() {

        this.createDate = new Date(); // default to current time
        this.updateDate = new Date(); // default to current time
        this.disabled = DISABLED.NO; // default to `NO`
    }

    public User(String username, String password, String fullName, String email, String phone, Date birthday, String gender, Date createDate, Date updateDate, TYPE type) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.birthday = birthday;
        this.gender = gender;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.type = type;

        this.createDate = new Date(); // default to current time
        this.updateDate = new Date(); // default to current time
        this.disabled = DISABLED.NO; // default to `NO`
    }

    public enum TYPE {
        ADMIN, CUSTOMER, OWNER
    }

    public enum DISABLED {
        YES, NO
    }
}
