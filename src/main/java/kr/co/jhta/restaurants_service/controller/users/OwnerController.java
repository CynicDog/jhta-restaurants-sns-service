package kr.co.jhta.restaurants_service.controller.users;

import kr.co.jhta.restaurants_service.controller.command.FoodCommand;
import kr.co.jhta.restaurants_service.controller.command.UserCommand;
import kr.co.jhta.restaurants_service.security.domain.SecurityUser;
import kr.co.jhta.restaurants_service.security.service.UserService;
import kr.co.jhta.restaurants_service.service.OtpService;
import kr.co.jhta.restaurants_service.vo.store.Food;
import org.jboss.logging.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/owner")
public class OwnerController {

    private final UserService userService;
    private final OtpService otpService;
    Logger logger = Logger.getLogger(UserController.class);

    public OwnerController(UserService userService, OtpService otpService) {
        this.userService = userService;
        this.otpService = otpService;
    }

    @GetMapping("/unique-food")
    public ResponseEntity uniqueFood(@RequestParam("foodName") String toBeChecked, HttpSession httpSession) {

        List<FoodCommand> foods = (List<FoodCommand>) httpSession.getAttribute("foods");

        if (foods == null) { foods = new ArrayList<>(); }

        return foods
                .stream()
                .map(FoodCommand::getFoodName)
                .anyMatch(foodName -> foodName.equals(toBeChecked)) ?
                ResponseEntity.badRequest().body("Already exists :(") :
                ResponseEntity.ok().body("Unique food name!");
    }

    @PostMapping("/remove-food")
    public ResponseEntity removeFood(@RequestParam("foodName") String toBeRemoved, HttpSession httpSession) {

        List<FoodCommand> foods = (List<FoodCommand>) httpSession.getAttribute("foods");

        if (foods == null) { foods = new ArrayList<>(); }

        foods.stream()
                .map(FoodCommand::getFoodName)
                .filter(foodName -> !toBeRemoved.equals(foodName))
                .collect(Collectors.toList());

        httpSession.setAttribute("foods", foods);

        return ResponseEntity.ok().body("Deleted successfully!");
    }
    @PostMapping("/register-food")
    public ResponseEntity<FoodCommand> registerFood(@RequestBody FoodCommand foodCommand, HttpSession httpSession) {

        List<FoodCommand> foods = (List<FoodCommand>) httpSession.getAttribute("foods");

        if(foods == null) {
            foods = new ArrayList<>();
        }

        foods.add(foodCommand);
        httpSession.setAttribute("foods", foods);

        return new ResponseEntity<>(foodCommand, HttpStatus.OK);
    }


    @GetMapping("/register")
    public String registerPage(@AuthenticationPrincipal SecurityUser securityUser) {

        return "/user/owner/store-register-form";
    }

    @GetMapping("/my-page")
    public String myPage(@AuthenticationPrincipal SecurityUser securityUser, Model model) {

        model.addAttribute("ownerEmail", securityUser.getUser().getEmail());

        return "/user/owner/my-page";
    }


    @ResponseBody
    @PostMapping(value = "/signup", consumes = "application/json")
    public ResponseEntity signup(@RequestBody UserCommand userCommand) {

        userService.insertOwner(userCommand);
        return ResponseEntity.ok("Valid otp!");

        // TODO: Session clear
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("userCommand", new UserCommand());
        return "user/owner/signup-form";
    }
}
