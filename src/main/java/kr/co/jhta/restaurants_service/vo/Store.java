package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Alias("Store")
public class Store {

    private int id;
    private String name;
    private String businessLicense;
    private String address;
    private int category;
    private int zipcode;
    private double latitude;
    private double longitude;
    private String description;
    private String phone;
    private int readCount;
    private Date createDate;
    private Date updateDate;
    private String disabled;
    private Owner owner;
}
