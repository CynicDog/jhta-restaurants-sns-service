package kr.co.jhta.restaurants_service.vo.store;

import java.util.Date;
import java.util.Optional;

import kr.co.jhta.restaurants_service.vo.user.User;
import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;

@Getter @Setter
@Alias("Store")
@Entity
@Table(name = "STORES")
public class Store {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String phone;

    @Column(name = "business_license")
    private String businessLicense;

    private String description;
    private String category;

    private String address;
    private String zipcode;

    @Column(name = "address_detail")
    private String addressDetail;

    private double latitude;
    private double longitude;


    @Column(name = "read_count")
    private int readCount;

    @CreatedDate
    @Column(name = "create_date")
    private Date createDate;

    @LastModifiedDate
    @Column(name = "update_date")
    private Date updateDate;

    private DISABLED disabled;

    @ManyToOne
    private User owner;
    private String addressDetail;

    public Store() {


        this.createDate = new Date(); // default to current time
        this.updateDate = new Date(); // default to current time
        this.disabled = DISABLED.NO; // default to `NO`
    }

    public Store(String category) {
        if (CATEGORY.valueOf(category) != null) {
            // String
            this.category = CATEGORY.ASIAN.name();
        }
    }

    public Store(String name, String phone, String businessLicense, String description, String category, String address, String zipcode, String addressDetail, double latitude, double longitude) {
        this.name = name;
        this.phone = phone;
        this.businessLicense = businessLicense;
        this.description = description;
        this.category = Optional.ofNullable(CATEGORY.valueOf(category.toUpperCase()).name()).orElse(null);
        this.address = address;
        this.zipcode = zipcode;
        this.addressDetail = addressDetail;
        this.latitude = latitude;
        this.longitude = longitude;

        this.readCount = 0;
        this.createDate = new Date(); // default to current time
        this.updateDate = new Date(); // default to current time
        this.disabled = DISABLED.NO; // default to `NO`
    }

    public enum DISABLED {
        YES, NO
    }

    public enum CATEGORY {
        KOREAN, JAPANESE, CHINESE, ASIAN, WESTERN, FASTFOOD, SNACK, CHICKEN,
        BAR, ITALIAN, CAFE, PIZZA, MEXICAN, BRUNCH, PASTRY, GOURMET, BARBECUE
    }
}