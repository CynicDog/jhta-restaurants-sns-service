package kr.co.jhta.restaurants_service.controller.command;

import lombok.Getter;

@Getter
public class FoodCommand {

    private String foodName;
    private String foodPrice;

    public FoodCommand(String foodName, String foodPrice) {
        this.foodName = foodName;
        this.foodPrice = foodPrice;
    }
}
