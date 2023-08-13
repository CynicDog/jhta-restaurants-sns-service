package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;

@Getter
public class StoreOpenTimeCommand {

    private String day;
    private String openingTime;
    private String closingTime;

    public StoreOpenTimeCommand(String day, String openingTime, String closingTime) {
        this.day = day;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
    }
}
