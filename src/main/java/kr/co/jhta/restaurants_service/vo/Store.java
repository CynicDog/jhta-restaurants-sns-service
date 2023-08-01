package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Store {

    private int id;
    private int businessLicense;
    private String name;
    private String address;
    private String subscribed; 
    private int category;
    private int zipcode;
    private double latitude;
    private double longitude;
    private String text;
    private String phone;
    private int readCount;
    private Date createDate;
    private Date updateDate;
    private String disabled;
    private Owner owner;
    private String qualified;
    private Date challengeStartDate;
    private Date challengeEndDate;
}
