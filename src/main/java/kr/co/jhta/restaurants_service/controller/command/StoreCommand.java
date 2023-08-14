package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;

@Getter
public class StoreCommand {

    private String name;
    private String phone;
    private String businessLicense;
    private String description;
    private String address;
    private String zipCode;
    private String addressDetail;
    private Double longitude;
    private Double latitude;
}
